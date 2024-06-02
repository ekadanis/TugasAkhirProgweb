<?php
include 'connection.php';
session_start();
include 'authcheck_kasir.php';

$sql = "SELECT * FROM barang";
$barang = pg_query($connection, $sql);
//print_r($_SESSION);

$sum = 0;
if (isset($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $key => $value) {
        $sum += $value['hargabarang'] * $value['qty'];
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <title>Kasir</title>
</head>

<body>
    <div class="container">
        <?php
        if (isset($_SESSION['alert']) && $_SESSION['alert'] != '') {
            echo '<br><div class="alert alert-danger" role="alert">' . $_SESSION['alert'] . '</div>';
            // Kosongkan nilai setelah ditampilkan
            $_SESSION['alert'] = '';
        }
        ?>
        <div class="row">
            <div class="col-md-12">
                <h1>Kasir</h1>
                <h2>Hallooo, <?= $_SESSION['namapengguna'] ?></h2>
                <a href="logout.php">Logout</a> |
                <a href="cart_reset.php">Reset Keranjang</a>
                <br>
                <br>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <form method="POST" action="cart_add.php" class="form-inline">
                    <div class="input-group">
                        <select class="form-control" name="id_barang">
                            <option value="">Pilih Barang</option>
                            <?php while ($row = pg_fetch_array($barang)) { ?>
                                <option value="<?= $row['id_barang'] ?>">
                                    <?= $row['namabarang'] ?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="input-group">
                        <input type="number" name="qty" class="form-control" placeholder="Jumlah">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit">Tambah</button>
                        </span>
                    </div>
                </form>
                <br>
                <form method="POST" action="cart_update.php">
                    <table class="table table-bordered">
                        <tr>
                            <th>Nama Barang</th>
                            <th>Harga</th>
                            <th>QTY</th>
                            <th>Sub Total</th>
                            <th>Aksi</th>
                        </tr>
                        <?php if (isset($_SESSION['cart'])) {
                            foreach ($_SESSION['cart'] as $key => $value) {
                        ?>
                                <tr>
                                    <td align="center"><?= $value['namabarang'] ?></td>
                                    <td align="right"><?= number_format($value['hargabarang']) ?></td>
                                    <td class="col-md-2"><input type="number" name="qty[]" value="<?= $value['qty'] ?>" class="form-control"></td>
                                    <td align="right"><?= number_format($value['qty'] * $value['hargabarang']) ?></td>
                                    <td>
                                        <a href="cart_delete.php?id_barang=<?= $value['id_barang'] ?>" class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i></a>
                                    </td>
                                </tr>
                        <?php }
                        } ?>
                    </table>
                    <button class="btn btn-success" type="submit">Perbarui</button>
                </form>
            </div>
            <div class="col-md-4">
                <h3>Total = Rp <?= number_format($sum) ?></h3>
                <form method="post" action="transaksi_add.php">
                    <div class="form-group">
                        <label>Bayar</label>
                        <input type="text" name="bayar" id="bayar" class="form-control">
                    </div>
                    <input type="hidden" name="total" value="<?= $sum ?>">
                    <button class="btn btn-primary" type="submit">Selesai</button>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //inisialisasi inputan
        var bayar = document.getElementById('bayar');

        bayar.addEventListener('keyup', function(e) {
            bayar.value = formatRupiah(this.value, 'Rp. ');
            //harga = cleanRupiah(dengan_rupiah.value);
            //calculate(harga, service.value);
        })

        //generate dari inputan angka menjadi formar rupiah
        function formatRupiah(angka, prefix) {
            var number_string = angka.replace(/[^,\d]/g, '').toString(),
                split = number_string.split(','),
                sisa = split[0].length % 3,
                rupiah = split[0].substr(0, sisa),
                ribuan = split[0].substr(sisa).match(/\d{3}/gi);

            if (ribuan) {
                separator = sisa ? '.' : '';
                rupiah += separator + ribuan.join('.');
            }

            rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
            return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '');
        }

        //generate dari inputan rupiah menjadi angka
        function cleanRupiah(rupiah) {
            var clean = rupiah.replace(/\D/g, '');
            return clean;
            // console.log(clean);
        }
    </script>

</body>

</html>