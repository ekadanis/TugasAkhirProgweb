<?php
include 'connection.php';
session_start();
include 'authcheck.php';

$sql = "SELECT p.id_user, p.namapengguna, p.username, p.psswd, r.namarole
        FROM pengguna as p
        INNER JOIN  role as r ON r.id_role=p.id_role";
$view = pg_query($connection,$sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>List User</title>
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

    <h1>List User</h1><br>
    <a href="user_add.php" class="btn btn-primary">Tambah Data</a>   <a href="index.php" class="btn btn-warning ">Kembali</a> <br><br><br>
    <table class="table table-bordered">
        <tr>
            <th>ID User</th>
            <th>Nama Pengguna</th>
            <th>Username</th>
            <th>Password</th>
            <th>Role Akses</th>
            <th>Aksi</th>
        </tr>
        <?php
        while ($row = pg_fetch_assoc($view)) {?>
        <tr>
            <td><?= $row['id_user'] ?> </td>
            <td><?= $row['namapengguna'] ?> </td>
            <td><?= $row['username'] ?> </td>
            <td><?= $row['psswd'] ?> </td>
            <td><?= $row['namarole'] ?> </td>
            <td>
                <a href="user_edit.php?id= <?=$row['id_user']?> ">Edit</a> |
                <a href="user_delete.php?id= <?=$row['id_user']?> " onclick="return confirm('Apakah Anda yakin ingin menghapus?')">Hapus</a>
            </td>
        </tr>
        <?php } 
        ?>
    </table>
</div>
</body>
</html>