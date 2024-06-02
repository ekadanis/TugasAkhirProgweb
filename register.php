<?php
include 'user_add_aksi.php';
//include 'authcheck.php';
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Tambah User</title>
</head>

<body>
    <div class="container">
        <h1>Tambah User</h1><br><br>
        <form method="post" action="register_aksi.php">
            <div class="form-group">
                <label>Nama Pengguna</label>
                <input type="text" name="namapengguna" class="form-control" placeholder="Masukkan Nama Pengguna">
            </div>
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" class="form-control" placeholder="Masukkan Username">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="psswd" class="form-control" placeholder="Masukkan Password ">
            </div>
            <div class="form-group">
                <label>Role Akses</label>
                <select class="form-control" name="id_role">
                    <option value="">Pilih Role Akses</option>
                <?php while($row = pg_fetch_array($role)){?>
                    <option value="<?=$row['id_role']?>"><?=$row['namarole']?></option>
                <?php } ?>
                </select>
            </div>
            <input type="submit" name="simpan" value="Simpan" class="btn btn-primary">
            <a href="user.php" class="btn btn-warning">Kembali</a>
        </form>
    </div>
</body>

</html>