package service;

import model.Order;

import java.util.List;

public interface IOrderService {
    List<Order> getAllOrder();
    Order getOrderById(long id);
    void saveOrder(Order order);
    void saveOrderBySP(Order order);

}
