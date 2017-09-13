/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Utils.DatabaseUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import models.Holiday;
/**
 *
 * @author Martin
 */
public class HolidayIO {
    static Connection conn = null;
    static Statement stmt = null;
    
    public HolidayIO(){
    }
    
    public static boolean checkIfUpdateExists(int id, String name, Date date)
    {
        boolean exists = false;

        try
        {
            conn = DatabaseUtils.getConnection();
            String strSelect = "select * from holiday where holidayName = ? and holidayId != ? and date = ?";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            ps.setString(1, name);
            ps.setInt(2, id);
            ps.setDate(3, date);
            
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
            String strSelect = "select * from holiday where holidayName= ?";
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
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        
        return exists;
    }
    
    public static void createHoliday(String name, int holidayType, Date date, String startTime, String endTime){
        
        try{
            conn = DatabaseUtils.getConnection();
            String sqlInsert = "insert into holiday (holiday_typeId, holidayName, startTime, endTime, date) values (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sqlInsert);
            
            ps.setInt(1, holidayType);
            ps.setString(2, name);
            ps.setString(3, startTime);
            ps.setString(4, endTime);
            ps.setDate(5, date);
            ps.executeUpdate();
            
            DatabaseUtils.commit(conn);
        }
        catch(SQLException e){
            DatabaseUtils.rollback(conn);
            e.printStackTrace();
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }catch(SQLException e){   
                e.printStackTrace();
            }
        }
    }
    
        public static void updateHoliday(int id, String name, int holidayType, Date date, String startTime, String endTime){
        
        try{
            conn = DatabaseUtils.getConnection();
            String sqlInsert = "update holiday set holiday_typeId = ?,  holidayName = ?,  startTime = ?, endTime = ?,  date = ? where holidayId = ?";
            PreparedStatement ps = conn.prepareStatement(sqlInsert);
            
            ps.setInt(1, holidayType);
            ps.setString(2, name);
            ps.setString(3, startTime);
            ps.setString(4, endTime);
            ps.setDate(5, date);
            ps.setInt(6, id);
            ps.executeUpdate();
            
            DatabaseUtils.commit(conn);
        }
        catch(SQLException e){
            DatabaseUtils.rollback(conn);
            e.printStackTrace();
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }catch(SQLException e){   
                e.printStackTrace();
            }
        }
    }
    
    public static ArrayList<Holiday> getHolidays(){
        ArrayList<Holiday> holidays = new ArrayList<Holiday>();
        
        try{
            conn = DatabaseUtils.getConnection();
            String strSelect = "select * from holiday";
            PreparedStatement ps = conn.prepareStatement(strSelect);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Holiday holiday = new Holiday();
                
                holiday.setId(rs.getInt("holidayId"));
                holiday.setHolidayType(rs.getInt("holiday_typeId"));
                holiday.setName(rs.getString("holidayName"));
                holiday.setDate(rs.getDate("date"));
                holiday.setStartTime(rs.getString("startTime"));
                holiday.setEndTime(rs.getString("endTime"));
                
                holidays.add(holiday);
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
        return holidays;
    }
}
