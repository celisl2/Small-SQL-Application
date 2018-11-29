<?php
require_once('connect.php');

if($_SERVER["REQUEST_METHOD"] == "POST")
{
   if((isset($_POST['Email']) && isset($_POST['FirstName']) && isset($_POST['LastName']) && isset($_POST['Phone']) 
      && isset($_POST['StreetAddress']) && isset($_POST['City']) && isset($_POST['State']) && isset($_POST['Zip'])
      && isset($_POST['Password'])))
   {
        $email = '"'. mysqli_real_escape_string($connection, $_POST['Email']) . '"';
        $fName = '"'. mysqli_real_escape_string($connection, $_POST['FirstName']) . '"';
        $lName = '"'. mysqli_real_escape_string($connection, $_POST['LastName']) . '"';
        $phone = '"'. mysqli_real_escape_string($connection, $_POST['Phone']) . '"';
        $StretAddress = '"'. mysqli_real_escape_string($connection, $_POST['StreetAddress']) . '"';
        $city = '"'. mysqli_real_escape_string($connection, $_POST['City']) . '"';
        $state = '"'. mysqli_real_escape_string($connection, $_POST['State']) . '"';
        $zip = mysqli_real_escape_string($connection, $_POST['Zip']);
        $salt = '"'. mysqli_real_escape_string($connection, $_POST['Password']) . '"';
        $hash = '"'. sha1(mysqli_real_escape_string($connection, $_POST['Password']) . "password") .'"';
        $insert = "INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)";
        $values = " VALUES (NULL, $email , $fName , $lName , $phone , $StretAddress , $city , $state, $zip, $salt, $hash);";

        $fullQuery = (string)($insert . $values);
        $addQuery = mysqli_query($connection, $fullQuery);
   }
   header("Location: index.php");
}