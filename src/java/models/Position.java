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
public class Position {
    int id;
    String name;
    
    public void setId(int num){
        this.id = num;
    }
    
    public int getId(){
        return id;
    }
    
    public void setName(String text){
        this.name = text;
    }
    
    public String getName(){
        return name;
    }
}
