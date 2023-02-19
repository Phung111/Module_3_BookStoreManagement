package service.mysql;

import model.BookType;
import model.CustomerType;
import service.IBookTypeService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MSBookTypeService extends DBContext implements IBookTypeService {

    private static final String SELLECT_ALL_BOOK_TYPE = "SELECT * FROM book_type;";
    private static final String SELECT_BOOK_TYPE_BY_ID = "SELECT * FROM book_type where id = ?";
    @Override
    public List<BookType> getAllBookTypes() {
        List<BookType> bookTypes = new ArrayList<>();
        Connection connection = getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(SELLECT_ALL_BOOK_TYPE);
            while (rs.next()) {
                BookType bookType = getBookTypeFromRs(rs);
                bookTypes.add(bookType);
            }

            System.out.println("getAllCustomerTypes: " + statement.toString());
        } catch (SQLException e) {
            printSQLException(e);
        }
        return bookTypes;
    }

    @Override
    public BookType getBookTypeById(long id) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_TYPE_BY_ID);
            preparedStatement.setLong(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                BookType bookType = getBookTypeFromRs(rs);
                return bookType;
            }
            System.out.println("getCustomerTypeById: " + preparedStatement);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }

    private BookType getBookTypeFromRs(ResultSet rs) throws SQLException {
        BookType bookType = new BookType();
        int id = rs.getInt("id");
        String name = rs.getString("name");

        bookType.setId(id);
        bookType.setName(name);
        return bookType;
    }
}
