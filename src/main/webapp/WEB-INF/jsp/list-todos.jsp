<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
	
<div class="container">
		<h1>ToDos for ${name} </h1>
		<table class="table  table-striped">
		<thead>
			<tr>
				<th>Sl.No.</th>
				<th>Description</th>
				<th>Target Date</th>
				<th>is this Done?</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${todos}" var="item" varStatus="loop">
			<tr>
				<td>${loop.index + 1}</td>
				<td>${item.desc}</td>
				<td><fmt:formatDate value="${item.targetDate}" pattern="dd/MM/yyyy" /></td>
				<td>${!(item.done)? "No" : "Yes"}</td>
				<td><div><a type ="button" class="btn btn-success" href="/update-todo?id=${item.id}">Update</a></div></td>
				<td><div><a type ="button" class="btn btn-warning" href="/delete-todo?id=${item.id}">Delete</a></div></td>
			</tr>
		</c:forEach>
		
		</tbody>
		</table>
				<div ><a href="/add-todo" type="button">Add ToDo</a></div>

		
</div>


<%@ include file="common/footer.jspf" %>