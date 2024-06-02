<?php
include 'connection.php';
session_start();
include 'authcheck.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $sql = "SELECT * FROM barang WHERE id_barang = $id";
    //menampilkan data berdasarkan ID
    $data = pg_query($connection, $sql);
    $data = pg_fetch_assoc($data);
    // var_dump($data);
}

if (isset($_POST['update'])) {
    $id = $_GET['id'];
    $namabarang = $_POST['namabarang'];
    $hargabarang = $_POST['hargabarang'];
    $jumlah = $_POST['jumlah'];


    //menyimpan ke database
    $sql = "UPDATE barang SET namabarang='$namabarang', hargabarang='$hargabarang', jumlah='$jumlah' WHERE id_barang = $id";
    pg_query($connection, $sql);

    $_SESSION['edit'] = 'Berhasil melakukan Update';
    //mengalihkan ke halaman list barang
    header("location:barang.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Perbarui Barang</title>
</head>

<body>
    <div class="container">
        <h1>Memperbarui Barang</h1>
        <form method="post" action="">
            <div class="form-group">
                <label>Nama Barang</label>
                <input type="text" name="namabarang" class="form-control" placeholder="Nama Barang" value="<?= $data['namabarang'] ?>">
            </div>
            <div class="form-group">
                <label>Harga Barang</label>
                <input type="number" name="hargabarang" class="form-control" placeholder="Harga Barang" value="<?= $data['hargabarang'] ?>">
            </div>
            <div class="form-group">
                <label>Jumlah</label>
                <input type="number" name="jumlah" class="form-control" placeholder="Jumlah Stock" value="<?= $data['jumlah'] ?>">
            </div>
            <input type="submit" name="update" value="Perbarui" class="btn btn-primary">
            <a href="barang.php" class="btn btn-warning">Kembali</a>
        </form>
    </div>
</body>

</html>