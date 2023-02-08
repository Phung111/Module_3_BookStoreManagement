package service.inmemory;

import model.Customer;
import service.ICustomerService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerService implements ICustomerService {

    private List<Customer> customers;

    public CustomerService() {
        customers = new ArrayList<>();

//      Customer(long id, String image, String name, String email, String password, String address, Date createdAt)
        customers.add(new Customer(0,null, "Quang Dang","quangdang@gmail.com","12346","28 NTP", new Date()));
        customers.add(new Customer(1,null, "Huu Nghia","quangdang@gmail.com","12346","28 NTP", new Date()));
        customers.add(new Customer(2,null, "Thanh Nhan","quangdang@gmail.com","12346","28 NTP", new Date()));
        customers.add(new Customer(3,null, "Bich Thuy","quangdang@gmail.com","12346","28 NTP", new Date()));
    }

    @Override
    public List<Customer> getAllCustomer() {
        return this.customers;
    }

    @Override
    public Customer findCustomerById(long id) {
        for (int i = 0; i < customers.size(); i++) {
            if (customers.get(i).getId() == id) {
                return customers.get(i);
            }
        }
        return null;
    }

    @Override
    //Customer(Long id, String name, String email, String address, Date createdAt, String image)
    public void editCustomer(Customer customer) {
        for (int i = 0; i < customers.size(); i++) {
            if (customers.get(i).getId() == customer.getId()) {
                customers.get(i).setName(customer.getName());
                customers.get(i).setEmail(customer.getEmail());
                customers.get(i).setAddress(customer.getAddress());
                customers.get(i).setCreatedAt(customer.getCreatedAt());
                customers.get(i).setImage(customer.getImage());
            }
        }
    }

    @Override
    public void deleteCustomerById(long id) {
        for (int i = 0; i < customers.size(); i++) {
            if (customers.get(i).getId() == id) {
                customers.remove(i);
            }
        }
    }

    @Override
    public void addCustomer(Customer customer) {
        customers.add(customer);
    }
}
