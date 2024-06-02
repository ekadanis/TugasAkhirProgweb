<?php
include 'connection.php';
session_start();
include 'authcheck.php';

if (isset($_POST['simpan'])) {
    $namabarang = $_POST['namabarang'];
    $hargabarang = $_POST['hargabarang'];
    $jumlah = $_POST['jumlah'];

    $target_dir = "foto/";
    $target_file = $target_dir . basename($_FILES["foto"]["name"]);

    if (move_uploaded_file($_FILES["foto"]["tmp_name"], $target_file)) {
        // Menyimpan ke database dengan nama file
        $sql = "INSERT INTO barang (namabarang, hargabarang, jumlah, foto) 
                VALUES ('$namabarang', '$hargabarang', '$jumlah', '$target_file')";
        $view = pg_query($connection, $sql);

        $_SESSION['success'] = 'Berhasil Menambahkan Data!';
        // Mengalihkan ke halaman list Barang
        header("location:barang.php");
    } else {
        $_SESSION['error'] = "Maaf, terjadi kesalahan saat mengunggah file Anda.";
        header("location:barang.php");
    }
}
