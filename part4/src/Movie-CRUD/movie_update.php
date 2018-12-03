<?php
//update handles
require_once('connect_movie.php');
if($_SERVER["REQUEST_METHOD"] == "GET")
{
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Laura & Kim - Project</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,500" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../../styles/styles.css">
</head>
<html>
    <body>
    <div class="homeL">
        <a href="../../public/index.php"> << Back to User Insert</a>
    </div>    
        <a class="kim" href="insert_movie.php"><< Back to Movie Insert</a>
    
    <div class="insertUser">
		<h1>Update Movie Fields</h1>
		<form action="movie_update.php" method="POST">
			<label>ID of User to Update</label>
			<input type="text" name="IDUpdate">
			<br>
			<label>Field to Update</label>
			<input type="text" name="fieldUpdate">
			<br>
			<label>Value to Update</label>
			<input type="text" name="valueUpdate">
			<br>
			<button class="btn" type="submit" name="updateToSQL">Update</button>
        </form>
        <p> <?php echo $message; ?></p>

    </div>
<?php
require_once('display.php');
}
if($_SERVER["REQUEST_METHOD"] == "POST")
{
    if(isset($_POST['IDUpdate']) && isset($_POST['fieldUpdate']) && isset($_POST['valueUpdate']))
        {
            //check if user exists
            if(is_numeric($_POST['IDUpdate'])){
                $movie_sqlCheck = mysqli_query($connection_movie, 'SELECT Id FROM Movie WHERE Id = ' . $_POST['IDUpdate']);
                if(mysqli_num_rows($movie_sqlCheck) == 1)
                    $id = $_POST['IDUpdate'];
                else
                    header("Location: insert_movie.php");
            }
            
            if( ($_POST['fieldUpdate'] == "Name") || ($_POST['fieldUpdate'] == "name"))
            {
                $field = 'Name';
                $value = '"'. mysqli_real_escape_string($connection_movie, $_POST['valueUpdate']) . '"';
            }
            else if(($_POST['fieldUpdate'] == 'Year Released') || ($_POST['fieldUpdate'] == 'year released') || ($_POST['fieldUpdate'] == 'yearreleased') || ($_POST['fieldUpdate'] == 'YearReleased') || ($_POST['fieldUpdate'] == 'Year released'))
            {
                $field = 'YearReleased';
                $value = '"'. mysqli_real_escape_string($connection_movie, $_POST['valueUpdate']) . '"';
            }
            else if(($_POST['fieldUpdate'] == 'Run Time') || ($_POST['fieldUpdate'] == 'run time') || ($_POST['fieldUpdate'] == 'runtime') || ($_POST['fieldUpdate'] == 'Runtime'))
            {
                $field = 'RunTime';
                $value = '"'. mysqli_real_escape_string($connection_movie, $_POST['valueUpdate']) . '"';
            }
            else if(($_POST['fieldUpdate'] == 'Description') || ($_POST['fieldUpdate'] == 'description'))
            {
                $field = 'Description';
                $value = '"'. mysqli_real_escape_string($connection_movie, $_POST['valueUpdate']) . '"';
            }
            else {
                header("Location: movie_update.php");
            }
            //********  do the stuff for passwords here!
            
            //build query
            $updateQuery_movie = 'UPDATE Movie SET ' . "$field" . '=' . "$value WHERE Id = $id;";

            mysqli_query($connection_movie, $updateQuery_movie);
        }
        header("Location: movie_update.php");
    }
mysqli_close($connection_movie);
?>