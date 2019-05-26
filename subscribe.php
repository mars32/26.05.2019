<?php

// header('Content-Type : application/json');

// die(true);

$json = file_get_contents('php://input');
$post = json_decode($json, true);

$res = false;

// die(false);

if(!empty($post) && !empty($post['email'])){

        $DB_HOST = 'localhost';
        $DB_USER = 'root';
        $DB_PASS = '';
        $DB_NAME = 'mars32';

        $link = mysqli_connect(
        $DB_HOST,
        $DB_USER,
        $DB_PASS,
        $DB_NAME
        );

        mysqli_set_charset($link, "utf-8");

        $email = htmlspecialchars($post['email']);

        $query = "INSERT INTO email(email) VALUES ('$email');";

        $res = mysqli_query($link, $query);

        // die(false);

        mysqli_close($link);

}


// die(false);
die(json_encode($res));
?>