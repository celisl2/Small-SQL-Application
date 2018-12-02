<?php
require_once('../src/User_Account-CRUD/connect.php');
require_once('../src/Movie-CRUD/connect_movie.php');
if($_SERVER["REQUEST_METHOD"] == "GET")
{ 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<title>Laura & Kim - Project</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,500" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../styles/styles.css">
</head>
<body>
	<a href="../src/User_Account-CRUD/update.php">Update User Information >> </a>
	<a class="kim" href="../src/Movie-CRUD/insert_movie.php">Go to Movie Insert >> </a>
	<h1>Insert User</h1>
	<div class="insertUser">
		<form method="POST" action="../src/User_Account-CRUD/sqlProcess.php" >
			<div class="input-group">
				<label>Email</label>
				<input type="text" name="Email" value="">
			</div>
			<div class="input-group">
				<label>First Name</label>
				<input type="text" name="FirstName" value="">
			</div>
			<div class="input-group">
				<label>Last Name</label>
				<input type="text" name="LastName" value="">
			</div>
			<div class="input-group">
				<label>Phone</label>
				<input type="text" name="Phone" value="">
			</div>
			<div class="input-group">
				<label>Street Address</label>
				<input type="text" name="StreetAddress" value="">
			</div>
			<div class="input-group2">
				<label>City</label>
				<input type="text" name="City" value="">
			</div>
			<div class="input-group2">
				<label>State</label>
				<input type="text" name="State" value="">
			</div>
			<div class="input-group2">
				<label>Zip</label>
				<input type="text" name="Zip" value="">
			</div>
			<div class="input-group2">
				<label>Password</label>
				<input type="password" name="Password" value="" placeholder="Must be 10 characters" maxlength="10">
			</div>
			<div class="input-group">
				<button class="btn" type="submit" name="addToSQL">Save</button>
			</div>
		</form>
	</div>
<?php
	require_once('../src/User_Account-CRUD/output.php');
}
if($_SERVER["REQUEST_METHOD"] == "POST")
{
	
	if(isset($_POST['delete']))
	{
		$deleteQuery = 'DELETE FROM User_Account WHERE Id=' . $_POST['delete'] . ';';
		mysqli_query($connection, $deleteQuery);
		header("Location: index.php");
	}
	else
		require_once('../src/User_Account-CRUD/sqlProcess.php');
}
if($message)
	echo "Success!";
else
	echo $message;
mysqli_close($connection);
?>