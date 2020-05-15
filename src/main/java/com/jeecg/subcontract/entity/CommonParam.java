package com.jeecg.subcontract.entity;

import java.util.ResourceBundle;

public class CommonParam {
	
    private static String propertyFileName;
    
    private static ResourceBundle resourceBundle;
    
    public CommonParam() {
        propertyFileName = "config";
        Bundle();
    }
    
    public CommonParam(String filePath){
    	propertyFileName = filePath;
    	Bundle();
    }
    
    private static void Bundle(){
    	resourceBundle = ResourceBundle.getBundle(propertyFileName);
    }
    
    private static ResourceBundle getBundle(){
    	if(resourceBundle==null){
    		resourceBundle = ResourceBundle.getBundle("config");
    	}
    	return resourceBundle;
    }
    
    public static String getString(String key) throws Exception {
    	String result = "";
        if (key==null || key.length()==0) {
        	result = "";
        }else{
            result = getBundle().getString(key);
        }
        return result;
    }
}
