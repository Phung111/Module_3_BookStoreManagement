package controller;

import config.ResourceConfig;
import model.Customer;
import model.CustomerType;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.ILoginService;
import service.mysql.MSCustomerService;
import service.mysql.MSCustomerTypeService;
import service.mysql.MSLoginService;
import utils.DateUtils;
import utils.ValidateUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/login")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class LoginServlet extends HttpServlet {

    private ICustomerService iCustomerService;
    private ICustomerTypeService iCustomerTypeService;
    private ILoginService iLoginService;

    @Override
    public void init() throws ServletException {
        iCustomerService = new MSCustomerService();
        iCustomerTypeService = new MSCustomerTypeService();
        iLoginService = new MSLoginService();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register":
                showRegister(req, resp);
                break;
            case "resetpassword":
                showResetPassword(req,resp);
                break;
            default:
                showLogin(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                login(req, resp);
                break;
            case "register":
                register(req, resp);
                break;
            case "logout":
                logoutAccount(req, resp);
                break;
            default:

        }
    }

    private void logoutAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("customerLogin");
        session.invalidate();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd + "login.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        Customer customer = new Customer();

//        Customer(long id, String image, String name, String email, String password, String address, Date createdAt, long idType)
        //name
        isValidName(req, customer, errors);
        //image
        //email
        isValidEmail(req, customer, errors);
        //password
        isValidPassword(req, customer, errors);
        //address
        isValidAddress(req, customer, errors);
        //createAt
        isValidDate(req, customer, errors);
        //idType


        List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
        req.setAttribute("customerTypes", customerTypes);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd + "register.jsp");
        if (errors.size() == 0) {
            handleImageUpload(req, customer, errors);
            req.setAttribute("message", "Đăng ký thành công");
            iCustomerService.createCustomer(customer);
            requestDispatcher.forward(req, resp);
        }else{
            req.setAttribute("errors", errors);
            req.setAttribute("customer", customer);
            requestDispatcher.forward(req, resp);
        }
    }

    private boolean isEmpty(String string){
        if (string == null) {
            return true;
        }else if (string.isEmpty()){
            return true;
        }else
            return false;
    }

    private void isValidName(HttpServletRequest req, Customer customer, List<String> errors) {
        String name = req.getParameter("name");
        if(isEmpty(name)){
            errors.add("Không được bỏ trống tên");
        }
        if (!ValidateUtils.isNameValid(name)) {
            errors.add("Tên không hợp lệ. Chỉ chứa từ từ 8-15 kí và bắt đầu A-Z a-z 0-9");
        }
        customer.setName(name);
    }

    private void isValidEmail(HttpServletRequest req, Customer customer, List<String> errors) {
        String email = req.getParameter("email");
        if(isEmpty(email)){
            errors.add("Không được bỏ trống email");
        }
        if (!ValidateUtils.isEmailValid(email)) {
            errors.add("Định dạng email không đúng (ví dụ: quangdeptrai@gmail.com)");
        }
        customer.setEmail(email);
    }

    private void isValidPassword(HttpServletRequest req, Customer customer, List<String> errors) {
        String password = req.getParameter("password");
        if(isEmpty(password)){
            errors.add("Không được bỏ trống mật khẩu");
        }
        if (!ValidateUtils.isEmailValid(password)) {
            errors.add("Mật khẩu phải chứa ít nhất 8 ký tự bao gồm cả số, bắt đầu bằng chữ cái hoa và không chứa ký tự đặc biệt");
        }
        customer.setPassword(password);
    }

    private void isValidAddress(HttpServletRequest req, Customer customer, List<String> errors) {
        String address = req.getParameter("address");
        if(isEmpty(address)){
            errors.add("Không được bỏ trống địa chỉ");
        }
        if (!ValidateUtils.isEmailValid(address)) {
            errors.add("Địa chỉ giả");
        }
        customer.setAddress(address);
    }

    private void isValidDate(HttpServletRequest req, Customer customer, List<String> errors) {
        String sCreatedAt = req.getParameter("createdAt");
        if(isEmpty(sCreatedAt)){
            errors.add("Không được bỏ trống ngày tháng năm");
            return;
        }
        try {
            Date createAt = DateUtils.formatDate(sCreatedAt);
            customer.setCreatedAt(createAt);
        } catch (Exception e) {
            e.printStackTrace();
            errors.add("Không được bỏ trống ngày tháng năm");
        }
    }


    private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<String> errors = new ArrayList<>();
        Customer customer = new Customer();

        checkEmailLogin(req, customer, errors);
        checkPasswordLogin(req, customer, errors);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd + "login.jsp");
        if (errors.size() == 0) {
            req.setAttribute("message", "Đăng nhập thành công");

            HttpSession session = req.getSession();
            Customer customerLogin = iCustomerService.findCustomerByEmail(customer.getEmail());
            session.setAttribute("customerLogin", customerLogin);


//            RequestDispatcher dispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd + "index.jsp");
//            dispatcher.forward(req, resp);

//            resp.sendRedirect("/?login=loginSuccess");
            resp.sendRedirect("/?message=loginSuccess");
        } else {
            req.setAttribute("errors", errors);
            req.setAttribute("customer", customer);
            requestDispatcher.forward(req, resp);
        }
    }

    private void showResetPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");
        if (message != null) {
            // delete: success
            req.setAttribute("message", message );
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"error/resetpassword.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void checkEmailLogin(HttpServletRequest req, Customer customer, List<String> errors) {
        String email = req.getParameter("email");
        boolean checkEmailLogin = iLoginService.checkIfEmailExists(email);
        if(!checkEmailLogin) {
            errors.add("Email không tồn tại");
        }
        customer.setEmail(email);
    }

    private void checkPasswordLogin(HttpServletRequest req, Customer customer, List<String> errors) {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        boolean checkPasswordLogin = iLoginService.checkIfPasswordExists(email, password);
        if(!checkPasswordLogin) {
            errors.add("Mật khẩu không đúng");
        }
        customer.setPassword(password);
    }

    private void showRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");
        if (message != null) {
            // delete: success
            req.setAttribute("message", message );
        }
        List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
        req.setAttribute("customerTypes", customerTypes);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"/register.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");
        if (message != null) {
            // delete: success
            req.setAttribute("message", message );
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd +"/login.jsp");
        requestDispatcher.forward(req, resp);
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
}
