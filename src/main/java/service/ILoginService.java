package service;

import model.Book;

import java.util.List;

public interface ILoginService {
    boolean checkIfEmailExists(String email);
    boolean checkIfPasswordExists(String email, String password);

}
