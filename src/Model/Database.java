package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Database {

    private String user = "user";
    private String pass = "#1#2#3%1%2%3";
    private String url = "jdbc:mysql://localhost:3306/socialmedia?useSSL=false&serverTimezone=UTC";
    private Statement statement;

    public Database() {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection connection = DriverManager.getConnection(url, user, pass);
            statement = connection.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY
            );

            System.out.println("✅ Connection successful!");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Statement getStatement() {
        return statement;
    }
}
