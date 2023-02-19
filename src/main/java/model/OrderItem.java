package model;

public class OrderItem {
    private long id;
    private long idBook;
    private long quantiy;

    public OrderItem() {
    }

    public OrderItem(long id, long idBook, long quantiy) {
        this.id = id;
        this.idBook = idBook;
        this.quantiy = quantiy;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getIdBook() {
        return idBook;
    }

    public void setIdBook(long idBook) {
        this.idBook = idBook;
    }

    public long getQuantiy() {
        return quantiy;
    }

    public void setQuantiy(long quantiy) {
        this.quantiy = quantiy;
    }
}
