package service;

import model.BookType;

import java.util.List;

public interface IBookTypeService {
    List<BookType> getAllBookTypes();
    BookType getBookTypeById(long id);

}
