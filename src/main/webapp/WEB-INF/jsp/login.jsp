<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>JSP page</title>
</head>
<body>
	<font color="red"> ${errorMessage}</font>
		<form method="POST">
				Name : <input name="name" type="text" value="ali"/>
				Password : <input name="password" type="password" value="password"/>
				<input type="submit"/>
		</form>
</body>
</html>