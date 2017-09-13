/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;
import java.beans.*;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

/**
 *
 * @author HP
 */
public class EmployeeAccountBean implements Serializable {
    
   private int employeeId; //6
   private int departmentId; //2
   private int shiftId; //2
   private int positionId; //2
   private int civil_statusId; //2
   private int employeeNum; // 6
   private Blob profilepic;
   private String firstName;
   private String middleName;
   private String lastName;
   private int numOfDependents;
   private int bankAccountNum;
   private int contactNum;
   private String email;
   private int basicSalary;      
   private Date birthDate;
   private Date entryDate;        
   private Date exitDate;        
   private int pagibigId;        
   private int sssId;        
   private int philhealthId;  
   private int tinNum;
   private String password;     
   private int isRegular;
   private int isEmployed;

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public int getShiftId() {
        return shiftId;
    }

    public void setShiftId(int shiftId) {
        this.shiftId = shiftId;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public int getCivil_statusId() {
        return civil_statusId;
    }

    public void setCivil_statusId(int civil_statusId) {
        this.civil_statusId = civil_statusId;
    }

    public int getEmployeeNum() {
        return employeeNum;
    }

    public void setEmployeeNum(int employeeNum) {
        this.employeeNum = employeeNum;
    }

    public Blob getProfilepic() {
        return profilepic;
    }

    public void setProfilepic(Blob profilepic) {
        this.profilepic = profilepic;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getNumOfDependents() {
        return numOfDependents;
    }

    public void setNumOfDependents(int numOfDependents) {
        this.numOfDependents = numOfDependents;
    }

    public int getBankAccountNum() {
        return bankAccountNum;
    }

    public void setBankAccountNum(int bankAccountNum) {
        this.bankAccountNum = bankAccountNum;
    }

    public int getContactNum() {
        return contactNum;
    }

    public void setContactNum(int contactNum) {
        this.contactNum = contactNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(int basicSalary) {
        this.basicSalary = basicSalary;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public Date getExitDate() {
        return exitDate;
    }

    public void setExitDate(Date exitDate) {
        this.exitDate = exitDate;
    }

    public int getPagibigId() {
        return pagibigId;
    }

    public void setPagibigId(int pagibigId) {
        this.pagibigId = pagibigId;
    }

    public int getSssId() {
        return sssId;
    }

    public void setSssId(int sssId) {
        this.sssId = sssId;
    }

    public int getPhilhealthId() {
        return philhealthId;
    }

    public void setPhilhealthId(int philhealthId) {
        this.philhealthId = philhealthId;
    }

    public int getTinNum() {
        return tinNum;
    }

    public void setTinNum(int tinNum) {
        this.tinNum = tinNum;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsRegular() {
        return isRegular;
    }

    public void setIsRegular(int isRegular) {
        this.isRegular = isRegular;
    }

    public int getIsEmployed() {
        return isEmployed;
    }

    public void setIsEmployed(int isEmployed) {
        this.isEmployed = isEmployed;
    }
   
   
   
   
    
}
