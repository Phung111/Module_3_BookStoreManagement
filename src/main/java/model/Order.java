package model;

import java.util.Date;
import java.util.List;

public class Order {
    private long id;
    private String name;
    private String phone;
    private String address;

    private long total;

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    private List<OrderItem> orderItems;

    public Order(long id, String name, String phone, String address) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
    }

    public OrderDTO toDTO() {
        OrderDTO orderDTO = new OrderDTO();
        orderDTO.setName(this.getName());
        orderDTO.setPhone(this.getPhone());
        orderDTO.setAddress(this.getAddress());
        orderDTO.setId(this.getId());
        return orderDTO;
    }
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public Order(long id, String name, String phone, String address, List<OrderItem> orderItems) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.orderItems = orderItems;
    }

    public Order() {
    }

    public void deleteOrderById(long id){

    }

}
