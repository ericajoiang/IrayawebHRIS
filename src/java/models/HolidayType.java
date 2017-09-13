/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Martin
 */
public class HolidayType {
    int id;
    String name;
    float rate;
    
    public HolidayType(){
    }
    
    public void setId(int num){
        this.id = num;
    }
    
    public void setName(String text){
        this.name = text;
    }
    
    public void setRate(float num){
        this.rate = num;
    }
    
    public int getId(){
        return id;
    }
    
    public String getName(){
        return name;
    }
    
    public float getRate(){
        return rate;
    }
}
