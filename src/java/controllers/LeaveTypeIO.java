/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Utils.DatabaseUtils;
import models.LeaveType;
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
public class LeaveTypeIO {
    static Connection conn = null;
    static Statement stmt = null;
    
    public LeaveTypeIO() {
    }
    
    public static boolean checkIfExists(String name){
        boolean exists = false;
        
        try{
            conn = DatabaseUtils.getConnection();
            String strSelect = "select * from leave_type where leaveTypeName= ?";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            ps.setString(1, name);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                exists = true;
            }
        }catch(SQLException e){
            System.out.println(e);
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn != null) {
                    conn.close();
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        
        return exists;
    }
    
    public static void createLeaveType(LeaveType leaveType){
        
        try{
            conn = DatabaseUtils.getConnection();
            String sqlInsert = "insert into leave_type (leaveTypeName, rateToCash, maxCredit, replenishmentDate) values (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sqlInsert);
            
            ps.setString(1, leaveType.getName());
            ps.setFloat(2, leaveType.getRateToCash());
            ps.setInt(3, leaveType.getMaxCredit());
            ps.setDate(4, leaveType.getReplenishmentDate());
            ps.executeUpdate();
            
            DatabaseUtils.commit(conn);
        }
        catch(SQLException e){
            DatabaseUtils.rollback(conn);
            System.out.println(e);
        }
    }
    
    public static ArrayList<LeaveType> getLeaveTypes(){
        ArrayList<LeaveType> leaveTypes = new ArrayList<LeaveType>();
        
        try{
            Connection conn = DatabaseUtils.getConnection();
            Statement stmt = conn.createStatement();
            
            ResultSet rs = stmt.executeQuery("select * from leave_type");
            
            while(rs.next()){
                LeaveType leaveType = new LeaveType();
                leaveType.setId(rs.getInt("leave_typeId"));
                leaveType.setName(rs.getString("leaveTypeName"));
                leaveType.setRateToCash(rs.getFloat("rateToCash"));
                leaveType.setMaxCredit(rs.getInt("maxCredit"));
                leaveType.setReplenishmentDate(rs.getDate("replenishmentDate"));
                
                leaveTypes.add(leaveType);
                System.out.println("Leave type ID: " + leaveType.getId());
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
                
            }catch(SQLException e){
                System.out.println(e);
            }
        }
        
        return leaveTypes;
    }
    
    public static void updateLeaveType(LeaveType leaveType){
        
        try{
            Connection conn = DatabaseUtils.getConnection();
            String sqlUpdate = "update leave_type set leaveTypeName = ?, rateToCash = ?, maxCredit = ?, replenishmentDate = ? where leave_typeId = ?";
            PreparedStatement ps = conn.prepareStatement(sqlUpdate);
            
            ps.setString(1, leaveType.getName());
            ps.setFloat(2, leaveType.getRateToCash());
            ps.setInt(3, leaveType.getMaxCredit());
            ps.setDate(4, leaveType.getReplenishmentDate());
            ps.setInt(5, leaveType.getId());
            
            ps.executeUpdate();
            DatabaseUtils.commit(conn);
        }
        catch(SQLException ex){
            ex.printStackTrace();
            DatabaseUtils.rollback(conn);
        }
    }
}