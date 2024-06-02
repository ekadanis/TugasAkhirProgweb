<?php 
include 'connection.php';
session_start();
include 'authcheck.php';

if (isset($_POST['simpan'])){
    $namabarang = $_POST['namabarang'];
    $hargabarang = $_POST['hargabarang'];
    $jumlah = $_POST['jumlah'];

    //menyimpan ke database
    $sql = "INSERT INTO barang (namabarang, hargabarang, jumlah) 
    VALUES ('$namabarang', '$hargabarang', '$jumlah')";
    $view = pg_query ($connection,$sql);

    $_SESSION['succes'] = 'Berhasil Menambahkan Data!';
    //mengalihkan ke halaman list Barang
    header("location:barang.php");
}
?>
