package DatabaseHandler;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author HP
 */

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class DatabaseRetriever {
    
        String dbuser = "";
        String dbpass = "";
        String dbUrl = "";    
        
  public DataBaseBean retrieveDatabase()
    {
       DataBaseBean dbn = null;
    
        Properties prop = new Properties();
	InputStream input = null;
        String fileName = "/DatabaseHandler/database.properties";

	try {
            
                dbn = new DataBaseBean();
                input = getClass().getClassLoader().getResourceAsStream(fileName);

		// load a properties file
		prop.load(input);

		// get the property value and print it out
		dbn.setDbuser(prop.getProperty("dbuser"));
		dbn.setDbpass(prop.getProperty("dbpass"));
		dbn.setDbUrl(prop.getProperty("dbUrl"));
                

	} catch (IOException ex) {
		ex.printStackTrace();
	} finally {
		if (input != null) {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
        
        
        return dbn;
       
  }


}

    
