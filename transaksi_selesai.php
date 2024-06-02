<?php
include 'connection.php';
session_start();
include 'authcheck_kasir.php';

$id_trx = $_GET['id_trx'];

$sql = "SELECT b.namabarang, b.hargabarang, td.qty, td.total
        FROM barang as b
        INNER JOIN transaksidetail as td ON b.id_barang = td.id_barang
        WHERE td.id_transaksi = $id_trx;";

$trx = pg_query($connection, $sql);

$sql = "SELECT t.tanggalwaktu, t.bayar, t.kembali, t.total, p.namapengguna
        FROM transaksi as t
        INNER JOIN pengguna as p ON p.id_user = t.id_user
        WHERE t.id_transaksi = $id_trx";

$user = pg_query($connection, $sql);
$user = pg_fetch_assoc($user);

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Struck Belanja</title>
</head>

<body>
    <style type="text/css">
        body {
            color: black;
        }
    </style>
    <div align="center">
        <table width="500" border="0" cellpadding="1" cellspacing="0">
            <tr>
                <th>
                    <h2>Caffein</h2><br>
                    Jalan Raya ITS, Keputih-Sukolilo, Surabaya 60111<br>
                    No. Telp 0895405983136
                </th>
            </tr>
            <tr>
                <br>
                <td><br><br><?= date('d-m-y H:i:s', strtotime($user['tanggalwaktu'])) ?> - <?= $user['namapengguna'] ?> <br><br></td>
            </tr>
            <tr>
                <td>
                    <hr>
                </td>
            </tr>
        </table>
        <table width="500" border="0" cellpadding="3" cellspacing="0">
            <?php while ($transaksi = pg_fetch_array($trx)) { ?>
                <tr>
                    <td><?= $transaksi['namabarang'] ?></td>
                    <td><?= $transaksi['qty'] ?></td>
                    <td align="right"><?= $transaksi['hargabarang'] ?></td>
                    <td align="right"><?= $transaksi['hargabarang'] * $transaksi['qty'] ?></td>
                </tr>
            <?php } ?>
            <tr>
                <td colspan="4">
                    <hr>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="3">Total</td>
                <td align="right"><?= $user['total'] ?></td>
            </tr>
            <tr>
                <td align="right" colspan="3">Bayar</td>
                <td align="right"><?= $user['bayar'] ?></td>
            </tr>
            <tr>
                <td align="right" colspan="3">Kembali</td>
                <td align="right"><?= $user['kembali'] ?></td>
            </tr>
        </table>
        <table width="500" border="0" cellpadding="1" cellspacing="0">
            <tr>
                <td>
                    <hr>
                </td>
            </tr>
            <tr>
                <th>Terimakasih, sehat-sehat orang baik</th>
            </tr>
            <tr>
                <th>====== Selamat Menenangkan Hati dan Pikiran =====</th>
            </tr>
        </table><br><br>
        <button onclick="window.print()" class="btn btn-primary">Print this page</button>
        <button class="btn btn-primary"><a href="cart_reset.php">Selesai</a></button>
    </div>
</body>

</html>