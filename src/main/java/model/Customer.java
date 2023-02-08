package model;

import java.util.Date;

public class Customer{
    private long id;
    private String name;
    private String email;
    private String address;
    private Date createdAt;
    private String image;

    public Customer() {
    }

    public Customer(long id, String name, String email, String address, Date createdAt, String image) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.address = address;
        this.createdAt = createdAt;
        this.image = image;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
