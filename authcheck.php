<?php
if (isset($_SESSION['id_user'])) {
    if ($_SESSION['id_role'] == 2) {
        header("location:kasir.php");
    }
} else {
    $_SESSION['error'] = "Login Dulu Bang";
    header("location:login.php");
}
