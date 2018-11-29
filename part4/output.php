<?php 
//this file only outputs
require_once('connect.php');

//checks to see if we have results to output
if($resultCheck > 0 )
{
    echo "<table>";
    echo "<tr>";
        echo "<th>Id </th>";
        echo "<th>Email </th>";
        echo "<th>FirstName </th>";
        echo "<th>LastName </th>";
        echo "<th>Phone </th>";
        echo "<th>Steet Address </th>";
        echo "<th>City </th>";
        echo "<th>State </th>";
        echo "<th>Zip </th>";
        echo "<th>Salt </th>";
        echo "<th>Hash </th>";
    echo "</tr>";
    //outputs data from sql
    while($row = mysqli_fetch_row($results))
    {
        echo "<tr>";
            echo "<td>" . $row[0] . "</td>";
            echo "<td>" . $row[1] . "</td>";
            echo "<td>" . $row[2] . "</td>";
            echo "<td>" . $row[3] . "</td>";
            echo "<td>" . $row[4] . "</td>";
            echo "<td>" . $row[5] . "</td>";
            echo "<td>" . $row[6] . "</td>";
            echo "<td>" . $row[7] . "</td>";
            echo "<td>" . $row[8] . "</td>";
            echo "<td>" . $row[9] . "</td>";
            echo "<td>" . $row[10] . "</td>";
        echo "</tr>";
    }
}
