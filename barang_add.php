<?php 
include 'connection.php';
session_start();
include 'authcheck.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Tambah Barang</title>
</head>
<body>
<div class="container">
    <h1>Tambah Barang</h1><br><br>
    <form method="post" action="barang_add_aksi.php">
        <div class="form-group">
            <label>Nama Barang</label>
            <input type="text" name="namabarang" class="form-control" placeholder="Nama Barang">
        </div>
        <div class="form-group">
            <label>Harga Barang</label>
            <input type="number" name="hargabarang" class="form-control" placeholder="Harga Barang">
        </div>
        <div class="form-group">
            <label>Jumlah</label>
            <input type="number" name="jumlah" class="form-control" placeholder="Jumlah Stock">
        </div>
        <input type="submit" name="simpan" value="Simpan" class="btn btn-primary">
        <a href="barang.php" class="btn btn-warning">Kembali</a>
    </form>
</div>
</body>
</html>