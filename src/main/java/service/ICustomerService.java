package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getAllCustomer();

    Customer findCustomerById(long id);
    void editCustomer(Customer customer);
    void deleteCustomerById(long id);
    void createCustomer(Customer customer);
    boolean checkImageExists(String image);
    Customer findCustomerByEmail(String email);

}

