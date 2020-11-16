<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student marks</title>
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
        	  statement=connection.createStatement();
        	  ResultSet rs=statement.executeQuery("select id, science, english, math from marks");
          %>
          
          <table border="1">
          <tr>
          	<th>ID</th>
          	<th>Science</th>
          	<th>English</th>
          	<th>Math</th>
          	<th>Average</th>
          </tr>
          
          <%
          while(rs.next()){
        	  String science="";
        	  String english="";
        	  String math="";
        	  int average=0;  
          %>
  
          <tr>
          	<td><%=rs.getString("id")%></td>
          	<td><%=science=rs.getString("science")%></td>
          	<td><%=english=rs.getString("english")%></td>
          	<td><%=math=rs.getString("math")%></td>
          	<td><%=average=(Integer.parseInt(science)+ Integer.parseInt(english)+ Integer.parseInt(math))/3%></td>
          </tr>
          
          <%
          }
          %>
          </table>
      
         <%
      } catch(Exception e){
      out.println(e.getMessage());
      }
      }else{
      %>	
      <%
      }
      %>
</p>
</body>
</html>