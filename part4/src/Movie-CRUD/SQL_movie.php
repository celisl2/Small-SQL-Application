<?php
require_once('connect_movie.php');

if($_SERVER["REQUEST_METHOD"] == "POST")
{
   if((isset($_POST['Name']) && isset($_POST['YearReleased']) && isset($_POST['RunTime']) && isset($_POST['Description'])))
   {
        $name = '"'. mysqli_real_escape_string($connection_movie, $_POST['Name']) . '"';
        $yearReleased = '"'. mysqli_real_escape_string($connection_movie, $_POST['YearReleased']) . '"';
        $runTime = '"'. mysqli_real_escape_string($connection_movie, $_POST['RunTime']) . '"';
        $description = '"'. mysqli_real_escape_string($connection_movie, $_POST['Description']) . '"';
        $insert_movie = "INSERT INTO Movie (Id, Name, YearReleased, RunTime, Description)";
        $movie_values = " VALUES (NULL, $name , $yearReleased , $runTime , $description);";

        $fullQuery_movie = (string)($insert_movie . $movie_values);
        $addQuery_movie = mysqli_query($connection_movie, $fullQuery_movie);
   }
   header("Location: insert_movie.php");
}