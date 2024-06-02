<?php
include 'connection.php';
session_start();
//include 'authcheck.php';

$sql = "SELECT * FROM barang";
$view = pg_query($connection,$sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>List Barang</title>
</head>
<body>
<div class="container">

    <h1>Daftar Produk</h1><br>
    <table class="table table-bordered">
        <tr>
            <th>ID Barang</th>
            <th>Nama Barang</th>
            <th>Harga Barang</th>
        </tr>
        <?php
        while ($row = pg_fetch_assoc($view)) {?>
        
        <tr>
            <td><?= $row['namabarang'] ?> </td>
            <td>FOTO PRODUK</td>
            <td><?= $row['hargabarang'] ?> </td>
        </tr>
        <?php } 
        ?>
    </table>
</div>
</body>
</html>