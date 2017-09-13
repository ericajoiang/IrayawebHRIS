/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;
import DatabaseHandler.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Martin
 */
public class DatabaseUtils {
    private static final DatabaseRetriever dbr = new DatabaseRetriever();
    private static final DataBaseBean db = dbr.retrieveDatabase();
    private static final String dbUser = db.getDbuser();
    private static final String dbPassword = db.getDbpass();
    private static final String dbUrl = db.getDbUrl();
    static Connection conn = null;
    static Statement stmt = null;
    
    public DatabaseUtils(){
    }
    
    //for setting the driver
    public static boolean loadDriver() throws SQLException {
        boolean isSet = false;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            isSet = true;
        }
        catch (ClassNotFoundException ex){
            ex.printStackTrace();
            isSet = false;
        }
        return isSet;
    }
    
    public static Connection getConnection() throws SQLException{
        if(loadDriver()){
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            conn.setAutoCommit(false);
        }
        return conn;
    }
    
    public static void rollback(Connection conn){
        try{
            if(conn!=null){
                conn.rollback();
            }
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public static void commit(Connection conn){
        try{
            if(conn!=null){
                conn.commit();
            }
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    
}
