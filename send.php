<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $to = "prizvanie_fz_27@mail.ru";
    $subject = "Новое сообщение с сайта Призвание";

    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $message = htmlspecialchars($_POST['message']);

    $body = "Имя: $name\nEmail: $email\nСообщение:\n$message";
    $headers = "From: $email\r\nReply-To: $email";

    if(mail($to, $subject, $body, $headers)) {
        echo "OK";
    } else {
        echo "ERROR";
    }
}
?>
