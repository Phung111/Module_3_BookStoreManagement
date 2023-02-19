package model;

import java.util.Date;

public class Book {
    private long id;
    private String image;
    private String name;
    private String author;
    private long price;
    private long avaiable;
    private long quantity;
    private Date dateAdd;
    private long idBookType;

    public Book() {
    }

    public Book(long id, String image, String name, String author, long price, long avaiable, long quantity, Date dateAdd, long idBookType) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.author = author;
        this.price = price;
        this.avaiable = avaiable;
        this.quantity = quantity;
        this.dateAdd = dateAdd;
        this.idBookType = idBookType;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public long getAvaiable() {
        return avaiable;
    }

    public void setAvaiable(long avaiable) {
        this.avaiable = avaiable;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public Date getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Date dateAdd) {
        this.dateAdd = dateAdd;
    }

    public long getIdBookType() {
        return idBookType;
    }

    public void setIdBookType(long idBookType) {
        this.idBookType = idBookType;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
