<?php
include 'connection.php';
session_start();
include 'authcheck.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $sql = "SELECT * FROM barang WHERE id_barang = $id";
    $data = pg_query($connection, $sql);
    $data = pg_fetch_assoc($data);
}

if (isset($_POST['update'])) {
    $id = $_GET['id'];
    $namabarang = $_POST['namabarang'];
    $hargabarang = $_POST['hargabarang'];
    $jumlah = $_POST['jumlah'];

    // Periksa apakah ada file gambar yang diunggah
    if ($_FILES['foto']['name']) {
        $target_dir = "foto/";
        $target_file = $target_dir . basename($_FILES["foto"]["name"]);

        if (move_uploaded_file($_FILES["foto"]["tmp_name"], $target_file)) {
            $sql = "UPDATE barang SET namabarang='$namabarang', hargabarang='$hargabarang', jumlah='$jumlah', foto='$target_file' WHERE id_barang = $id";
            pg_query($connection, $sql);

            $_SESSION['edit'] = 'Berhasil melakukan Update';
            header("location:barang.php");
        } else {
            $_SESSION['error'] = "Maaf, terjadi kesalahan saat mengunggah file Anda.";
        }
    } else {
        // Jika tidak ada file yang diunggah, hanya perbarui record di database tanpa mengubah gambar
        $sql = "UPDATE barang SET namabarang='$namabarang', hargabarang='$hargabarang', jumlah='$jumlah' WHERE id_barang = $id";
        pg_query($connection, $sql);

        $_SESSION['edit'] = 'Berhasil melakukan Update';
        // Mengalihkan ke halaman list barang
        header("location:barang.php");
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Perbarui Barang</title>
    <style>
        #preview {
            max-width: 300px;
            margin-top: 10px;
        }
    </style>
    <script>
        function previewImage() {
            const fileInput = document.getElementById('formFile');
            const preview = document.getElementById('preview');
            const file = fileInput.files[0];
            const reader = new FileReader();

            reader.addEventListener("load", function() {
                preview.src = reader.result;
            }, false);

            if (file) {
                reader.readAsDataURL(file);
            }
        }
    </script>
</head>

<body>
    <div class="container">
        <h1>Memperbarui Barang</h1>
        <form method="post" action="" enctype="multipart/form-data">
            <div class="form-group">
                <label>Nama Barang</label>
                <input type="text" name="namabarang" class="form-control" placeholder="Nama Barang" value="<?= $data['namabarang'] ?>">
            </div>
            <div class="form-group">
                <label>Harga Barang</label>
                <input type="number" name="hargabarang" class="form-control" placeholder="Harga Barang" value="<?= $data['hargabarang'] ?>">
            </div>
            <div class="form-group">
                <label>Jumlah</label>
                <input type="number" name="jumlah" class="form-control" placeholder="Jumlah Stock" value="<?= $data['jumlah'] ?>">
            </div>
            <div class="form-group">
                <label class="form-label">Upload foto barang</label>
                <input class="form-control" type="file" id="formFile" name="foto" onchange="previewImage()">
                <img id="preview" src="#" alt="Preview Gambar" style="display:none;" />
                <?php if ($data['foto']) : ?>
                    <img src="<?= $data['foto'] ?>" alt="Foto Barang" style="max-width: 100px;">
                <?php endif; ?>
            </div>
            <input type="submit" name="update" value="Perbarui" class="btn btn-primary">
            <a href="barang.php" class="btn btn-warning">Kembali</a>
        </form>
    </div>
    <script>
        document.getElementById('formFile').addEventListener('change', function() {
            const preview = document.getElementById('preview');
            preview.style.display = 'block';
        });
    </script>
</body>

</html>