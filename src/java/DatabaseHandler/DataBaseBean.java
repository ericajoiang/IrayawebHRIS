/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseHandler;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author HP
 */
public class DataBaseBean implements Serializable {
    
        String dbuser = "";
        String dbpass = "";
        String dbUrl = "";  

        
    public String getDbuser() {
        return dbuser;
    }

    public void setDbuser(String dbuser) {
        
        this.dbuser = dbuser;
    }

    public String getDbpass() {
        return dbpass;
    }

    public void setDbpass(String dbpass) {
        this.dbpass = dbpass;
    }

    public String getDbUrl() {
        return dbUrl;
    }

    public void setDbUrl(String dbUrl) {
        this.dbUrl = dbUrl;
    }
        
        
    
}
