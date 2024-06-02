<?php 
include 'connection.php';
session_start();
include 'authcheck.php';

if (isset($_POST['simpan'])){
    $namarole = $_POST['namarole'];

    //menyimpan ke database
    $sql = "INSERT INTO role (namarole) VALUES ('$namarole')";
    pg_query ($connection,$sql);
    
    $_SESSION['succes'] = 'Berhasil Menambahkan Data!';
    //mengalihkan ke halaman list Barang
    header("location:role.php");
}
?>
