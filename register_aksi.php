<?php
include 'connection.php';
session_start();
//include 'authcheck.php';

$sql = "SELECT * FROM role";
$role = pg_query($connection, $sql);

if (isset($_POST['simpan'])) {
    $namapengguna = $_POST['namapengguna'];
    $username = $_POST['username'];
    $psswd = $_POST['psswd'];
    $id_role = $_POST['id_role'];
    
    //menyimpan ke database
    $sql = "INSERT INTO pengguna (namapengguna, username, psswd, id_role) 
            VALUES ('$namapengguna', '$username', '$psswd', '$id_role')";
    $view = pg_query($connection, $sql);
    //return var_dump($_POST);
    //var_dump($view);
    $_SESSION['succes'] = 'Berhasil Menambahkan Data!';
    //mengalihkan ke halaman list user
    header("location:viewBarang.php");
}
