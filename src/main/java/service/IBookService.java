package service;

import model.Book;

import java.util.List;

public interface IBookService {
    List<Book> getAllBook();
    Book findBookById(long id);

    void editBook(Book book);
    void deleteBookById(long id);
    void createBook(Book book);
    boolean checkImageExists(String image);
    List<Book> getAllBookSearchingPagging(String kw, int idBookType, int offset, int limit);
    int getNoOfRecords();

}
