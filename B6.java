import com.mongodb.*;

import org.bson.Document;
import org.json.simple.*;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class B6 {
    
    public static void main(String[] args)  {
        
        JSONObject obj=new JSONObject();
        obj.put("name","ABC1");
        obj.put("age",new Integer(19));
        obj.put("salary",new Double(60000));
        System.out.println(obj);
        
        JSONObject obj2=new JSONObject();
        obj2.put("name","ABC2");
        obj2.put("age",new Integer(191));
        obj2.put("salary",new Double(600001));
        System.out.println(obj2);
        
        JSONObject obj3=new JSONObject();
        obj3.put("name","ABC32");
        obj3.put("age",new Integer(1913));
        obj3.put("salary",new Double(6000013));
        System.out.println(obj3);
        
        JSONArray arr = new JSONArray();
        arr.add(obj);
        arr.add(obj2);
        arr.add(obj3);
        
        try
        {
        	
        	String IP_ADDR = "10.10.10.54";
	      	int PORT = 27017;
	        String USER = "t31106";
	      	String DATABASE = "t31106";
	      	String PASSWORD = "t31106";
	      	
	      	String new_collection = "B6";
        	
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
            
	        //Create an instance of the collection
            MongoCollection collection = database.getCollection(new_collection);
            
            //Add the JSON objects to the collection
            for(int i=0;i<3;i++) {
                Document doc = Document.parse(arr.get(i).toString());
                collection.insertOne(doc);
            }
            
            FindIterable<Document> docs = collection.find();
            if (docs == null) {
                System.out.println("Not found");
            }
            
            for(Document doc1 : docs) {
                System.out.println(doc1);
            }
            
            System.out.println("Done");
            mongo.close();
        }
        catch(MongoException e){
            e.printStackTrace();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
