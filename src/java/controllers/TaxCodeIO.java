/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Utils.DatabaseUtils;
import static controllers.DepartmentIO.conn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import models.Department;
import models.LeaveType;
import models.TaxCode;

/**
 *
 * @author user
 */
public class TaxCodeIO {
    static Connection conn = null;
    static Statement stmt = null;
    
    public static boolean taxCodeUpdateExists(String name, int id)
    {
        boolean exists = false;

        try
        {
            conn = DatabaseUtils.getConnection();
            String strSelect = "select taxCodeName from tax_code where taxCodeName = ? and tax_codeId != ?";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            ps.setString(1, name);
            ps.setInt(2, id);
            //conn.setAutoCommit(false);
            
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
    
    public static boolean checkIfExists(String name){
        boolean exists = false;
        
        try{
            conn = DatabaseUtils.getConnection();
            String strSelect = "select * from tax_code where taxCodeName = ?";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            ps.setString(1, name);
            //conn.setAutoCommit(false);
                    
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                exists = true;
            }
        }catch(SQLException e){
            System.out.println(e);
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        
        return exists;
    }
    
    public static void createTaxCode(String name){
        try{
            conn = DatabaseUtils.getConnection();
            String sqlInsert = "insert into tax_code (taxCodeName) values (?)";
            PreparedStatement ps = conn.prepareStatement(sqlInsert);
            ps.setString(1, name);

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
    
    public static ArrayList<TaxCode> getTaxCodes()
    {
        ArrayList<TaxCode> data = new ArrayList();
        
        try
        {
            conn = DatabaseUtils.getConnection();
            stmt = conn.createStatement();
            //conn.setAutoCommit(false);
            String strSelect = "select * from tax_code";
            ResultSet rset = stmt.executeQuery(strSelect);

            while(rset.next()) 
            {   
                TaxCode taxCode = new TaxCode();
                taxCode.setId(rset.getInt("tax_codeId"));
                taxCode.setName(rset.getString("taxCodeName"));
                data.add(taxCode);
            }
            //conn.commit();
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
                    //conn.rollback();
                    conn.close();
                    }
            }
            catch (SQLException ex)
            {
                ex.printStackTrace();
            }
        }
        
        return data;
    }
    
    public static void updateTaxCode(int id, String name)
    {
        try
        {
            conn = DatabaseUtils.getConnection();
            String strUpdate = "update tax_code set taxCodeName = ? where tax_codeId = ?";
            PreparedStatement ps = conn.prepareStatement(strUpdate);
            //conn.setAutoCommit(false);
            
            ps.setString(1, name);
            ps.setInt(2, id);

            ps.executeUpdate();
            //conn.commit();
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
                    //conn.rollback();
                    conn.close();
                    }
            }
            catch (SQLException ex)
            {
                ex.printStackTrace();
            }
        }
    }
    

}
