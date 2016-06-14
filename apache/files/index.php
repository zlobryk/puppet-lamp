<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "information_schema";
// Create connection
if (!mysql_connect('localhost', 'root', '')) {
    echo 'error connect to mysql mysql';
    exit;
}
$sql = "SHOW TABLES FROM $dbname";
$result = mysql_query($sql);

if (!$result) {
    echo "Error couldn't read table list\n";
    echo 'MySQL error: ' . mysql_error();
    exit;
}
    echo "Database <B>$dbname</b> content:\n";
    echo "<br>";
while ($row = mysql_fetch_row($result)) {
    echo "Table: {$row[0]}\n";
    echo "<br>";
}

mysql_free_result($result);


#$conn = mysql_connect($servername, $username, $password);
#if ($conn->connect_error) {
#    die("Connection failed: " . $conn->connect_error);
#}
#$db_list = mysql_list_dbs($conn);
#
#while ($row = mysql_fetch_object($db_list)) {
#    echo $row->Database . "\n";
#}
?>
