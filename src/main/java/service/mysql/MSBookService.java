package service.mysql;

import model.Book;
import service.IBookService;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MSBookService extends DBContext implements IBookService {
//    Book(long id, String image, String name, String author, long price, long avaiable, long quantity, Date dateAdd, long idBookType)
    private static final String SELLECT_ALL_BOOK = "SELECT * FROM book order by id desc;";
    private static final String INSERT_BOOK = "INSERT INTO `book` ( `image`,`name`,`author`,`price`,`avaiable`,`quantity`,`dateAdd`,`idBookType`) VALUES (?,?,?,?,?,?,?,?)";
    private static final String DELETE_BOOK_BY_ID = "DELETE FROM `book` WHERE (`id` = ?);";
    private static final String FIND_BOOK_BY_ID = "SELECT * FROM `book` where (`id` = ?);";
    private static final String EDIT_BOOK = "UPDATE `book` SET  `image` =?,`name` = ?,`author` = ?,`price` = ?,`avaiable` = ?,`quantity` = ?,`dateAdd` = ?,`idBookType`= ? WHERE (`id` = ?)";
    private static final String CHECK_IMAGE_EXIST = "SELECT * FROM book where image = ?;";
    private static final String SEARCHING_PAGGING_BOOK = "SELECT SQL_CALC_FOUND_ROWS  * FROM book where `name` like ? and idBookType = ?  limit ?, ?";
    private static final String SEARCHING_PAGGING_BOOK_ALL = "SELECT SQL_CALC_FOUND_ROWS  * FROM book where `name` like ? limit ?, ?;";
    private int noOfRecords;
    @Override
    public List<Book> getAllBook() {
        List<Book> books = new ArrayList<>();
        Connection connection = getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(SELLECT_ALL_BOOK);
            while (rs.next()) {
                Book book = getBookFromRs(rs);
                books.add(book);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return books;
    }

    private Book getBookFromRs(ResultSet rs) throws SQLException {
//    Book(long id, String image, String name, String author, long price, long avaiable, long quantity, Date dateAdd, long idBookType)
        long id =  rs.getLong("id");
        String image = rs.getString("image");
        String name = rs.getString("name");
        String author = rs.getString("author");
        long price = rs.getLong("price");
        long avaiable = rs.getLong("avaiable");
        long quantity = rs.getLong("quantity");

        Date sqlDateAdd= rs.getDate("dateAdd");
        java.util.Date uDateAdd = new java.util.Date(sqlDateAdd.getTime());

        long idBookType = rs.getLong("idBookType");

        Book book = new Book(id,image,name,author,price,avaiable,quantity,uDateAdd,idBookType);
        return book;
    }

    @Override
    public Book findBookById(long id) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BOOK_BY_ID);
            preparedStatement.setLong(1, id);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Book book = getBookFromRs(rs);
                return book;
            }
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }

    @Override
    public void editBook(Book book) {
        Connection connection = getConnection();
        try {
//            "UPDATE `book` SET  `image` =?,`name` = ?,`author` = ?,`price` = ?,
//            `avaiable` = ?,`quantity` = ?,`dateAdd` = ?,`idBookType`= ? WHERE (`id` = ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_BOOK);
            preparedStatement.setString(1, book.getImage());
            preparedStatement.setString(2, book.getName());
            preparedStatement.setString(3, book.getAuthor());
            preparedStatement.setLong(4, book.getPrice());
            preparedStatement.setLong(5, book.getAvaiable());
            preparedStatement.setLong(6, book.getQuantity());
            preparedStatement.setDate(7, new java.sql.Date(book.getDateAdd().getTime()));
            preparedStatement.setLong(8, book.getIdBookType());
            preparedStatement.setLong(9, book.getId());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public void deleteBookById(long id) {
        Connection connection = getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_BOOK_BY_ID);
            ps.setLong(1, id);
            ps.executeUpdate();
            System.out.println("deleteCustomerById: " + ps);
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public void createBook(Book book) {
        Connection connection = getConnection();
        try {
//            "UPDATE `customer` SET  `image` =?,`name` = ?,`author` = ?,`price` = ?,`avaiable` = ?,`quantity` = ?,`dateAdd` = ?,`idBookType`= ? WHERE (`id` = ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK);
            preparedStatement.setString(1, book.getImage());
            preparedStatement.setString(2, book.getName());
            preparedStatement.setString(3, book.getAuthor());
            preparedStatement.setLong(4, book.getPrice());
            preparedStatement.setLong(5, book.getAvaiable());
            preparedStatement.setLong(6, book.getQuantity());
            preparedStatement.setDate(7, new java.sql.Date(book.getDateAdd().getTime()));
            preparedStatement.setLong(8, book.getIdBookType());
            preparedStatement.executeUpdate();
            connection.close();
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
    public List<Book> getAllBookSearchingPagging(String kw, int idCustomerType, int offset, int limit) {
        List<Book> books = new ArrayList<>();
        Connection connection = getConnection();

        try {
            PreparedStatement preparedStatement = null;
            if (idCustomerType == -1) {
                preparedStatement = connection.prepareStatement(SEARCHING_PAGGING_BOOK_ALL);
                preparedStatement.setString(1, "%" + kw + "%");
                preparedStatement.setInt(2, offset);
                preparedStatement.setInt(3, limit);
            }else{
                preparedStatement = connection.prepareStatement(SEARCHING_PAGGING_BOOK);
                preparedStatement.setString(1, "%" + kw + "%");
                preparedStatement.setInt(2, idCustomerType);
                preparedStatement.setInt(3, offset);
                preparedStatement.setInt(4, limit);
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Book b = getBookFromRs(rs);
                books.add(b);
            }

            rs = preparedStatement.executeQuery("SELECT FOUND_ROWS()");
            while (rs.next()) {
                noOfRecords = rs.getInt(1);
            }
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return books;
    }
    @Override
    public int getNoOfRecords() {
        return noOfRecords;
    }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }


}
