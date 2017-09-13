/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Utils.DatabaseUtils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import models.Civil_Status;

/**
 *
 * @author user
 */
public class CivilStatusIO {
    String civilStatus;
    int civilStatusId;
    static Connection conn = null;
    static Statement stmt = null;
    
    public CivilStatusIO()
    {
        civilStatus = "";
        civilStatusId = 0;
    }
    
    public static void createCivilStatus(String civilStatus)
    {
        try
        {
           /* String stringInsert = "insert into civil_status (civilStatusName) values ('" + civilStatus + "')";
            DatabaseUtils.insert(stringInsert);  */

        conn = DatabaseUtils.getConnection();
        String sqlInsert = "insert into civil_status (civilStatusName)  values (?)";
        PreparedStatement ps = conn.prepareStatement(sqlInsert);
        ps.setString(1, civilStatus);

        ps.executeUpdate();
        DatabaseUtils.commit(conn);
        }
        catch(SQLException ex){
            ex.printStackTrace();
            DatabaseUtils.rollback(conn);
        }
        finally{
            try{
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            }
            catch (SQLException ex){
                ex.printStackTrace();
            }
        }
    }
    
    public static boolean civilStatusExists(String civilStatus)
    {
        boolean exists = false;
        
        try
        { 
            conn = DatabaseUtils.getConnection();
            String strSelect = "select civilStatusName from civil_status where civilStatusName = ?";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            ps.setString(1,  civilStatus);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                exists = true;
            }
            
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            try
            {
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            }
            catch (SQLException ex)
            {
                ex.printStackTrace();
            }
        }
         
        return exists;   
    }
    
    public static ArrayList<Civil_Status> viewCivilStatus()
    {
        ArrayList<Civil_Status> civil_statusList = new ArrayList();
        try
        {
            conn = DatabaseUtils.getConnection();
            stmt = conn.createStatement();

            String strSelect = "select * from civil_status";
            ResultSet rset = stmt.executeQuery(strSelect);

            while(rset.next()) 
            {   
                Civil_Status dept = new Civil_Status();
                dept.setCivil_statusId(rset.getInt("civil_statusId"));
                dept.setCivilStatusName(rset.getString("civilStatusName"));
                civil_statusList.add(dept);
            }
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            try
            {
                if(stmt != null) stmt.close();
                if(conn != null) {
                    conn.close();
                }
            }
            catch (SQLException ex)
            {
                ex.printStackTrace();
            }
        }
        
        return civil_statusList;
    } 
    
    
     public static void updateCivilStatus(String civilStatusName, int civil_statusId){
        try{
            conn = DatabaseUtils.getConnection();
            stmt = conn.createStatement();

            String strUpdate = "update civil_status set civilStatusName = ? where civil_statusId = ?";
            PreparedStatement ps = conn.prepareStatement(strUpdate);

            ps.setString(1, civilStatusName);
            ps.setInt(2, civil_statusId);

            ps.executeUpdate();
            DatabaseUtils.commit(conn);
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        finally{
            try{
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            }
            catch (SQLException ex){
                ex.printStackTrace();
            }
        }
    }
}
