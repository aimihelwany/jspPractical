<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@page import="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Status new student</title>
</head>
<body>
<p>
<%
      boolean login=false;
      String driverName="com.mysql.jdbc.Driver";
      String connectionURL="jdbc:mysql://localhost:3306/";
      String dbName="db1?useSSL=false";
      String userId="root";
      String password="1234";

      Connection connection=null;
      Statement statement=null;
      
      try{
    	login=true;
        Class.forName(driverName);
        connection=DriverManager.getConnection(connectionURL+dbName,userId,password);
      } catch(Exception e){
    	  out.println(e.getMessage());
      }
      
      
      if(login){
    	  try{
    	  PreparedStatement stmt=connection.prepareStatement("insert into student values(?,?,?,?)");
			stmt.setString(1,request.getParameter("id"));
			stmt.setString(2,request.getParameter("password"));
			stmt.setString(3,request.getParameter("name"));
			stmt.setString(4,request.getParameter("department"));
			System.out.println(stmt);
			
			int row=stmt.executeUpdate();
			if(row>0){
				out.println(row+" result inserted");
			}else{
				out.println("Failed to insert result");
			}
		  
	}catch(Exception e){
		out.println(e.getMessage());
	}
}
%>
</p>
</body>
</html>