<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@page import="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudentInfo</title>
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
        Class.forName(driverName);
        connection=DriverManager.getConnection(connectionURL+dbName,userId,password);
        PreparedStatement stmt=connection.prepareStatement("select name from student where id=? and password=?");
        stmt.setString(1,request.getParameter("id"));
        stmt.setString(2,request.getParameter("password"));
        System.out.println(stmt);
        ResultSet rs=stmt.executeQuery();
        	if(rs.next()){
        		login=true;
        	}
      } catch(Exception e){
    	  out.println(e.getMessage());
      }
      if(login){
      %>
      <%out.println("Hello");%>
      <%=request.getParameter("id")%>
      , your password is <%=request.getParameter("password")%>
      
      <%
      try{
      	statement=connection.createStatement();
      	ResultSet rs=statement.executeQuery("select id, name, department from student");
      %>
      
      <table border="1">
      <tr>
      	<th>ID</th>
      	<th>Name</th>
      	<th>Department</th>
      </tr>
      
      <%
      while(rs.next()){
      %>
      
      <tr>
      	<td><%=rs.getString("id")%></td>
      	<td><%=rs.getString("name")%></td>
      	<td><%=rs.getString("department")%></td>
      </tr>
      
      <%
      }
      %>
      </table>
      
      <p>
      <a href="AddStudent.jsp"><button type='addStudent'>Add Student</button></a>
      <a href="Marks.jsp?<%=request.getParameter("id")%>"><button type='marks'>Marks</button></a>
      </p>
      
      <%
      } catch(Exception e){
      out.println(e.getMessage());
      }
      }else{
      %>
      <p>login failed</p>	
      <%
      }
      %>
</p>
</body>
</html>