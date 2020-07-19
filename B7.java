import com.mongodb.client.*; 
import com.mongodb.MongoClient; 
import com.mongodb.MongoCredential;

import org.bson.*;
import org.json.simple.JSONObject; 
import org.json.simple.JSONValue;   

public class B7	 { 
   
   public static void main( String args[] ) {  
      
	  String IP_ADDR = "10.10.10.54";
	  int PORT = 27017;
	  String USER = "t31106";
	  String DATABASE = "t31106";
	  String PASSWORD = "t31106";
	  
	  String new_collection = "B7";
	  
      // Creating a Mongo client 
      MongoClient mongo = new MongoClient( IP_ADDR , PORT ); 
   
      // Creating Credentials 
      MongoCredential credential; 
      credential = MongoCredential.createCredential(USER, DATABASE, 
         PASSWORD.toCharArray()); 
      System.out.println("Connected to the database successfully");  
      
      // Accessing the database 
      MongoDatabase database = mongo.getDatabase(DATABASE); 
      System.out.println("Credentials ::"+ credential);     
      
      //Creating Collection
      database.createCollection(new_collection); 
      System.out.println("\nCollection created successfully");
      MongoCollection<Document> col= database.getCollection(new_collection);
      
      
      //Encoding JSON Object
      JSONObject obj=new JSONObject();    
	  obj.put("Name","Gautam Nahar");    
	  obj.put("Age",new Integer(20));    
	  obj.put("Salary",new Double(600000));  
	  obj.put("Batch", "TE1 K1 forevaaaaaa");
		
	  Document doc= Document.parse(obj.toString());
	  col.insertOne(doc);
	
	  
	//Decoding JSON Object
	  
	  Object obj1=JSONValue.parse(obj.toString());  
	  JSONObject jsonObject = (JSONObject) obj1;  
  
	  String name = (String) jsonObject.get("Name");  
	  double salary = (Double) jsonObject.get("Salary");  
	  long age = (Long) jsonObject.get("Age");  
	  System.out.println("Name : "+name+"\nSalary :  "+salary+"\nAge :  "+age);  

   } 
}
