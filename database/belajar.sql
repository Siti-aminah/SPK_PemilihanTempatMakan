-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jun 2022 pada 02.11
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nm_lengkap` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nm_lengkap`, `username`, `password`) VALUES
(1, 'Admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `alternatif`
--

CREATE TABLE `alternatif` (
  `id_les` int(11) NOT NULL,
  `kode_alternatif` varchar(250) NOT NULL,
  `nm_les` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `alternatif`
--

INSERT INTO `alternatif` (`id_les`, `kode_alternatif`, `nm_les`) VALUES
(1, 'A1', 'Rumah Makan D’Pawon'),
(2, 'A2', 'Warma Pi’an'),
(3, 'A3', 'Dapoer Tempo Doeloe'),
(6, 'A4', 'Lombok Idjo Tegal'),
(7, 'A5', 'Rumah Makan Sari Sedap');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `kode_kriteria` varchar(250) NOT NULL,
  `nm_kriteria` varchar(250) NOT NULL,
  `bobot` int(11) NOT NULL,
  `status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `kode_kriteria`, `nm_kriteria`, `bobot`, `status`) VALUES
(1, 'C1', 'Harga Makanan', 4, 'COST'),
(2, 'C2', 'Menu', 5, 'BENEFIT'),
(3, 'C3', 'Jarak', 2, 'COST'),
(4, 'C4', 'Fasilitas', 3, 'BENEFIT'),
(5, 'C5', 'Pelayanan', 4, 'BENEFIT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembobotan`
--

CREATE TABLE `pembobotan` (
  `id_nilai` int(11) NOT NULL,
  `id_les` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembobotan`
--

INSERT INTO `pembobotan` (`id_nilai`, `id_les`, `id_kriteria`, `nilai`) VALUES
(1, 1, 1, '16'),
(2, 1, 2, '22'),
(3, 1, 3, '120'),
(4, 1, 4, '62'),
(5, 1, 5, '71'),
(6, 2, 1, '25'),
(7, 2, 2, '6'),
(8, 2, 3, '170'),
(9, 2, 4, '68'),
(10, 2, 5, '62'),
(11, 3, 1, '13'),
(12, 3, 2, '18'),
(13, 3, 3, '110'),
(14, 3, 4, '60'),
(15, 3, 5, '78'),
(16, 6, 1, '20'),
(17, 6, 2, '21'),
(18, 6, 3, '600'),
(19, 6, 4, '87'),
(20, 6, 5, '73'),
(21, 7, 1, '10'),
(22, 7, 2, '10'),
(23, 7, 3, '750'),
(24, 7, 4, '72'),
(25, 7, 5, '82');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_les`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `pembobotan`
--
ALTER TABLE `pembobotan`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `LES` (`id_les`),
  ADD KEY `KRITERIA` (`id_kriteria`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_les` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pembobotan`
--
ALTER TABLE `pembobotan`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembobotan`
--
ALTER TABLE `pembobotan`
  ADD CONSTRAINT `KRITERIA` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`),
  ADD CONSTRAINT `LES` FOREIGN KEY (`id_les`) REFERENCES `alternatif` (`id_les`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
