package service.mysql;

import model.Customer;
import service.ICustomerService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MSCustomerService extends DBContext implements ICustomerService {
    private static final String SELLECT_ALL_CUSTOMER = "SELECT * FROM customer_men order by id desc;";
//    Customer(long id, String image, String name, String email, String password, String address, java.util.Date createdAt, long idType)
    private static final String INSERT_CUSTOMER = "INSERT INTO `customer_men` ( `name`,`image`,`email`,`password`,`address`,`createAt`,`idType`) VALUES (?,?,?,?,?,?,? )";
    private static final String DELETE_CUSTOMER_BY_ID = "SET foreign_key_checks = 0;DELETE FROM `customer_men` WHERE (`id` = ?);";
    private static final String FIND_CUSTOMER_BY_ID = "SELECT * FROM `customer_men` where (`id` = ?);";
    private static final String EDIT_CUSTOMER = "UPDATE `customer_men` SET  `image` =?,`name` = ?,`email` = ?,`password` = ?,`address` = ?,`createAt` = ?,`idType` = ? WHERE (`id` = ?)";
    private static final String CHECK_IMAGE_EXIST = "SELECT * FROM customer_men where image = ?;";
    private static final String FIND_CUSTOMER_BY_EMAIL = "SELECT * FROM `customer_men` where email like ?";

    @Override
    public List<Customer> getAllCustomer() {

        List<Customer> customers = new ArrayList<>();
        Connection connection = getConnection();
        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(SELLECT_ALL_CUSTOMER);

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(SELLECT_ALL_CUSTOMER);
            while (rs.next()) {
                Customer c = getCustomerFromRs(rs);
                customers.add(c);
            }


            System.out.println("getAllCustomer: " + statement);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
    }

    private Customer getCustomerFromRs(ResultSet rs) throws SQLException {
//    Customer(long id, String image, String name, String email, String password, String address, java.util.Date createdAt, long idType)
        Long id =  rs.getLong("id");
        String image = rs.getString("image");
        String name = rs.getString("name");
        String email = rs.getString("email");
        String password = rs.getString("password");
        String address = rs.getString("address");

        Date sqlCreatedAt = rs.getDate("createAt");
        java.util.Date uCreatedAt = new java.util.Date(sqlCreatedAt.getTime());

        Long idType = rs.getLong("idType");

        Customer customer = new Customer(id,image,name,email,password,address,uCreatedAt,idType);
        return customer;
    }
    @Override
    public Customer findCustomerById(long id) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CUSTOMER_BY_ID);
            preparedStatement.setLong(1, id);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Customer customer = getCustomerFromRs(rs);
                return customer;
            }

            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }

    @Override
    public void editCustomer(Customer customer) {
        Connection connection = getConnection();

        try {
//            UPDATE `customer` SET  `image` =?,`name` = ?,`email` = ?,`password` = ?,
//            `address` = ?,`createAt` = ?,`idType` = ? WHERE (`id` = ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_CUSTOMER);
            preparedStatement.setString(1, customer.getImage());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getEmail());
            preparedStatement.setString(4, customer.getPassword());
            preparedStatement.setString(5, customer.getAddress());
            preparedStatement.setDate(6, new java.sql.Date(customer.getCreatedAt().getTime()));
            preparedStatement.setInt(7, (int) customer.getIdType());
            preparedStatement.setInt(8, (int) customer.getId());

            preparedStatement.executeUpdate();

            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public void deleteCustomerById(long id) {
        Connection connection = getConnection();
        //DELETE FROM customer` WHERE (`id` = ?)
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
            ps.setLong(1, id);
            ps.executeUpdate();
            // DELETE FROM customer` WHERE (`id` = 3)
            System.out.println("deleteCustomerById: " + ps);
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public void createCustomer(Customer customer) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);

//            "INSERT INTO customer` ( `name`,`image`,`email`,`password`,`address`,`createdAt`,`idType`) VALUES (?,?,?,?,?,?,? )"
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getImage());
            preparedStatement.setString(3, customer.getEmail());
            preparedStatement.setString(4, customer.getPassword());
            preparedStatement.setString(5, customer.getAddress());
            preparedStatement.setDate(6, new java.sql.Date(customer.getCreatedAt().getTime()));
            preparedStatement.setInt(7, (int) customer.getIdType());

            preparedStatement. executeUpdate();
            System.out.println("createCustomer: " + preparedStatement);

        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public boolean checkImageExists(String image) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_IMAGE_EXIST);
            preparedStatement.setString(1, image);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                // khỏi cần đọc dòng này ra vì chỉ cần trả ra true/false
                return true;
            }
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public Customer findCustomerByEmail(String email) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CUSTOMER_BY_EMAIL);
            preparedStatement.setString(1, email);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Customer customer = getCustomerFromRs(rs);
                return customer;
            }

            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }
}
