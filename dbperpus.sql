-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2021 at 03:33 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbperpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `id_level` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `kelas`, `telp`, `username`, `password`, `id_level`) VALUES
(1, 'Abigail', 'XRPL2', '202-555-0139', 'abigail', 'abigail', 3),
(3, 'Carol', 'XRPL3', '202-555-0155', 'carol', 'carol', 3),
(4, 'Ian', 'XTKJ6', '202-555-0192', 'ian', 'ian', 3),
(5, 'Dylan', 'XTKJ3', '202-555-0113', 'dylan', 'dylan', 3),
(6, 'Nadila', 'XRPL2', '111-222-3333', 'nadila', 'nadila', 3),
(9, 'Bernadatte', 'XRPL3', '202-555-0123', 'bernadette', 'bernadette', 3);

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(3) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `ringkasan` text NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `stok` int(3) NOT NULL,
  `id_kategori` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penerbit`, `pengarang`, `ringkasan`, `cover`, `stok`, `id_kategori`) VALUES
(1, 'Harry Potter and the Sorcerer\'s Stone', 'GM', 'J.K. Rowling', 'Harry Potter dan Batu Bertuah atau Harry Potter and the Philosopher\'s Stone adalah sebuah film yang sangat sukses pada tahun 2001 yang diangkat dari novel fantasi J. K. Rowling dengan judul yang sama.', NULL, 2, 1),
(2, 'Harry Potter and the Chamber of Secrets', 'GM', 'J.K. Rowling', 'Harry Potter dan Kamar Rahasia adalah seri kedua dari tujuh seri yang direncanakan dari novel fantasi karya pengarang J.K. Rowling. Film ini dirilis pada tanggal 3 November 2002. Disutradarai oleh Chris Columbus dan dibuat di Studio Film Leavesden.', NULL, 5, 1),
(5, 'Bad Girl VS Ketua Osis', 'PT Bintang Media', 'intanzs', 'Anak baru yang mendapat julukan Bad Girl Si Tukang Cari Ribut di sekolah barunya sering mencari masalah dengan ketua osis yang sangat membenci keributan. ', NULL, 1, 1),
(6, 'Bliss Bakery', 'Mizan Fantasi', 'Kathryn Littlewood', 'Perjalanan seorang gadis kecil untuk menyelamatkan dunia dengan berbekal resep ajaib keluarganya. Dia bisa menciptakan berbagai makanan dengan efek ajaib namun tentu juga dengan bahan-bahan khusus. ', NULL, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(3) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(1, 'Fiksi'),
(2, 'Non fiksi');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id_level` int(3) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `level`) VALUES
(1, 'admin'),
(2, 'operator'),
(3, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int(3) NOT NULL,
  `id_anggota` int(3) NOT NULL,
  `id_buku` int(3) DEFAULT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `tgl_jatuh_tempo` date NOT NULL,
  `denda` int(10) NOT NULL DEFAULT 0,
  `status` enum('Dipinjam','Kembali') NOT NULL DEFAULT 'Dipinjam',
  `id_petugas` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `tgl_jatuh_tempo`, `denda`, `status`, `id_petugas`) VALUES
(2, 1, 1, '2019-04-26', '2019-09-19', '2019-05-03', 139000, 'Kembali', 2),
(7, 6, 1, '2019-04-23', '2019-04-24', '2019-04-30', 0, 'Kembali', 2),
(8, 3, 6, '2019-04-02', '2019-04-30', '0000-00-00', 18015917, 'Kembali', 2),
(9, 3, 1, '2020-03-18', NULL, '2020-03-25', 0, 'Dipinjam', 2),
(10, 1, 1, '2020-04-02', NULL, '2020-04-09', 0, 'Dipinjam', 2);

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(3) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `username` varchar(8) NOT NULL,
  `password` varchar(8) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `id_level` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp`, `id_level`) VALUES
(1, 'Jacob', 'admin01', 'admin01', '410-555-0192', 1),
(2, 'Victor', 'admin02', 'admin02', '410-555-0183', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id_level` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_pinjam` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON UPDATE CASCADE;

--
-- Constraints for table `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `petugas_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
