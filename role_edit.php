<?php
include 'connection.php';
session_start();
include 'authcheck.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $sql = "SELECT * FROM role WHERE id_role = $id";
    //menampilkan data berdasarkan ID
    $data = pg_query($connection, $sql);
    $data = pg_fetch_assoc($data);
}

if (isset($_POST['update'])) {
    $id = $_GET['id'];
    $namarole = $_POST['namarole'];

    //menyimpan ke database
    $sql = "UPDATE role SET namarole='$namarole' WHERE id_role = $id";
    pg_query($connection, $sql);

    $_SESSION['edit'] = 'Berhasil melakukan Update';
    //mengalihkan ke halaman list barang
    header("location:role.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Perbarui Role</title>
</head>

<body>
    <div class="container">
        <h1>Memperbarui Role</h1>
        <form method="post" action="">
            <div class="form-group">
                <label>Nama Role</label>
                <input type="text" name="namarole" class="form-control" placeholder="Nama Role" value="<?= $data['namarole'] ?>">
            </div>
            <input type="submit" name="update" value="Perbarui" class="btn btn-primary">
            <a href="role.php" class="btn btn-warning">Kembali</a>
        </form>
    </div>
</body>

</html>