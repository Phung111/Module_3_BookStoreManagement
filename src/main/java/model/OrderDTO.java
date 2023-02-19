package model;

import java.util.List;

public class OrderDTO {
    private long id;
    private String name;
    private String phone;
    private String address;
    private long total;

    private List<OrderItemDTO> oderItemDTOS;

    public OrderDTO() {
    }

    public OrderDTO(long id, String name, String phone, String address, long total, List<OrderItemDTO> oderItemDTOS) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.total = total;
        this.oderItemDTOS = oderItemDTOS;
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

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<OrderItemDTO> getOderItemDTOS() {
        return oderItemDTOS;
    }

    public void setOderItemDTOS(List<OrderItemDTO> oderItemDTOS) {
        this.oderItemDTOS = oderItemDTOS;
    }
}
