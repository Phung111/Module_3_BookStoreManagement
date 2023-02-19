package model;

public class OrderItemDTO {
    private long id;
    private Book book;
    private long quantity;

    public OrderItemDTO() {
    }

    public OrderItemDTO(long id, Book book, long quantity) {
        this.id = id;
        this.book = book;
        this.quantity = quantity;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }
}
