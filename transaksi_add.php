<?php

include 'connection.php';
session_start();
include 'authcheck_kasir.php';

//menghilangkan Rp pada nominal
$bayar = preg_replace('/\D/', '', $_POST['bayar']);
//print_r((preg_replace('/\D/', '', $_POST['total'])));
$tanggalwaktu = date('Y-m-d H:i:s');
$total = $_POST['total'];
if ($bayar < $total) {
    $_SESSION['alert'] = 'duwitmu kurang';
    header("Location: kasir.php");
} else {
    $id_user = $_SESSION['id_user'];
    $kembali = $bayar - $total;



    //insert ke tabel transaksi
    $sql = "INSERT INTO transaksi (tanggalwaktu, total, id_user, bayar, kembali) 
        VALUES ('$tanggalwaktu','$total', '$id_user','$bayar', '$kembali') 
        RETURNING id_transaksi";

    $resultTransaksi = pg_query($connection, $sql);

    // if (!$resultTransaksi) {
    //     die("Error in SQL: " . pg_last_error($connection));
    // }

    $rowTransaksi = pg_fetch_assoc($resultTransaksi);

    $id_transaksi = $rowTransaksi['id_transaksi'];


    foreach ($_SESSION['cart'] as $key => $value) {
        $id_barang = $value['id_barang'];
        $hargabarang = $value['hargabarang'];
        $qty = $value['qty'];
        $total = $hargabarang * $qty;

        $query = "INSERT INTO transaksidetail (id_transaksi, id_barang, qty, total) 
              VALUES ('$id_transaksi', '$id_barang', '$qty', '$total')";

        pg_query($connection, $query);
        $query = "UPDATE barang
              SET jumlah = jumlah - $qty
              WHERE id_barang = $id_barang;";
        pg_query($connection, $query);
    }

    header("location: transaksi_selesai.php?id_trx=" . $id_transaksi);
}
