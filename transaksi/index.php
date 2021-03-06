<?php
include '../koneksi.php';

$sql = "SELECT * FROM peminjaman INNER JOIN anggota
        ON peminjaman.id_anggota = anggota.id_anggota
        INNER JOIN petugas ON peminjaman.id_petugas = petugas.id_petugas
        ORDER BY peminjaman.tgl_pinjam";

$res = mysqli_query($kon, $sql);

$pinjam = array();

while ($data = mysqli_fetch_assoc($res)){
    $pinjam[] = $data;
}

include '../aset/header.php';
?>

<div class="container">
    <div class="row mt-4">
        <div class="col-md">
        
        </div>
    </div>
</div>

    <div class="card">
        <div class="card-header">
            <h2 class="card-title"> <i class="far fa-edit"></i> Data Peminjaman</h2>
        </div>
        <a class="btn btn-outline-secondary mb-2" href="form-pinjam.php" role="button"><i class="fas fa-plus"></i> Tambah Data Peminjaman</a>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nama Peminjam</th>
                    <th scope="col">Tanggal Pinjam</th>
                    <th scope="col">Tanggal Jatuh Tempo</th>
                    <th scope="col">Petugas</th>
                    <th scope="col">Status</th>
                    <th scope="col">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php

                        $no = 1;
                        foreach ($pinjam as $p) { ?>
                            <tr>
                                <th scope="row"><?= $no?></th>
                                <td><?= $p['nama']?></th>
                                <td><?= date('d F Y', strtotime($p['tgl_pinjam']))?></th>
                                <td><?= date('d F Y', strtotime($p['tgl_jatuh_tempo']))?></th>
                                <td><?= $p['nama_petugas']?></td>
                                <td>
                                <span class="badge badge-secondary"><?= $p['status'] ?>
                                </span>
                                </td>
                                <td>
                                    <a href="detail.php?id_pinjam=<?= $p['id_pinjam'] ?>" class="badge badge-success">Detail</a>
                                    <a href="form-edit.php?id_pinjam=<?= $p['id_pinjam']?>" class="badge badge-warning">Edit</a>
                                    <a href="hapus.php?id_pinjam=<?= $p['id_pinjam'] ?>" class="badge badge-danger">Hapus</a>
                                </td>
                            </tr>

                    <?php
                    $no++;
                        }
                    ?>
                </tbody>
        </table>
        </div>
    </div>

<?php
include '../aset/footer.php';
?>