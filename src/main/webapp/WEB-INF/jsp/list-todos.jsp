<html>
	<head>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<title>Welcome TODOs page</title>
		<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="container">
		<h1>ToDos for ${name} </h1>
		<table class="table  table-striped">
		<thead>
			<tr>
				<th>Sl.No.</th>
				<th>Description</th>
				<th>Target Date</th>
				<th>Done</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${todos}" var="item" varStatus="loop">
			<tr>
				<td>${loop.index}</td>
				<td>${item.desc}</td>
				<td>${item.targetDate}</td>
				<td>${item.done}</td>
				<td><div><a type ="button" class="btn btn-warning" href="/delete-todo?id=${item.id}">Delete</a></div></td>
			</tr>
		</c:forEach>
		
		</tbody>
		</table>
				<div ><a href="/add-todo" type="button">Add ToDo</a></div>

		</div>
		<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	    <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		
	</body>

</html>