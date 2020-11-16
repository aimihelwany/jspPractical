<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Student</title>
<script>
		function validate(){
			if(document.getElementById('id').value==''){
				alert('Student ID is compulsary');
			} else if(document.getElementById('password').value==''){
					alert('Password is compulsary');
			} else if(document.getElementById('name').value==''){
				alert('Name is compulsary');
			} else if(document.getElementById('department').value==''){
				alert('Department is compulsary');
			} else{
				document.getElementById('addStudent').submit();
			}
		}
	</script>
</head>
<body>
	<form action="AddStudentProcess.jsp" method='POST' id='addStudent'>
	<p>Student ID:<input type='text' name='id' id='id'/></p>
	<p>Password:<input type='password' name='password' id='password'/></p>
	<p>Name:<input type='text' name='name' id='name'/></p>
	<p>Department:<input type='text' name='department' id='department'/></p>
	</form>
	<p><button type='submit' onclick='validate()'>Submit</button></p>
</body>
</html>