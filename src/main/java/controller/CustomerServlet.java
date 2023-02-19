package controller;

import config.ResourceConfig;
import model.Book;
import model.BookType;
import model.Customer;
import model.CustomerType;
import service.ICustomerTypeService;
import service.inmemory.CustomerService;
import service.ICustomerService;
import service.inmemory.CustomerTypeService;
import service.mysql.MSCustomerService;
import service.mysql.MSCustomerTypeService;
import utils.DateUtils;
import utils.ValidateUtils;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static session.Session.getCustomerLoginSession;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customers", "/khachhang"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class CustomerServlet extends HttpServlet {

    private ICustomerService iCustomerService;
    private ICustomerTypeService iCustomerTypeService;

    @Override
    public void init() throws ServletException {
        iCustomerService = new MSCustomerService();
        iCustomerTypeService = new MSCustomerTypeService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateCustomers(req, resp);
                break;
            case "edit":
                showEditCustomers(req, resp);
                break;
            case "delete":
            case "view":
                showDetailCustomers(req,resp);
                break;
            default:
                showListCustomers(req, resp);
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
                createCustomer(req, resp);
                break;
            case "edit":
                editCustomer(req, resp);
                break;
            case "delete":
                deleteCustomer(req, resp);
                break;
            default:
                break;
        }
    }

    private void showDetailCustomers(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        getCustomerLoginSession(req);

        List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
        long id = Long.parseLong(req.getParameter("id"));
        Customer customer = iCustomerService.findCustomerById(id);
        if (customer == null) {
            resp.sendRedirect("/customers?message=detail");
        }else{
            req.setAttribute("customer", customer);
            req.setAttribute("customerTypes", customerTypes);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard+"customer/detail.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

    private void showEditCustomers(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
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

            List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
            int id = Integer.parseInt(req.getParameter("id"));
            Customer customer = iCustomerService.findCustomerById(id);

            if (customer == null) {
                resp.sendRedirect("/customers?message=edit");
            } else {
                req.setAttribute("customer", customer);
                req.setAttribute("customerTypes", customerTypes);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard + "customer/edit.jsp");
                requestDispatcher.forward(req, resp);
            }
        }
    }

    private void showCreateCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

            List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
            req.setAttribute("customerTypes", customerTypes);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard + "customer/create.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

    private void createCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
            Customer customer = new Customer();

//        Customer(long id, String image, String name, String email, String password, String address, Date createdAt, long idType)
            //name
            isValidName(req, customer, errors);
            //image
            //email
            String email = req.getParameter("email");
            customer.setEmail(email);
            //password
            String password = req.getParameter("password");
            customer.setPassword(password);
            //address
            isValidAddress(req, customer, errors);
            //createAt
            String sCreatedAt = req.getParameter("createdAt");
            Date createAt = DateUtils.formatDate(sCreatedAt);
            customer.setCreatedAt(createAt);
            //idType
            isValidCustomerType(req, customer, errors);

            //Thêm validate email và password và xoá các set

            List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
            req.setAttribute("customerTypes", customerTypes);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard + "customer/create.jsp");
            if (errors.size() == 0) {
                handleImageUpload(req, customer, errors);
                req.setAttribute("message", "Them thanh cong");
                iCustomerService.createCustomer(customer);
                requestDispatcher.forward(req, resp);
            } else {
                req.setAttribute("errors", errors);
                req.setAttribute("customer", customer);
                requestDispatcher.forward(req, resp);
            }
        }
    }

    private void handleImageUpload(HttpServletRequest req, Customer customer, List<String> errors) throws ServletException, IOException {
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

                customer.setImage(fileName);
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

    private void isValidCustomerType(HttpServletRequest req, Customer customer, List<String> errors) {
        try {
            int idCustomerType = Integer.parseInt(req.getParameter("idType"));
            if (iCustomerTypeService.getCustomerTypeById(idCustomerType)!=null) {
                customer.setIdType(idCustomerType);
            }else{
                errors.add("Loại khách hàng chưa hợp lệ");
            }
        } catch (NumberFormatException numberFormatException) {
            errors.add("Định dạng loại khách hàng chưa đúng");
        }
    }

    private void isValidAddress(HttpServletRequest req, Customer customer, List<String> errors) {
        String address = req.getParameter("address");
        if (!ValidateUtils.isAddressValid(address)) {
            errors.add("Địa chỉ không hợp lệ. Chỉ chứa từ từ 8-15 kí và bắt đầu A-Z a-z 0-9");
        }
        customer.setAddress(address);
    }

    private void isValidName(HttpServletRequest req, Customer customer, List<String> errors) {
        String name = req.getParameter("name");
        if (!ValidateUtils.isNameValid(name)) {
            errors.add("Tên không hợp lệ. Chỉ chứa từ từ 8-15 kí và bắt đầu A-Z a-z 0-9");
        }
        customer.setName(name);
    }

    private void editCustomer(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
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
            Customer customer = new Customer();

            //        Customer(long id, String image, String name, String email, String password, String address, Date createdAt, long idType)
            //name
            isValidName(req, customer, errors);
            //image
            Part part = isValidImage(req, customer, errors);
            //email
            String email = req.getParameter("email");
            customer.setEmail(email);
            //password
            String password = req.getParameter("password");
            customer.setPassword(password);
            //address
            isValidAddress(req, customer, errors);
            //createAt
            String sCreatedAt = req.getParameter("createdAt");
            Date createAt = DateUtils.formatDate(sCreatedAt);
            customer.setCreatedAt(createAt);
            //idType
            isValidCustomerType(req, customer, errors);

            List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
            req.setAttribute("customerTypes", customerTypes);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard + "customer/edit.jsp");
            if (errors.size() == 0) {
                long idCustomer = Long.parseLong(req.getParameter("id"));
                customer.setId(idCustomer);
                Customer customerDB = iCustomerService.findCustomerById(customer.getId());
                if (customer.getImage() != null) {
                    if (customerDB.getImage() != null && !customerDB.getImage().equals(customer.getImage()) && part != null) {
                        handleEditImageUploadAdvanced(part);
                    }
                }
                req.setAttribute("message", "Them thanh cong");
                iCustomerService.editCustomer(customer);

                resp.sendRedirect("/customers");
            } else {
                req.setAttribute("errors", errors);
                req.setAttribute("customer", customer);
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

    private Part isValidImage(HttpServletRequest req, Customer customer, List<String> errors) throws ServletException, IOException {
        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);

            if(!fileName.equals("")){
                customer.setImage(fileName);
                boolean check = iCustomerService.checkImageExists(fileName);
                if (check == true) {
                    return null;
                }else {
                    return part;
                }
            }
        }
        return null;
    }

    private void handleEditImageUpload(HttpServletRequest req, Customer customer, List<String> errors) throws ServletException, IOException {
        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);
            // refines the fileName in case it is an absolute path
            if(!fileName.equals("")){
                Customer customerDB = iCustomerService.findCustomerById(customer.getId());
                if (!customerDB.getImage().equals(fileName)) {
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

                    customer.setImage(fileName);
                }else{
                    // lay lai anh cu
                    customer.setImage(customerDB.getImage());
                }
            }

//            part.write();
        }
    }

    private void deleteCustomer(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
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

            Long id = Long.parseLong(req.getParameter("idDelete"));
            iCustomerService.deleteCustomerById(id);

            resp.sendRedirect("/customers?message=delete");
        }
    }

    private void showListCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

            List<Customer> customers = iCustomerService.getAllCustomer();
            List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
            req.setAttribute("customers", customers);
            req.setAttribute("customerTypes", customerTypes);

            String message = req.getParameter("message");
            if (message != null) {
                // delete: success
                req.setAttribute("message", message);
            }

            RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderDashboard + "customer/customers.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

}
