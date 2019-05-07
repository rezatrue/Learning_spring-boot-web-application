<html>
	<head>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<title>Welcome TODOs page</title>
	</head>
	<body>
		<h1>ToDos for ${name} </h1> <br>
		<table>
		<thead>
			<tr>
				<th>Sl.No.</th>
				<th>Description</th>
				<th>Target Date</th>
				<th>Done</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${todos}" var="item" varStatus="loop">
			<tr>
				<td>${loop.index}</td>
				<td>${item.desc}</td>
				<td>${item.targetDate}</td>
				<td>${item.done}</td>
				
			</tr>
		</c:forEach>
		
		</tbody>
		</table>
				<a href="/add-todo"> Add ToDo</a>
	</body>

</html>