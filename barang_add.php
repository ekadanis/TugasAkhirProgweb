<?php
include 'connection.php';
session_start();
include 'authcheck.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Tambah Barang</title>
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
        <h1>Tambah Barang</h1><br><br>
        <form method="post" action="barang_add_aksi.php" enctype="multipart/form-data">
            <div class="form-group">
                <label>Nama Barang</label>
                <input type="text" name="namabarang" class="form-control" placeholder="Nama Barang" required>
            </div>
            <div class="form-group">
                <label>Harga Barang</label>
                <input type="number" name="hargabarang" class="form-control" placeholder="Harga Barang" required>
            </div>
            <div class="form-group">
                <label>Jumlah</label>
                <input type="number" name="jumlah" class="form-control" placeholder="Jumlah Stock" required>
            </div>
            <div class="form-group">
                <label class="form-label">Upload foto barang</label>
                <input class="form-control" type="file" id="formFile" name="foto" onchange="previewImage()" required>
                <img id="preview" src="#" alt="Preview Gambar" style="display:none;" />
            </div>
            <input type="submit" name="simpan" value="Simpan" class="btn btn-primary">
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