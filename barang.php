<?php
include 'connection.php';
session_start();
include 'authcheck.php';

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
<?php
// Tampilkan pesan sukses jika ada
if(isset($_SESSION['succes']) && $_SESSION['succes'] != '') {
    echo '<br><div class="alert alert-success" role="alert">' . $_SESSION['succes'] . '</div>';
    // Kosongkan nilai setelah ditampilkan
    $_SESSION['succes'] = '';
}

else if(isset($_SESSION['edit']) && $_SESSION['edit'] != '') {
    echo '<br><div class="alert alert-success" role="alert">' . $_SESSION['edit'] . '</div>';
    // Kosongkan nilai setelah ditampilkan
    $_SESSION['edit'] = '';
}

else if(isset($_SESSION['delete']) && $_SESSION['delete'] != '') {
    echo '<br><div class="alert alert-success" role="alert">' . $_SESSION['delete'] . '</div>';
    // Kosongkan nilai setelah ditampilkan
    $_SESSION['delete'] = '';
}
?>

    <h1>List Barang</h1><br>
    <a href="barang_add.php" class="btn btn-primary">Tambah Data</a> <a href="index.php" class="btn btn-warning ">Kembali</a> <br><br>
    <table class="table table-bordered">
        <tr>
            <th>ID Barang</th>
            <th>Nama Barang</th>
            <th>Harga Barang</th>
            <th>Jumlah</th>
            <th>Aksi</th>
        </tr>
        <?php
        while ($row = pg_fetch_assoc($view)) {?>
        
        <tr>
            <td><?= $row['id_barang'] ?> </td>
            <td><?= $row['namabarang'] ?> </td>
            <td><?= $row['hargabarang'] ?> </td>
            <td><?= $row['jumlah'] ?> </td>
            <td>
                <a href="barang_edit.php?id= <?=$row['id_barang']?> ">Edit</a> |
                <a href="barang_delete.php?id= <?=$row['id_barang']?> " onclick="return confirm('Apakah Anda yakin ingin menghapus?')">Hapus</a>
            </td>
        </tr>
        <?php } 
        ?>
    </table>
</div>
</body>
</html>