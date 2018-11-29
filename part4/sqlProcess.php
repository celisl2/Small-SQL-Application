<?php
require_once('connect.php');

if($_SERVER["REQUEST_METHOD"] == "POST")
{
   if((isset($_POST['Email']) && isset($_POST['FirstName']) && isset($_POST['LastName']) && isset($_POST['Phone']) 
      && isset($_POST['StreetAddress']) && isset($_POST['City']) && isset($_POST['State']) && isset($_POST['Zip'])
      && isset($_POST['Salt']) && isset($_POST['Hash'])))
   {
        $email = '"'. mysqli_real_escape_string($connection, $_POST['Email']) . '"';
        $fName = '"'. $_POST['FirstName'] . '"';
        $lName = '"'. $_POST['LastName'] . '"';
        $phone = '"'. $_POST['Phone'] . '"';
        $StretAddress = '"'. $_POST['StreetAddress'] . '"';
        $city = '"'. $_POST['City'] . '"';
        $state = '"'. $_POST['State'] . '"';
        $zip = $_POST['Zip'];
        $salt = '"'. $_POST['Salt'] . '"';
        $hash = '"'. sha1($_POST['Hash'] . "password") .'"';
        $insert = "INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)";
        $values = " VALUES (NULL, $email , $fName , $lName , $phone , $StretAddress , $city , $state, $zip, $salt, $hash);";

        $fullQuery = (string)($insert . $values);
        $addQuery = mysqli_query($connection, $fullQuery);
   }
   header("Location: index.php");
}