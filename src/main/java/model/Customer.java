package model;

import java.util.Date;

public class Customer{
    private long id;
    private String image;
    private String name;
    private String email;
    private String password;
    private String address;
    private Date createdAt;

    public Customer() {
    }

    public Customer(long id, String image, String name, String email, String password, String address, Date createdAt) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.email = email;
        this.password = password;
        this.address = address;
        this.createdAt = createdAt;
    }

    public Customer(long id, String image, String name, String email, String address, Date createdAt) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.email = email;
        this.address = address;
        this.createdAt = createdAt;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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
}
