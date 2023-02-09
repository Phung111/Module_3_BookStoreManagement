package controller;

import model.Customer;
import model.CustomerType;
import service.ICustomerTypeService;
import service.inmemory.CustomerService;
import service.ICustomerService;
import service.inmemory.CustomerTypeService;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customers", "/khachhang"})
public class CustomerServlet extends HttpServlet {

    private ICustomerService iCustomerService;
    private ICustomerTypeService iCustomerTypeService;

    @Override
    public void init() throws ServletException {
        iCustomerService = new CustomerService();
        iCustomerTypeService = new CustomerTypeService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
            case "edit":
            case "delete":
            case "view":
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
            case "edit":
            case "delete":
                deleteCustomer(req, resp);
                break;
            default:
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("idDelete"));
        iCustomerService.deleteCustomerById(id);

        resp.sendRedirect("/customers?delete=success");
        System.out.println("deleteCustomer");
    }

    private void showListCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers = iCustomerService.getAllCustomer();
        List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
        req.setAttribute("customers", customers);
        req.setAttribute("customerTypes", customerTypes );

        String delete = req.getParameter("delete");
        if (delete != null) {
            // delete: success
            req.setAttribute("delete", delete );
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/customer/customers.jsp");
        requestDispatcher.forward(req, resp);
    }

}
