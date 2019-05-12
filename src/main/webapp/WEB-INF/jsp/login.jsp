<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<div class="container">
	<font color="red"> ${errorMessage}</font>
		<form method="POST">
				Name : <input name="name" type="text" value="ali"/>
				Password : <input name="password" type="password" value="password"/>
				<input type="submit"/>
		</form>
</div>

<%@ include file="common/footer.jspf" %>