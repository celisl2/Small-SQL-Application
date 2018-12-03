<?php
//this file connects sql to php

$server = "deltona.birdnest.org";
$usr = "my.celisl2";
$pss = "celisl2";
$dbName = "my_celisl2_355";

//connect to sql server
$connection_movie = mysqli_connect($server, $usr, $pss, $dbName);
//this outputs the entire table
$sql_movie_all = "SELECT * FROM Movie;";
$movie_results = mysqli_query($connection_movie, $sql_movie_all);
$movie_resultCheck = mysqli_num_rows($movie_results);