<?php 
include 'authcheck.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Tambah Role</title>
</head>
<body>
<div class="container">
    <h1>Tambah Role</h1><br><br>
    <form method="post" action="role_add_aksi.php">
        <div class="form-group">
            <label>Nama Role</label>
            <input type="text" name="namarole" class="form-control" placeholder="Nama Role">
        </div>
        <input type="submit" name="simpan" value="Simpan" class="btn btn-primary">
        <a href="role.php" class="btn btn-warning">Kembali</a>
    </form>
</div>
</body>
</html>