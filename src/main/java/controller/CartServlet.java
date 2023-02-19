package controller;

import config.ResourceConfig;
import model.*;
import service.IBookService;
import service.IBookTypeService;
import service.IOrderService;
import service.mysql.MSBookService;
import service.mysql.MSBookTypeService;
import service.mysql.MSOrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

import static session.Session.getCustomerLoginSession;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    private IBookService iBookService;
    private IBookTypeService iBookTypeService;
    private IOrderService iOrderService;
    @Override
    public void init() throws ServletException {
        iBookService = new MSBookService();
        iBookTypeService = new MSBookTypeService();
        iOrderService = new MSOrderService();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                handleAddToCart(req, resp);
                break;
            case "edit":
                showEditCart(req, resp);
                break;
            case "checkout":
                showCheckOutCart(req, resp);
                break;
            default:
                showCart(req, resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                handleEditCart(req, resp);
                break;
            case "delete":
                deleteBookCart(req, resp);
                break;
            case "checkout":
                handleCheckout(req, resp);
                break;
        }
    }



    private void handleAddToCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getCustomerLoginSession(req);
        HttpSession session = req.getSession();

        long id = Long.parseLong(req.getParameter("id"));

        //Kiểm tra số lượng book hiện có
            Book bookCheckAvaiable = iBookService.findBookById(id);
            long avaiableCheck = bookCheckAvaiable.getAvaiable();
            if (avaiableCheck <= 0){
//                req.setAttribute("message", "addCartFail");
                resp.sendRedirect("/?message=addCartFail");
            } else {
//                req.setAttribute("message", "addCartSuccess");
                Order order = (Order) session.getAttribute("order");
                if (order == null) {
                    order = new Order();
                }
                // Kiem tra trước Id sản phẩm này có hợp lệ
                if (order.getOrderItems() == null) {
                    List<OrderItem> orderItems = new ArrayList<>();
                    OrderItem orderItem = new OrderItem();
                    orderItem.setIdBook(id);
                    orderItem.setQuantiy(1);


                    orderItems.add(orderItem);
                    order.setOrderItems(orderItems);
                }else{
                    if (checkIdProductExistInOrder(order, id)) {
                        increaseQuantityInOrder(order, id, 1);
                    }else{
                        OrderItem orderItem = new OrderItem();
                        orderItem.setIdBook(id);
                        orderItem.setQuantiy(1);
                        order.getOrderItems().add(orderItem);
                    }
                }
                updateTotalInOrder(order);
                session.setAttribute("order", order);
                req.setAttribute("orderDTO", convertToOrderDTO(order));
                resp.sendRedirect("/?message=addCartSuccess");
            }

//        orderDTO.getOderItemDTOS()
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd + "cart.jsp");
//        requestDispatcher.forward(req, resp);
//        resp.sendRedirect("/");
    }

    private void updateTotalInOrder(Order order) {
        long total = 0;
        if (order != null && order.getOrderItems() != null) {
            for (int i = 0; i < order.getOrderItems().size(); i++) {
                Book book = iBookService.findBookById(order.getOrderItems().get(i).getIdBook());
                total += order.getOrderItems().get(i).getQuantiy() * book.getPrice();
            }
        }
        order.setTotal(total);
    }

    public boolean checkIdProductExistInOrder(Order order, long idBook) {
        for (int i = 0; i < order.getOrderItems().size(); i++) {
            if (order.getOrderItems().get(i).getIdBook() == idBook) {
                return true;
            }
        }
        return false;
    }

    public void increaseQuantityInOrder(Order order, long idBook, long quantity) {
        for (int i = 0; i < order.getOrderItems().size(); i++) {
            if (order.getOrderItems().get(i).getIdBook() == idBook) {
                long quantityPresent = order.getOrderItems().get(i).getQuantiy();
                order.getOrderItems().get(i).setQuantiy(quantityPresent + quantity);
            }
        }
    }

    public OrderDTO convertToOrderDTO(Order order) {
        OrderDTO orderDTO = order.toDTO();
        /**
         List<OrderItemDTO> orderItemDTOS = new ArrayList<>();
         List<OrderItem> orderItems = order.getOrderItems();
         for (int i = 0; i < orderItems.size(); i++) {
         OrderItemDTO orderItemDTO = new OrderItemDTO();
         orderItemDTO.setQuatity(orderItems.get(i).getQuantiy());
         orderItemDTO.setId(orderItems.get(i).getId());
         Product product = iProductService.findProductById(orderItems.get(i).getIdProduct());

         orderItemDTO.setProduct(product);
         orderItemDTOS.add(orderItemDTO);
         }
         orderDTO.setOderItemDTOS(orderItemDTOS);
         **/
        List<OrderItemDTO> orderItemDTOS = order.getOrderItems().stream().map(new Function<OrderItem, OrderItemDTO>() {
            @Override
            public OrderItemDTO apply(OrderItem orderItem) {
                OrderItemDTO orderItemDTO = new OrderItemDTO();
                orderItemDTO.setQuantity(orderItem.getQuantiy());
                orderItemDTO.setId(orderItem.getId());
                Book book = iBookService.findBookById(orderItem.getIdBook());
                orderItemDTO.setBook(book);
                return orderItemDTO;
            }
        }).collect(Collectors.toList());

        orderDTO.setTotal(order.getTotal());
        orderDTO.setOderItemDTOS(orderItemDTOS);
        return orderDTO;
    }

    private void showCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getCustomerLoginSession(req);


        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");

        if (order != null) {
            req.setAttribute("orderDTO", convertToOrderDTO(order));
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd + "cart.jsp");
        requestDispatcher.forward(req, resp);

    }

    private void deleteBookCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        getCustomerLoginSession(req);

        long id = Long.parseLong(req.getParameter("idDelete"));
        HttpSession session = req.getSession();


        Order order = (Order) session.getAttribute("order");
        deleteBookInCartById(id, order);
        session.setAttribute("order", order);
        req.setAttribute("orderDTO", convertToOrderDTO(order));
        resp.sendRedirect("/cart?message=delete");
    }

    private void deleteBookInCartById(long id, Order order) {
        for (int i = 0; i < order.getOrderItems().size(); i++) {
            if (order.getOrderItems().get(i).getIdBook() == id) {
                order.getOrderItems().remove(i);
            }
        }
    }

    private void handleEditCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getCustomerLoginSession(req);

        long idProduct = Long.parseLong(req.getParameter("idproduct"));
        long quantity = Long.parseLong(req.getParameter("quantity"));

        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");


        // Nếu có ton tại
        if (checkIdProductExistInOrder(order, idProduct)) {
            setQuantityInOrder(order, idProduct, quantity);
            updateTotalInOrder(order);
            session.setAttribute("order", order);
            req.setAttribute("orderDTO", convertToOrderDTO(order));
        }else{
            // báo lỗi không có idproduct
            req.setAttribute("message", "Sản phẩm không tồn tại");
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd + "cart.jsp");
        requestDispatcher.forward(req, resp);
    }

    public void setQuantityInOrder(Order order, long idBook, long quantity) {
        for (int i = 0; i < order.getOrderItems().size(); i++) {
            if (order.getOrderItems().get(i).getIdBook() == idBook) {
                if (quantity > 0) {
                    order.getOrderItems().get(i).setQuantiy(quantity);
                }else{
                    order.getOrderItems().remove(i);
                    break;
                }
            }
        }
    }

    private void showEditCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getCustomerLoginSession(req);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd + "cart.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showCheckOutCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getCustomerLoginSession(req);

        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");
        if (order != null) {
            req.setAttribute("orderDTO", convertToOrderDTO(order));
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(ResourceConfig.folderFrontEnd + "checkout.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void handleCheckout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        getCustomerLoginSession(req);

        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");

        if (order != null) {
            order.setAddress(address);
            order.setPhone(phone);
            order.setName(name);


            // Tự lưu xuong database đi
            iOrderService.saveOrderBySP(order);

            //Xử lý quantity
            List<OrderItem> orderItems = order.getOrderItems();
            for(int i=0;i<orderItems.size();i++){
                long numberOrder = orderItems.get(i).getQuantiy();

                Book book = iBookService.findBookById(orderItems.get(i).getIdBook());
                long avaiableBook = book.getAvaiable();
                long quantityBook = book.getQuantity();

                long avaiableUpdate = avaiableBook - numberOrder;
                long quantityUpdate = quantityBook - numberOrder;

                book.setAvaiable(avaiableUpdate);
                book.setQuantity(quantityUpdate);

                iBookService.editBook(book);

            }
            
            // xóa thông tin trong session
            session.removeAttribute("order");
            resp.sendRedirect("/");
        }

    }

}
