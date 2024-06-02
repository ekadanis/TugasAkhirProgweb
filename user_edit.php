<?php
include 'connection.php';
session_start();
include 'authcheck.php';

$res = "SELECT * FROM role";
$role = pg_query($connection, $res);

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $sql = "SELECT * FROM pengguna WHERE id_user = $id";
    //menampilkan data berdasarkan ID
    $data = pg_query($connection, $sql);
    $data = pg_fetch_assoc($data);
    // var_dump($data);
}

if (isset($_POST['update'])) {
    $id = $_GET['id'];

    $namapengguna = $_POST['namapengguna'];
    $username = $_POST['username'];
    $psswd = $_POST['psswd'];
    $id_role = $_POST['id_role'];


    //menyimpan ke database
    $sql = "UPDATE pengguna SET namapengguna='$namapengguna', username='$username', psswd='$psswd', id_role=$id_role WHERE id_user = $id";
    pg_query($connection, $sql);
    //return var_dump($_POST);

    $_SESSION['edit'] = 'Berhasil melakukan Update';
    //mengalihkan ke halaman list user
    header("location:user.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Perbarui User</title>
</head>

<body>
    <div class="container">
        <h1>Memperbarui user</h1>
        <form method="post" action="">
            <div class="form-group">
                <label>Nama Pengguna</label>
                <input type="text" name="namapengguna" class="form-control" placeholder="Masukkan Nama Pengguna" value="<?= $data['namapengguna'] ?>">
            </div>
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" class="form-control" placeholder="Masukkan Nama Pengguna" value="<?= $data['username'] ?>">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="psswd" class="form-control" placeholder="Masukkan Password" value="<?= $data['psswd'] ?>">
            </div>
            <div class="form-group">
                <label>Role Akses</label>
                <select class="form-control" name="id_role">
                    <option value="">Pilih Role Akses</option>
                <?php while($row = pg_fetch_array($role)){?>
                    <option value="<?=$row['id_role']?>" <?=$row['id_role']==$data['id_role']?'selected':''?> >
                    <?=$row['namarole']?>
                    </option>
                <?php } ?>
                </select>
            </div>
            <input type="submit" name="update" value="Perbarui" class="btn btn-primary">
            <a href="user.php" class="btn btn-warning">Kembali</a>
        </form>
    </div>
</body>

</html>