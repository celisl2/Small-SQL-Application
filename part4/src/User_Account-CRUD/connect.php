<?php
//this file connects sql to php

$server = "deltona.birdnest.org";
$usr = "my.celisl2";
$pss = "celisl2";
$dbName = "my_celisl2_355";

//connect to sql server
$connection = mysqli_connect($server, $usr, $pss, $dbName);
//this outputs the entire table
$sql_initial = "SELECT * FROM User_Account;";
$results = mysqli_query($connection, $sql_initial);
$resultCheck = mysqli_num_rows($results);



