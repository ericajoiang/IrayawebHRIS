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
public class LeaveType {
    int id;
    String name;
    float rateToCash;
    int maxCredit;
    Date replenishmentDate;
    
    public void setId(int num){
        this.id = num;
    }
    
    public int getId(){
        return id;
    }
    
    public void setName(String text){
        this.name=text;
    }
    
    public void setRateToCash(float rate){
        this.rateToCash=rate;
    }
    
    public void setMaxCredit(int num){
        this.maxCredit=num;
    }
    
    public void setReplenishmentDate(Date date){
        this.replenishmentDate=date;
    }
    
    public String getName(){
        return this.name;
    }
    
    public float getRateToCash(){
        return this.rateToCash;
    }
    
    public int getMaxCredit(){
        return this.maxCredit;
    }
    
    public Date getReplenishmentDate(){
        return this.replenishmentDate;
    }
}
