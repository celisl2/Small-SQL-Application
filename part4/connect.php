<?php
/**
 * Created by PhpStorm.
 * User: lauracelis
 * Date: 11/24/18
 * Time: 6:41 PM
 */

$server = "deltona.birdnest.org";
$usr = "my.celisl2";
$pss = "celisl2";
$dbName = "my_celisl2_355";

//connect to sql server
$connection = mysqli_connect($server, $usr, $pss, $dbName);

if(!$connection)
   die('did not connect');
echo "yes!";

