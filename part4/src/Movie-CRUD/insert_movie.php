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
    <a href="../../public/index.php"> << Back to User Insert</a>
    <a class="kim" href="movie_update.php">Movie Update</a>
    <h1>Insert Movie</h1>
    <div class="insertUser">
		<form method="POST" action="SQL_movie.php" >
            <div class="input-group">
			    <label>Movie Name</label>
			    <input type="text" name="movieName" value="">
            </div>
            <div class="input-group">
			    <label>Year Released</label>
			    <input type="text" name="YearReleased" value="">
			</div>
            <div class="input-group">
			    <label>Run Time</label>
			    <input type="text" name="RunTime" value="">
			</div>
            <div class="input-group">
                <label>Description (optional)</label>
			    <input type="text" name="Description" value="">
			</div>
			<div class="input-group">
				<button class="btn" type="submit" name="addToSQL">Save</button>
			</div>
        </form>
    </div>
<?php
	require_once('display.php');
}
if($_SERVER["REQUEST_METHOD"] == "POST")
{
	
	if(isset($_POST['delete']))
	{
		$deleteQuery_movie = 'DELETE FROM Movie WHERE Id=' . $_POST['delete'] . ';';
		mysqli_query($connection_movie, $deleteQuery_movie);
		header("Location: insert_movie.php");
	}
	else
		require_once('SQL_Movie.php');
}

mysqli_close($connection_movie);
?>