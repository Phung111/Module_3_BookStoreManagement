package session;

import model.Customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Session {
    public static void getCustomerLoginSession(HttpServletRequest req){
        HttpSession session = req.getSession();
        Customer customerLogin = (Customer) session.getAttribute("customerLogin");
        req.setAttribute("customerLogin",customerLogin);
    }

}
