
import java.sql.*;
import java.io.*;

public class JDBC_dbms {
	public static void main(String args[])
	{
		String url="jdbc:mysql://10.10.13.31:3306/t31106db";;
		String user="t31105";
		String password="t31105";
		
		Connection con=null;
		Statement stmt=null;
		try
		{
			DriverManager.registerDriver(new com.mysql.jdbc.Driver()); 
			  
            //Reference to connection interface 
            con = DriverManager.getConnection(url,user,password); 
  
			//STEP 2: Register JDBC driver
		      Class.forName("com.mysql.jdbc.Driver");
		      System.out.println("error");
		      //STEP 3: Open a connection
		      System.out.println("Connecting to a selected database...");
		      con = DriverManager.getConnection(url, user, password);
		      System.out.println("Connected database successfully...");
		      
		   //   System.out.println("Creating table in given database...");
		      stmt = con.createStatement();
		      
		      String sql= "create view viewCust1 as select * from Customer";

		      stmt.executeUpdate(sql);
		       ResultSet rs=stmt.executeQuery("select * from viewCust1");
		      while(rs.next())
		      {
		    	  System.out.println(rs.getInt(1)+ "	"+ rs.getString(2)+"	"+ rs.getString(3));
		      }
		   }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   }finally{
		      //finally block used to close resources
		      try{
		         if(con!=null)
		            con.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }//end try
		   System.out.println("Goodbye!");
		
	}
}
