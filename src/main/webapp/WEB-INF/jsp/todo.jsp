<html>
	<head>
		<title>Add TODO page</title>
		<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="container">
		<h1>Add ToDo </h1><br>
		<form method="POST">
		<fieldset class="form-group">
				<label>Description</label>
				<input type="text" name="desc" class="form-control"  required="required"/>
		</fieldset>
		
		<button type="submit" class="btn btn-success" >add</button>
		</form>
		
		</div>
		<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	    <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	</body>

</html>