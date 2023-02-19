package service.mysql;

import model.Customer;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.ILoginService;

import javax.servlet.ServletException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MSLoginService extends DBContext implements ILoginService {
    private static final String CHECK_EMAIL_EXISTS = "SELECT * FROM customer_men where email = ?;";
    private static final String CHECK_PASSWORD_EXISTS = "SELECT * FROM customer_men where email =? and password = ?;";

    @Override
    public boolean checkIfEmailExists(String email) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_EMAIL_EXISTS);
            preparedStatement.setString(1, email);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return true;
            }

            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean checkIfPasswordExists(String email, String password) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_PASSWORD_EXISTS);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return true;
            }

            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }


}
