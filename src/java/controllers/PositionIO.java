/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Utils.DatabaseUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import models.Position;

/**
 *
 * @author Martin
 */
public class PositionIO {
    static Connection conn = null;
    static Statement stmt = null;
    
    public PositionIO() {
    }
    
    public static boolean checkIfExists(String name){
        boolean exists = false;

        try{
            conn = DatabaseUtils.getConnection();
            String strSelect = "select * from position where positionName = ?";
            PreparedStatement ps = conn.prepareStatement(strSelect);
            ps.setString(1, name);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                exists = true;
            }
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
        return exists;
    }
    
    public static void createPosition(String name){
        try{
            conn = DatabaseUtils.getConnection();
            String sqlInsert = "insert into position (positionName) values (?)";
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
    
    public static ArrayList<Position> getPositions(){
        ArrayList<Position> positions = new ArrayList<Position>();
        
        try{
            conn = DatabaseUtils.getConnection();
            stmt = conn.createStatement();
            
            ResultSet rs = stmt.executeQuery("select * from position");
            while(rs.next()){
                Position position = new Position();
                
                position.setId(rs.getInt("positionId"));
                position.setName(rs.getString("positionName"));
                
                positions.add(position);
            }
        }catch(SQLException e){
            System.out.println(e);
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        
        return positions;
    }
    
    public static void updatePosition(Position position){
        try{
            conn = DatabaseUtils.getConnection();
            stmt = conn.createStatement();

            String strUpdate = "update position set positionName = ? where positionId = ?";
            PreparedStatement ps = conn.prepareStatement(strUpdate);

            ps.setString(1, position.getName());
            ps.setInt(2, position.getId());

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
