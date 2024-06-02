<?php
if (isset($_SESSION['id_user'])) {
    if ($_SESSION['id_role'] == 1) {
        header("location:index.php");
    }
} else {
    $_SESSION['error'] = "Login Dulu Bang";
    header("location:login.php");
}
