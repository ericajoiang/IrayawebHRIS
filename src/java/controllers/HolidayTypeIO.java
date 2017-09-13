/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Utils.DatabaseUtils;
import models.HolidayType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
/**
 *
 * @author Martin
 */
public class HolidayTypeIO {
    static Connection conn = null;
    static Statement stmt = null;
    
    public HolidayTypeIO(){
    }
    
    public static boolean checkIfExists(String name){
        boolean exists = false;
        try{
            conn = DatabaseUtils.getConnection();
            String strSelect = "select * from holiday_type where holidayTypeName = ?";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                exists = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
            
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
                
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
                
        return exists;
    }
    
    public static void createHolidayType(String name, float rate){
        try{
            conn = DatabaseUtils.getConnection();
            String sqlInsert = "insert into holiday_type (holidayTypeName, rate) values (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sqlInsert);
            
            ps.setString(1, name);
            ps.setFloat(2, rate);
            
            ps.executeUpdate();
            DatabaseUtils.commit(conn);
            
        }catch(SQLException e){
            e.printStackTrace();
            DatabaseUtils.rollback(conn);
            
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
    }
    
    public static ArrayList<HolidayType> getHolidayTypes(){
        ArrayList<HolidayType> holidayTypes = new ArrayList<HolidayType>();
        
        try{
            conn = DatabaseUtils.getConnection();
            String strSelect = "select * from holiday_type";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                HolidayType holidayType = new HolidayType();
                
                holidayType.setId(rs.getInt("holiday_typeId"));
                holidayType.setName(rs.getString("holidayTypeName"));
                holidayType.setRate(rs.getFloat("rate"));
                
                holidayTypes.add(holidayType);
            }
        }catch(SQLException e){
            e.printStackTrace();
            
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        
        return holidayTypes;
    }
    
    public static void updateHolidayType(int id, String name, float rate){
        try{
            conn = DatabaseUtils.getConnection();
            
            String sqlUpdate = "update holiday_type set holidayTypeName = ?, rate = ? where holiday_typeId = ?";
            PreparedStatement ps = conn.prepareStatement(sqlUpdate);
            
            ps.setString(1, name);
            ps.setFloat(2, rate);
            ps.setInt(3, id);
        }catch(SQLException e){
            e.printStackTrace();
            DatabaseUtils.rollback(conn);
            
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
    }
    
    public static boolean checkIfExists2(String name, int id){
        boolean exists = false;
        try{
            conn = DatabaseUtils.getConnection();
            String strSelect = "select * from holiday_type where holidayTypeName = ? and holiday_typeId <> ?";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            
            ps.setString(1, name);
            ps.setFloat(2, id);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                exists = true;
            }
            
        }catch(SQLException e){
            e.printStackTrace();
            
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        
        return exists;
    }
}
