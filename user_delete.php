<?php

include 'connection.php';
session_start();
include 'authcheck.php';

if(isset($_GET['id'])){

    $id = $_GET['id'];
    $sql = "DELETE FROM pengguna WHERE id_user='$id' ";
    pg_query($connection, $sql);
    $_SESSION['delete'] = 'Berhasil Menghapus Data';
    header("location:user.php");
}

?>