<?php
include 'connection.php';
session_start();

if(isset($_POST['masuk'])){
    $username = $_POST['username'];
    $psswd = $_POST['psswd'];

    $sql = "SELECT * FROM pengguna WHERE username='$username' and psswd='$psswd'";
    $query = pg_query($connection, $sql);

    //mendapatkan hasil dari data
    $data = pg_fetch_assoc($query);

    //mendapatkan nilai jumlah data
    $check = pg_num_rows($query);

    if(!$check){
        $SESSION['error'] = 'Username dan Password salah';
    }else{
        $_SESSION['id_user'] = $data['id_user'];
        $_SESSION['namapengguna'] = $data['namapengguna'];
        $_SESSION['id_role'] = $data['id_role'];

        header("location:index.php");
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Form Login</title>
</head>
<body>
<div class="container">

    <!-- Alert ERROR -->
    <?php 
        if(isset($_SESSION['error']) && $_SESSION['error']!= '' ){?>
        <div class="alert alert-danger" role="alert">
            <?= $_SESSION['error']?>
        </div>
    <?php 
    }
    $_SESSION['error'] = ''; 
    ?>
    <!-- END Alert ERROR -->
    
    <h1>Login</h1>
    <form method="post" action="">
        <div class="form-group">
            <label for="exampleInputEmail">Username</label>
            <input type="text" class="form-control" name="username" placeholder="Masukkan Username Anda">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword">Password</label>
            <input type="password" class="form-control" name="psswd" placeholder="Masukkan Password Anda">
        </div>
        <input type="submit" name="masuk" value="Login" class="btn btn-primary">
</div>
</form>
</body>
</html>