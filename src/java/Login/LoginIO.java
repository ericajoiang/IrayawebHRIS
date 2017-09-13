/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class LoginIO {
 
    private final String dbUser;
    private final String dbPassword;
    private final String dbUrl;

    public LoginIO(String dbUser, String dbPassword, String dbUrl) {
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
        this.dbUrl = dbUrl;
    }
    
    public boolean getUserIfValidAdmin(String username, String password) throws SQLException
    {
        Connection conn = null;
        LoginBean row = null;
        boolean ifvalid = false;
        
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
             
            }
        
        try {
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            String sql = "select * from admin where username = ? and password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                ifvalid = true;
            }
            System.out.println(rs.getString("username"));
           
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return ifvalid;
    }
    
      public EmployeeAccountBean getEmployeeAccount(int username, String password) throws SQLException
    {
        Connection conn = null;
        EmployeeAccountBean row = null;
        try {
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            String sql = "select * from employee where employeeNum = ? and password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                row = new EmployeeAccountBean();
                int employeeId = rs.getInt("employeeId");
                int departmentId = rs.getInt("departmentId");
                int shiftId = rs.getInt("shiftId");
                int positionId = rs.getInt("positionId");
                int civil_statusId = rs.getInt("civil_statusId");
                int employeeNum = rs.getInt("employeeNum");
                Blob profilepic = rs.getBlob("profilepic");
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String lastName = rs.getString("lastName");
                int numOfDependents = rs.getInt("numOfDependents");
                int bankAccountNum = rs.getInt("bankAccountNum");
                int contactNum = rs.getInt("contactNum");
                String email = rs.getString("email");
                int basicSalary = rs.getInt("basicSalary");
                Date birthDate = rs.getDate("birthDate");
                Date entryDate = rs.getDate("entryDate");
                Date exitDate = rs.getDate("exitDate");
                int pagibigId = rs.getInt("pagibigId");
                int sssId = rs.getInt("sssId");
                int philhealthId = rs.getInt("philhealthId");
                int tinNum = rs.getInt("tinNum");
                String passWord = rs.getString("password");
                int isRegular = rs.getInt("isRegular");
                int isEmployed = rs.getInt("isEmployed");

                
                row.setEmployeeId(employeeId);
                row.setDepartmentId(departmentId);
                row.setShiftId(shiftId);
                row.setPositionId(positionId);
                row.setCivil_statusId(civil_statusId);
                row.setEmployeeNum(employeeNum);
                row.setProfilepic(profilepic);
                row.setFirstName(firstName);
                row.setMiddleName(middleName);
                row.setLastName(lastName);
                row.setNumOfDependents(numOfDependents);
                row.setBankAccountNum(bankAccountNum);
                row.setContactNum(contactNum);
                row.setEmail(email);
                row.setBasicSalary(basicSalary);
                row.setBirthDate(birthDate);
                row.setEntryDate(entryDate);
                row.setExitDate(exitDate);
                row.setPagibigId(pagibigId);
                row.setSssId(sssId);
                row.setPhilhealthId(philhealthId);
                row.setTinNum(tinNum);
                row.setPassword(passWord);
                row.setIsRegular(isRegular);
                row.setIsRegular(isRegular);
                
              
             
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return row;
    }

    
    
    
    
}
