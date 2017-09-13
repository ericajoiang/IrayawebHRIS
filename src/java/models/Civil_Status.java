/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author HP
 */
public class Civil_Status implements Serializable {
    
   private int civil_statusId;
   private String civilStatusName;

    public int getCivil_statusId() {
        return civil_statusId;
    }

    public void setCivil_statusId(int civil_statusId) {
        this.civil_statusId = civil_statusId;
    }

    public String getCivilStatusName() {
        return civilStatusName;
    }

    public void setCivilStatusName(String civilStatusName) {
        this.civilStatusName = civilStatusName;
    }
   
   
    
}
