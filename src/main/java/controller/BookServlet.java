package controller;

import config.ResourceConfig;
import model.Book;
import model.BookType;
import model.Customer;
import model.CustomerType;
import service.IBookService;
import service.IBookTypeService;
import service.mysql.MSBookService;
import service.mysql.MSBookTypeService;
import service.mysql.MSCustomerService;
import service.mysql.MSCustomerTypeService;
import utils.DateUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static session.Session.getCustomerLoginSession;

@WebServlet(name = "BookServlet", value = "/books")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class BookServlet extends HttpServlet {
    private IBookService iBookService;
    private IBookTypeService iBookTypeService;
    @Override
    public void init() throws ServletException {
        iBookService = new MSBookService();
        iBookTypeService = new MSBookTypeService();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");
        if (message != null) {
            req.setAttribute("message", message );
        }

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateBook(req, resp);
                break;
            case "edit":
                showEditBook(req, resp);
                break;
            case "delete":

                break;
            case "view":
                showDetailBook(req,resp);
                break;
            default:
                showListBooks(req, resp);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createBook(req, resp);
                break;
            case "edit":
                editBook(req, resp);
                break;
            case "delete":
                deleteBook(req, resp);
                break;

            default:
                break;
        }
    }

    private void deleteBook(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Customer customerLogin = (Customer) session.getAttribute("customerLogin");
        req.setAttribute("customerLogin",customerLogin);
        if(customerLogin ==null){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_signin.jsp");
            requestDispatcher.forward(req, resp);
        } else if (customerLogin.getIdType() == 3){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_user_not_allow.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            long id = Long.parseLong(req.getParameter("idDelete"));
            iBookService.deleteBookById(id);
            resp.sendRedirect("/books?message=delete");
        }
    }

    private void editBook(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Customer customerLogin = (Customer) session.getAttribute("customerLogin");
        req.setAttribute("customerLogin",customerLogin);
        if(customerLogin ==null){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_signin.jsp");
            requestDispatcher.forward(req, resp);
        } else if (customerLogin.getIdType() == 3){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_user_not_allow.jsp");
            requestDispatcher.forward(req, resp);
        } else {

            List<String> errors = new ArrayList<>();
            Book book = new Book();

//        Book(long id, String image, String name, String author,
//        long price, long avaiable, long quantity, Date dateAdd,
//        long idBookType)
            //image
            Part part = isValidImage(req, book, errors);
            //name
            String name = req.getParameter("name");
            book.setName(name);
            //author
            String author = req.getParameter("author");
            book.setAuthor(author);
            //price
            long price = Long.parseLong(req.getParameter("price"));
            book.setPrice(price);
            //avaiable
            long avaiable = Long.parseLong(req.getParameter("avaiable"));
            book.setAvaiable(avaiable);
            //quantity
            long quantity = Long.parseLong(req.getParameter("quantity"));
            book.setQuantity(quantity);
            //dateAdd
            String sdateAdd = req.getParameter("dateAdd");
            Date dateAdd = DateUtils.formatDate(sdateAdd);
            book.setDateAdd(dateAdd);
            //idBookType
            long idBookType = Long.parseLong(req.getParameter("idBookType"));
            book.setIdBookType(idBookType);


            List<BookType> bookTypes = iBookTypeService.getAllBookTypes();
            req.setAttribute("bookTypes", bookTypes);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard + "book/edit.jsp");

            if (errors.size() == 0) {
                long idBook = Long.parseLong(req.getParameter("id"));
                book.setId(idBook);
                Book bookDB = iBookService.findBookById(book.getId());
                if (book.getImage() != null) {
                    if (bookDB.getImage() != null && !bookDB.getImage().equals(book.getImage()) && part != null) {
                        handleEditImageUploadAdvanced(part);
                    }
                }
                req.setAttribute("message", "editsucess");
                iBookService.editBook(book);
                resp.sendRedirect("/books?message=editsuccess");
            } else {
                req.setAttribute("errors", errors);
                req.setAttribute("book", book);
                requestDispatcher.forward(req, resp);
            }
        }
    }

    private void handleEditImageUploadAdvanced(Part part) throws IOException {
        String fileName = extractFileName(part);
        String appRealPath = getServletContext().getRealPath("/") + "images";
        File file = new File(appRealPath);
        if (!file.exists()) {
            file.mkdir();
        }
        String nameFileServer = appRealPath + File.separator + fileName;
        System.out.println("Name file server: " + nameFileServer);
        part.write(nameFileServer);
        String nameFileProject = ResourceConfig.folderImageUrlProject + File.separator + fileName;
        System.out.println("Name file project: " + nameFileProject);
        part.write(nameFileProject);
    }
    private Part isValidImage(HttpServletRequest req, Book book, List<String> errors) throws ServletException, IOException {
        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);
            if(!fileName.equals("")){
                book.setImage(fileName);
                boolean check = iBookService.checkImageExists(fileName);
                if (check == true) {
                    return null;
                }else {
                    return part;
                }
            }
        }
        return null;
    }

    private void createBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Customer customerLogin = (Customer) session.getAttribute("customerLogin");
        req.setAttribute("customerLogin",customerLogin);
        if(customerLogin ==null){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_signin.jsp");
            requestDispatcher.forward(req, resp);
        } else if (customerLogin.getIdType() == 3){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_user_not_allow.jsp");
            requestDispatcher.forward(req, resp);
        } else {

            List<String> errors = new ArrayList<>();
            Book book = new Book();

//        Book(long id, String image, String name, String author,
//        long price, long avaiable, long quantity, Date dateAdd,
//        long idBookType)
            //name
            String name = req.getParameter("name");
            book.setName(name);
            //author
            String author = req.getParameter("author");
            book.setAuthor(author);
            //price
            long price = Long.parseLong(req.getParameter("price"));
            book.setPrice(price);
            //avaiable
            long avaiable = Long.parseLong(req.getParameter("avaiable"));
            book.setAvaiable(avaiable);
            isNumberLessThan1(req, avaiable, errors);
            //quantity
            long quantity = Long.parseLong(req.getParameter("quantity"));
            book.setQuantity(quantity);
            isNumberLessThan1(req, quantity, errors);
            //dateAdd
            String sdateAdd = req.getParameter("dateAdd");
            Date dateAdd = DateUtils.formatDate(sdateAdd);
            book.setDateAdd(dateAdd);
            //idBookType
            long idBookType = Long.parseLong(req.getParameter("idBookType"));
            book.setIdBookType(idBookType);

            List<BookType> bookTypes = iBookTypeService.getAllBookTypes();
            req.setAttribute("bookTypes", bookTypes);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard + "book/create.jsp");
            if (errors.size() == 0) {
                handleImageUpload(req, book, errors);
                iBookService.createBook(book);
                req.setAttribute("message", "Them thanh cong");
                requestDispatcher.forward(req, resp);
            } else {
                handleImageUpload(req, book, errors);
                req.setAttribute("errors", errors);
                req.setAttribute("book", book);
                requestDispatcher.forward(req, resp);
            }
        }
    }

    private void isNumberLessThan1(HttpServletRequest req, long number, List<String> errors){
        if(number < 1){
            errors.add("Số lượng ít nhất phải là 1");
        }
    }
    private void handleImageUpload(HttpServletRequest req, Book book, List<String> errors) throws ServletException, IOException {
        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);
            // refines the fileName in case it is an absolute path
            if(!fileName.equals("")){
                String appRealPath = getServletContext().getRealPath("/") + "images";
                File file = new File(appRealPath);
                if (!file.exists()) {
                    file.mkdir();
                }
                String nameFileServer = appRealPath + File.separator + fileName;
                System.out.println("Name file server: " + nameFileServer);
                part.write(nameFileServer);

                String nameFileProject = ResourceConfig.folderImageUrlProject + File.separator + fileName;

                System.out.println("Name file project: " + nameFileProject);
                part.write(nameFileProject);

                book.setImage(fileName);
            }
        }
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    private void showListBooks(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Customer customerLogin = (Customer) session.getAttribute("customerLogin");
        req.setAttribute("customerLogin",customerLogin);
        if(customerLogin ==null){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_signin.jsp");
            requestDispatcher.forward(req, resp);
        } else if (customerLogin.getIdType() == 3){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_user_not_allow.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            String kw = "";
            if (req.getParameter("kw") != null) {
                kw = req.getParameter("kw");
            }
            int idBookType = -1;
            if (req.getParameter("bt") != null && !req.getParameter("bt").equals("")) {
                idBookType = Integer.parseInt(req.getParameter("bt"));
            }
            int page = 1;
            if (req.getParameter("page") != null && !req.getParameter("page").equals("")) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            int limit = 3;
            if (req.getParameter("limit") != null && !req.getParameter("limit").equals("")) {
                limit = Integer.parseInt(req.getParameter("limit"));
            }

            List<Book> books = iBookService.getAllBookSearchingPagging(kw, idBookType,(page-1)*limit, limit);
            List<BookType> bookTypes = iBookTypeService.getAllBookTypes();

            int noOfRecords = iBookService.getNoOfRecords();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / limit);

            req.setAttribute("books", books);
            req.setAttribute("bookTypes", bookTypes);
            req.setAttribute("kw", kw);
            req.setAttribute("ct", idBookType);
            req.setAttribute("currentPage", page);
            req.setAttribute("noOfPages", noOfPages);

            String message = req.getParameter("message");
            if (message != null) {
                // delete: success
                req.setAttribute("message", message );
            }
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard +"book/books.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

    private void showEditBook(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Customer customerLogin = (Customer) session.getAttribute("customerLogin");
        req.setAttribute("customerLogin",customerLogin);
        if(customerLogin ==null){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_signin.jsp");
            requestDispatcher.forward(req, resp);
        } else if (customerLogin.getIdType() == 3){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_user_not_allow.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            List<BookType> bookTypes = iBookTypeService.getAllBookTypes();
            long id = Long.parseLong(req.getParameter("id"));
            Book book = iBookService.findBookById(id);
            if (book == null) {
                resp.sendRedirect("/books?message=edit");
            } else {
                req.setAttribute("book", book);
                req.setAttribute("bookTypes", bookTypes);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard + "book/edit.jsp");
                requestDispatcher.forward(req, resp);
            }
        }
    }

    private void showCreateBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Customer customerLogin = (Customer) session.getAttribute("customerLogin");
        req.setAttribute("customerLogin",customerLogin);
        if(customerLogin ==null){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_signin.jsp");
            requestDispatcher.forward(req, resp);
        } else if (customerLogin.getIdType() == 3){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/error_user_not_allow.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            List<BookType> bookTypes = iBookTypeService.getAllBookTypes();
            req.setAttribute("bookTypes", bookTypes);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard + "book/create.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
    private void showDetailBook(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        getCustomerLoginSession(req);

        List<BookType> bookTypes = iBookTypeService.getAllBookTypes();
        long id = Long.parseLong(req.getParameter("id"));
        Book book = iBookService.findBookById(id);
        if (book == null) {
            resp.sendRedirect("/books?message=detail");
        }else{
            req.setAttribute("book", book);
            req.setAttribute("bookTypes", bookTypes);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard+"book/detail.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
}
