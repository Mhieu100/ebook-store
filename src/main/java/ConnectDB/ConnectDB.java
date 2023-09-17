package ConnectDB;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
    private static Connection conn;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }

}
