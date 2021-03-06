
<?php

session_start();

function start_session($row)
{
    $_SESSION['LOGGED_IN'] = true;
    $_SESSION['USERNAME'] = $row[0];
    $_SESSION['NUME'] = $row[2];
    $_SESSION['PRENUME'] = $row[3];
}

include 'databaseConnect.php';
$username = $password = "";
$userError = $passwordError = "";
$row = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {


    $username = clean_input($_POST["username"]);
    $password = clean_input($_POST["password"]);
    $hashedPassword = hash('sha256',$password);

    $query = mysqli_query($database_connection, "SELECT * FROM usercredentials WHERE `username` = '$username' AND `password` = '$hashedPassword' ");
    $row = mysqli_fetch_array($query);

    if ($row) {
        start_session($row);

        $response['success'] = true;
        $response['UserID'] = $row[0];
        $response['user'] = $row[1];
        $response['firstname'] = $row[3];
        $response['lastname'] = $row[4];
        $response['usertype'] = $row[5];

    } else {
        $response['success'] = false;
    }

    $response = json_encode($response);
    exit($response);


}

function clean_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    $data = mysqli_real_escape_string($GLOBALS['database_connection'],$data);
    return $data;
}

?>