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
import models.Department;

/**
 *
 * @author user
 */
public class DepartmentIO {
    static Connection conn = null;
    static Statement stmt = null;
    
    public static boolean departmentUpdateExists(String departmentName, int id)
    {
        boolean exists = false;

        try
        {
            conn = DatabaseUtils.getConnection();
            String strSelect = "select departmentName from department where departmentName = ? and departmentId != ?";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            ps.setString(1, departmentName);
            ps.setInt(2, id);
            
            ResultSet rset = ps.executeQuery();
            if(rset.next()) 
            {   
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
    
    public static boolean departmentNameExists(String departmentName)
    {
        boolean exists = false;

        try
        {
            conn = DatabaseUtils.getConnection();
            String strSelect = "select departmentName from department where departmentName = ?";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            ps.setString(1, departmentName);
            
            ResultSet rset = ps.executeQuery();
            if(rset.next()) 
            {   
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
    
    public static void createDepartment(String departmentName)
    {
            try{
              conn = DatabaseUtils.getConnection();
              String sqlInsert = "insert into department (departmentName) values (?)";
              PreparedStatement ps = conn.prepareStatement(sqlInsert);

              ps.setString(1, departmentName);
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
    
    
    public static ArrayList<Department> viewDepartments()
    {
        ArrayList<Department> deptList = new ArrayList();
        
        try
        {
            conn = DatabaseUtils.getConnection();
            stmt = conn.createStatement();

            String strSelect = "select * from department";
            ResultSet rset = stmt.executeQuery(strSelect);

            while(rset.next()) 
            {   
                Department dept = new Department();
                dept.setId(rset.getInt("departmentId"));
                dept.setName(rset.getString("departmentName"));
                deptList.add(dept);
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
        
        return deptList;
    }
    
    public static void updateDepartment(int departmentId, String departmentName)
    {
        try
        {
            conn = DatabaseUtils.getConnection();
            String strUpdate = "update department set departmentName = ? where departmentId = ?";
            PreparedStatement ps = conn.prepareStatement(strUpdate);

            ps.setString(1, departmentName);
            ps.setInt(2, departmentId);

            ps.executeUpdate();
            DatabaseUtils.commit(conn);
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
            DatabaseUtils.rollback(conn);
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
    }
}
