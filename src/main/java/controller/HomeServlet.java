package controller;

import config.ResourceConfig;
import model.Book;
import model.BookType;
import model.Customer;
import model.Order;
import service.IBookService;
import service.IBookTypeService;
import service.mysql.MSBookService;
import service.mysql.MSBookTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = {""} )
public class HomeServlet extends HttpServlet {
    private IBookService iBookService;
    private IBookTypeService iBookTypeService;

    @Override
    public void init() throws ServletException {
        iBookService = new MSBookService();
        iBookTypeService = new MSBookTypeService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> books = iBookService.getAllBook();
        List<BookType> bookTypes = iBookTypeService.getAllBookTypes();
        req.setAttribute("books", books);
        req.setAttribute("bookTypes", bookTypes);
//        String message = req.getParameter("login");
        String message = req.getParameter("message");



        HttpSession session = req.getSession();
        Customer customerLogin = (Customer) session.getAttribute("customerLogin");
        req.setAttribute("customerLogin",customerLogin);

        if (message != null) {
            req.setAttribute("message", message );
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"index.jsp");
        requestDispatcher.forward(req, resp);

    }
}
