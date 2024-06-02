<?php
include 'connection.php';
session_start();
include 'authcheck_kasir.php';

if (isset($_POST['id_barang'])) {
    $id_barang = $_POST['id_barang'];
    // var_dump($id_barang);
    check_and_update_cart($_SESSION['cart'], $id_barang);

    krsort($_SESSION['cart']);

    header('location:kasir.php');
}
function check_and_update_cart(&$cart, $id_barang)
{
    include 'connection.php';

    if (!is_array($cart)) {
        $cart = [];
    }

    $qty = $_POST['qty'];

    foreach ($cart as &$item) {
        if ($item['id_barang'] === $id_barang) {
            $item['qty'] += $qty;
            return;
        }
    }

    $sql = "SELECT * FROM barang WHERE id_barang=$id_barang";
    $data = pg_query($connection, $sql);
    $b = pg_fetch_assoc($data);

    $barang = [
        'id_barang' => $b['id_barang'],
        'namabarang' => $b['namabarang'],
        'hargabarang' => $b['hargabarang'],
        'qty' => $qty
    ];

    $cart[] = $barang;
}
