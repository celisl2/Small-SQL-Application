<?php
require_once('connect.php');
if($_SERVER["REQUEST_METHOD"] == "GET")
{ 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Laura & Kim - Project</title>
</head>
<body>
	<a href="update.php">Update User Information</a>
	<div class="insertUser">
		<h1>Insert User</h1>
		<form method="POST" action="sqlProcess.php" >
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
			<div class="input-group">
				<label>City</label>
				<input type="text" name="City" value="">
			</div>
			<div class="input-group">
				<label>State</label>
				<input type="text" name="State" value="">
			</div>
			<div class="input-group">
				<label>Zip</label>
				<input type="text" name="Zip" value="">
			</div>
			<div class="input-group">
				<label>Salt</label>
				<input type="text" name="Salt" value="" placeholder="Must be 10 characters">
			</div>
			<div class="input-group">
				<label>Hash</label>
				<input type="text" name="Hash" value="" placeholder="Must be 10 characters">
			</div>
			<div class="input-group">
				<button class="btn" type="submit" name="addToSQL">Save</button>
			</div>
		</form>
	</div>
<?php
	require_once('output.php');
}
?>
</body>
</html>
<?php
if($_SERVER["REQUEST_METHOD"] == "POST")
{
	require_once('sqlProcess.php');

}
if($message)
	echo "Success!";
else
	echo $message;
mysqli_close($connection);
?>