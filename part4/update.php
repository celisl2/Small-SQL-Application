<?php
//update handles
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
<html>
    <body>
    <div class="homeL"><a href="index.php">Back Home</a></div>
    <div class="updateUser">
		<h1>Update Feilds</h1>
		<form action="update.php" method="POST">
			<label>ID of User to Update</label>
			<input type="text" name="IDUpdate">
			<br>
			<label>Field to Update</label>
			<input type="text" name="feildUpdate">
			<br>
			<label>Value to Update</label>
			<input type="text" name="valueUpdate">
			<br>
			<button class="btn" type="submit" name="updateToSQL">Update</button>
        </form>
        <p> <?php echo $message; ?></p>

    </div>
<?php
require_once('output.php');
}
if($_SERVER["REQUEST_METHOD"] == "POST")
{
    if(isset($_POST['IDUpdate']) && isset($_POST['feildUpdate']) && isset($_POST['valueUpdate']))
        {
            //check if user exists
            if(is_numeric($_POST['IDUpdate'])){
                $sqlCheck = mysqli_query($connection, 'SELECT Id FROM User_Account WHERE Id = ' . $_POST['IDUpdate']);
                if(mysqli_num_rows($sqlCheck) == 1)
                    $id = $_POST['IDUpdate'];
                else
                    header("Location: index.php");
            }
            
            if( ($_POST['feildUpdate'] == "First Name") || ($_POST['feildUpdate'] == "first name") || ($_POST['feildUpdate'] == "FirstName"))
            {
                $feild = 'FirstName';
                $value = '"'. $_POST['valueUpdate'] . '"';
            }
            else if(($_POST['feildUpdate'] == 'email') || ($_POST['feildUpdate'] == 'Email'))
            {
                $feild = 'Email';
                $value = '"'. $_POST['valueUpdate'] . '"';
            }
            else if(($_POST['feildUpdate'] == 'LastName') || ($_POST['feildUpdate'] == 'last name') || ($_POST['feildUpdate'] == 'Last Name'))
            {
                $feild = 'LastName';
                $value = '"'. $_POST['valueUpdate'] . '"';
            }
            else if(($_POST['feildUpdate'] == 'Phone') || ($_POST['feildUpdate'] == 'phone'))
            {
                $feild = 'Phone';
                $value = '"'. $_POST['valueUpdate'] . '"';
            }
            else if(($_POST['feildUpdate'] == 'StreetAddress') || ($_POST['feildUpdate'] == 'Street Address') || ($_POST['feildUpdate'] == 'street address'))
            {
                $feild = 'StreetAddress';
                $value = '"'. $_POST['valueUpdate'] . '"';
            }
            else if(($_POST['feildUpdate'] == 'City') || ($_POST['feildUpdate'] == 'city'))
            {
                $feild = 'City';
                $value = '"'. $_POST['valueUpdate'] . '"';
            }
            else if(($_POST['feildUpdate'] == 'State') || ($_POST['feildUpdate'] == 'state'))
            {
                $feild = 'State';
                $value = '"'. $_POST['valueUpdate'] . '"';
            }
            else if(($_POST['feildUpdate'] == 'Zip') || ($_POST['feildUpdate'] == 'zip'))
            {
                $feild = 'Zip';
                $value = $_POST['valueUpdate'];
            }
            else {
                header("Location: update.php");
            }
            //********  do the stuff for passwords here!
            
            //UPDATE User_Account SET State = 'FL' WHERE Id = 1;
            //build query
            $updateQuery = 'UPDATE User_Account SET ' . "$feild" . '=' . "$value WHERE Id = $id;";
            mysqli_query($connection, $updateQuery);
        }
        header("Location: update.php");
    }
mysqli_close($connection);
?>