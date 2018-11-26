<?php 
    require_once('connect.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Laura & Kim - Project</title>
</head>
<body>
<?php
    $sql_initial = "SELECT * FROM Person;";
    $results = mysqli_query($connection, $sql_initial);

    //to show data in website
    $resultCheck = mysqli_num_rows($results);
    if($resultCheck > 0 )
    {
        echo "hi \n";
        while($row = mysqli_fetch_row($results))
        {
            
        }
    }



?>
</body>
</html>