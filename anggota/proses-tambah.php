<?php
include '../koneksi.php';

    if(isset($_POST['simpan']))
    {
        $nama = $_POST['nama'];
        $kelas = $_POST['kelas'];
        $telp = $_POST['telp'];
        $username = $_POST['username'];
        $password = $_POST['password']; 
        $id_level = 3;
    }
        
        $sql_tambah = "INSERT INTO anggota (nama, kelas, telp, username, password, id_level) 
                        VALUES ('$nama', '$kelas', '$telp', '$username', '$password', $id_level)";

        $hasil_tambah = mysqli_query($kon, $sql_tambah);

        $count = mysqli_affected_rows($kon);

        if($count == 1)
        {
            header("Location: index.php");
        }
        else{
            header("Location: tambah.php");
        
    }
?>