/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Date;

/**
 *
 * @author Martin
 */
public class Holiday {
    int id;
    int holidayType;
    String name;
    Date date;
    String startTime;
    String endTime;
    
    public void setId(int num){
        this.id = num;
    }
    
    public void setHolidayType(int num){
        this.holidayType = num;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public void setDate(Date date){
        this.date = date;
    }
    
    public void setStartTime(String startTime){
        this.startTime = startTime;
    }
    
    public void setEndTime(String endTime){
        this.endTime = endTime;
    }
    
    public int getId(){
        return id;
    }
    
    public int getHolidayType(){
        return holidayType;
    }
    
    public String getName(){
        return name;
    }
    
    public Date getDate(){
        return date;
    }
    
    public String getStartTime(){
        return startTime;
    }
    
    public String getEndTime(){
        return endTime;
    }
}
