<?php 
//this file only outputs
require_once('connect_movie.php');

//checks to see if we have results to output
if($movie_resultCheck > 0 )
{
    echo "<table>";
    echo "<tr>";
        echo "<th>Id </th>";
        echo "<th>Name </th>";
        echo "<th>Year Released </th>";
        echo "<th>Run Time </th>";
        echo "<th>Description </th>";
    echo "</tr>";
    //outputs data from sql
    while($movieRow = mysqli_fetch_row($movie_results))
    {
        echo "<tr>";
            echo "<td>" . $movieRow[0] . "</td>";
            echo "<td>" . $movieRow[1] . "</td>";
            echo "<td>" . $movieRow[2] . "</td>";
            echo "<td>" . $movieRow[3] . "</td>";
            echo "<td>" . $movieRow[4] . "</td>";
            ?>
            <td> 
            <form method="POST" action="insert_movie.php">
                    <input type="hidden" name="delete" value="<?php echo $movieRow[0]; ?>">
                    <button type="submit">Delete Movie</button>
                </form>
            </td>
            <?php
        echo "</tr>";
    }
}
