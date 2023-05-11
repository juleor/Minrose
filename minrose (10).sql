-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2022 at 01:18 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minrose`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `nama_bank` varchar(25) NOT NULL,
  `no_rekening` varchar(25) NOT NULL,
  `logo` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `nama_bank`, `no_rekening`, `logo`) VALUES
(1, 'Mandiri', '092 7840 1923 7422', 'bank-mandiri.svg'),
(2, 'BRI', '058 9092 8274 9125', 'bank-bri.svg'),
(3, 'BCA', '088 7182 4291 9123', 'bank-bca.svg'),
(4, 'BNI', '0982 2937 9823 2341', 'bank-bni.svg');

-- --------------------------------------------------------

--
-- Table structure for table `catatan`
--

CREATE TABLE `catatan` (
  `id` int(10) UNSIGNED NOT NULL,
  `catatan_pemesanan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catatan`
--

INSERT INTO `catatan` (`id`, `catatan_pemesanan`) VALUES
(1, 'sedang menunggu pertemuan COD'),
(2, '[belum ada bukti transfer] sedang menunggu pengiriman bukti transaksi'),
(3, 'transaksi berhasil'),
(4, 'bukti transfer disetujui, sedang menunggu pengiriman produk'),
(5, 'pemesanan dibatalkan langsung oleh user'),
(6, 'bukti transfer berhasil dikirim, sedang menunggu persetujuan dari admin');

-- --------------------------------------------------------

--
-- Table structure for table `metode`
--

CREATE TABLE `metode` (
  `id` int(11) NOT NULL,
  `metode_pembayaran` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `metode`
--

INSERT INTO `metode` (`id`, `metode_pembayaran`) VALUES
(1, 'Transfer Bank'),
(2, 'COD');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `alamat` varchar(256) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `id_metode` int(11) NOT NULL,
  `id_bank` int(11) DEFAULT NULL,
  `id_catatan` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `data_dibuat` int(11) NOT NULL,
  `data_diubah` int(11) NOT NULL,
  `is_done` int(11) NOT NULL,
  `alasan_penolakan` varchar(256) DEFAULT NULL,
  `kuponUsed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id`, `id_produk`, `id_user`, `jumlah_produk`, `alamat`, `total_harga`, `id_metode`, `id_bank`, `id_catatan`, `id_status`, `bukti_transfer`, `data_dibuat`, `data_diubah`, `is_done`, `alasan_penolakan`, `kuponUsed`) VALUES
(24, 1, 8, 10, 'alamatbaru', 40000, 2, NULL, 1, 3, NULL, 1652849980, 1652849980, 0, 'gatau pengen nolak aja', NULL),
(25, 1, 9, 23, 'jawa timur, indonesia', 79000, 2, NULL, 1, 3, NULL, 1653010749, 1653010749, 0, 'gajadi ws ehe', NULL),
(32, 1, 9, 10, 'jawa timur, indonesia', 40000, 2, NULL, 3, 4, NULL, 1653209491, 1653209491, 1, NULL, NULL),
(33, 2, 9, 8, 'jawa timur, indonesia', 74000, 1, 1, 3, 4, 'cat4.png', 1653209545, 1653209545, 1, NULL, NULL),
(34, 3, 4, 5, 'inialamatku', 135000, 1, 1, 3, 4, 'cat.png', 1653209577, 1653209577, 1, NULL, NULL),
(35, 1, 4, 12, 'inialamatku aja ws', 46000, 1, 1, 5, 5, 'default.png', 1653209585, 1653230869, 0, NULL, NULL),
(36, 3, 9, 15, 'jawa timur, indonesia', 385000, 2, NULL, 3, 4, NULL, 1653209771, 1653209771, 1, NULL, NULL),
(37, 3, 9, 6, 'jawa timur, indonesia', 160000, 2, NULL, 3, 4, NULL, 1653209972, 1653209972, 1, NULL, NULL),
(38, 3, 4, 8, 'alamat baru ni bos', 210000, 2, NULL, 1, 3, NULL, 1653227997, 1653231915, 0, 'sdf', NULL),
(39, 2, 4, 10, 'inialamatku', 90000, 2, NULL, 5, 5, NULL, 1653231045, 1653231045, 0, NULL, NULL),
(40, 3, 4, 4, 'inialamatku bre', 110000, 1, 1, 3, 4, 'avatar2.jpg', 1653232001, 1653232527, 1, NULL, NULL),
(41, 1, 4, 1, 'inialamatku', 13000, 2, NULL, 5, 5, NULL, 1653273365, 1653273365, 0, NULL, NULL),
(42, 3, 4, 8, 'inialamatku', 210000, 2, NULL, 3, 4, NULL, 1653273484, 1653273484, 1, NULL, NULL),
(43, 1, 4, 8, 'alamat asli', 34000, 2, NULL, 3, 4, NULL, 1653372784, 1653372784, 1, NULL, NULL),
(44, 2, 4, 9, 'inialamatku', 82000, 2, NULL, 3, 4, NULL, 1653477204, 1654488774, 1, NULL, NULL),
(46, 1, 4, 10, 'inialamatku', 40000, 2, NULL, 3, 4, NULL, 1655036852, 1655040866, 1, NULL, NULL),
(47, 2, 4, 12, 'inialamatku', 106000, 2, NULL, 3, 4, NULL, 1655040971, 1655041151, 1, NULL, NULL),
(48, 3, 4, 2, 'inialamatku', 60000, 2, NULL, 3, 4, NULL, 1655041207, 1655041242, 1, NULL, NULL),
(49, 3, 4, 7, 'inialamatku', 185000, 2, NULL, 3, 4, NULL, 1655042194, 1655042233, 1, NULL, NULL),
(50, 3, 8, 12, 'Jln. Kerang No. 45', 310000, 2, NULL, 3, 4, NULL, 1655087877, 1655551402, 1, NULL, NULL),
(51, 1, 8, 14, 'Jln. Kerang', 80000, 2, NULL, 3, 4, NULL, 1657087897, 1655088887, 1, NULL, NULL),
(53, 1, 4, 3, 'inialamatku edited', 25000, 1, 1, 5, 5, 'default.png', 1655096699, 1655572514, 0, NULL, NULL),
(54, 1, 4, 5, 'inialamatku ya bang', 35000, 1, 1, 3, 2, 'default.png', 1655096749, 1655703693, 0, NULL, NULL),
(59, 3, 8, 1, 'alamatbaru', 35000, 2, NULL, 3, 4, NULL, 1655314262, 1655553662, 1, NULL, NULL),
(62, 3, 8, 3, 'alamatbaru', 35000, 1, 1, 2, 2, 'default.png', 1655342210, 1655342210, 0, NULL, 2),
(63, 2, 8, 3, 'alamatbaru', 34000, 1, 1, 2, 2, 'default.png', 1655343278, 1655343278, 0, NULL, NULL),
(64, 3, 9, 3, 'jawa timur, indonesia', 35000, 1, 1, 5, 5, 'default.png', 1655372022, 1655372022, 0, NULL, 2),
(67, 2, 9, 3, 'jawa timur, indonesia', 18000, 1, 1, 2, 3, 'default.png', 1655373460, 1655373460, 0, 'ya', 2),
(68, 2, 9, 3, 'jawa timur, indonesia', 18000, 1, 1, 2, 3, 'default.png', 1655373933, 1655373933, 0, 'asdf', 2),
(69, 1, 9, 4, 'jawa timur, indonesia', 10000, 1, 1, 5, 5, 'default.png', 1655376594, 1655376594, 0, NULL, 4),
(70, 1, 9, 4, 'jawa timur, indonesia', 10000, 2, NULL, 3, 4, NULL, 1655376691, 1655552240, 1, NULL, 4),
(71, 3, 4, 3, 'inialamatku', 85000, 2, NULL, 3, 4, NULL, 1655451316, 1655551586, 1, NULL, NULL),
(72, 2, 4, 9, 'inialamatku', 82000, 2, NULL, 3, 4, NULL, 1655551673, 1655551746, 1, NULL, NULL),
(73, 2, 4, 8, 'inialamatku', 74000, 2, NULL, 3, 4, NULL, 1655551974, 1655554101, 1, NULL, NULL),
(74, 2, 4, 9, 'inialamatku', 82000, 2, NULL, 3, 4, NULL, 1655554152, 1655554223, 1, NULL, NULL),
(75, 1, 4, 4, 'inialamatku', 30000, 2, NULL, 3, 4, NULL, 1655554171, 1655554209, 1, NULL, NULL),
(76, 3, 13, 20, 'alamat baru bukan dari profil', 510000, 1, 1, 3, 4, 'cat5.png', 1655558258, 1655559103, 1, NULL, NULL),
(77, 2, 13, 16, 'inialamatku', 138000, 2, NULL, 3, 4, NULL, 1655558714, 1655558771, 1, NULL, NULL),
(78, 1, 13, 7, 'inialamatku', 45000, 2, NULL, 1, 3, NULL, 1655558805, 1655558805, 0, 'bukti transfer tidak valid', NULL),
(79, 3, 13, 1, 'inialamatku', 10000, 2, NULL, 3, 4, NULL, 1655559375, 1655703531, 1, NULL, 1),
(80, 44, 13, 4, 'inialamatku', 90000, 1, 1, 6, 2, 'cat6.png', 1655561014, 1655561035, 0, NULL, NULL),
(81, 3, 4, 11, 'inialamatku', 285000, 1, 1, 3, 4, 'cat1.png', 1655602505, 1655602580, 1, NULL, NULL),
(82, 1, 4, 3, 'inialamatku', 71000, 2, NULL, 1, 2, NULL, 1655710064, 1655710064, 0, NULL, NULL),
(83, 3, 4, 7, 'Jalan Kerang No. 45 Banyuwangi', 280000, 2, NULL, 1, 2, NULL, 1655718232, 1655718232, 0, NULL, NULL),
(84, 3, 4, 2, 'inialamatku', 55000, 2, NULL, 1, 2, NULL, 1655720337, 1655720337, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `diskon` decimal(6,2) NOT NULL,
  `image` varchar(128) NOT NULL,
  `orientasi` text NOT NULL,
  `data_dibuat` int(11) NOT NULL,
  `data_diedit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama`, `deskripsi`, `harga`, `stok`, `diskon`, `image`, `orientasi`, `data_dibuat`, `data_diedit`) VALUES
(1, 'Minrose Cup', 'Minuman cup Bunga Rosella ini terbuat dari bahan alami pilihan yaitu bunga Rosella terbaik. Pengolahan Teh Rosela sebagai minuman kesehatan herbal ini sudah menggunakan standar CPOTB, SNI dan ISO. Sehingga dapat memberikan jaminan mutu dan rasa aman bagi konsumen.', 5000, 100, '0.00', 'minrose-cup.jpeg', 'Satu minrose cup yang kami jual tidak pernah gagal untuk menghilangkan rasa haus saat dahaga', 1650206453, 1655558388),
(2, 'Minrose Botol', 'Berbagai penelitian menunjukkan bahwa ekstrak tanaman rosella mampu menurunkan tekanan darah pada penderita sindrom metabolik. Penyakit ini ditandai dengan peningkatan tekanan darah, gula darah, kolesterol, serta berat badan. Tak hanya itu, teh rosella botol ini juga diketahui dapat menurunkan tekanan darah dan mencegah hipertensi atau tekanan darah tinggi. Namun, penggunaan teh rosella botol sebagai obat untuk mengatasi hipertensi tentunya harus dikonsultasikan lebih dulu dengan dokter.', 8000, 0, '0.00', 'minrose-botol.jpg', 'Kami juga menyediakan produk jenis botol agar mudah anda bawa beraktivitas ke mana saja', 1650206453, 1651625611),
(3, 'Minrose Dus', 'Minuman Rosela dibuat dari seduhan Bunga Rosela (Hibiscus Sabdariffa) dan 100% gula asli. Bunga rosella merupakan spesies bunga asal Afrika. Minuman tersebut diyakini bisa meningkatkan imunitas tubuh dan membantu menurunkan tekanan darah tinggi. Kandungan dalam 57 gram bunga rosella di antaranya terdapat 0,84 mg zat besi, 6,8 mg vitamin C, 123 mg kalsium, vitamin A dan 0,016 mg vitamin B2.', 25000, 67, '0.00', 'minrose-dus.jpg', 'Penuhi stok minuman di rumah anda dengan membeli 1 atau beberapa dus berisi penuh minrose', 1650206453, 1655042156),
(22, 'ini produk baru', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda, fugit dolore ipsum recusandae nostrum a temporibus eaque possimus ab necessitatibus perferendis, iusto libero blanditiis, eveniet quod atque neque suscipit id ipsa. Doloremque quibusdam repudiandae soluta aspernatur commodi quasi unde ad dolores distinctio expedita velit, porro at fugit. Ad, necessitatibus nam.', 35000, 113, '0.20', 'cat.PNG', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non suscipit ullam deleniti quod ea!aaa', 1651135243, 1651622633);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status_pemesanan` varchar(25) NOT NULL,
  `style` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status_pemesanan`, `style`) VALUES
(1, 'disetujui', 'success'),
(2, 'pending', 'warning'),
(3, 'ditolak', 'danger'),
(4, 'selesai', 'info'),
(5, 'dibatalkan', 'secondary');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `kategori` varchar(64) NOT NULL,
  `keterangan` varchar(256) NOT NULL,
  `pemasukan` int(11) DEFAULT NULL,
  `pengeluaran` int(11) DEFAULT NULL,
  `data_dibuat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `kategori`, `keterangan`, `pemasukan`, `pengeluaran`, `data_dibuat`) VALUES
(2, 'Produksi mingguan', 'Stok rosela 10kg dari produsen Rp. 50000, 5 dus Cup Rp. 30000', NULL, 80000, 1653210004),
(14, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Dus sebanyak 6 unit', 160000, NULL, 1653210004),
(15, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Cup sebanyak 10 unit', 40000, NULL, 1653210110),
(16, 'ini kategori pengeluaran', 'ini keterangan pengeluaran edited', NULL, 50000, 1653276648),
(20, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Dus sebanyak 4 unit', 110000, NULL, 1653272652),
(21, 'kategori baru', 'keterangan kategori baru nih', NULL, 40000, 1653276873),
(22, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Cup sebanyak 8 unit', 34000, NULL, 1653372812),
(23, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Botol sebanyak 9 unit', 82000, NULL, 1653477234),
(24, 'Penjualan produk', 'Hasil dari penjualan produk ini produk baru sebanyak 10 unit', 360000, NULL, 1653892923),
(25, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Dus sebanyak 8 unit', 210000, NULL, 1653898110),
(26, 'ini kategori baru banget edited', 'ini isinya banyak sekali keterangan', NULL, 100000, 1653898349),
(27, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Botol sebanyak 8 unit', 74000, NULL, 1654488279),
(28, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Botol sebanyak 9 unit', 82000, NULL, 1654488644),
(29, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Botol sebanyak 9 unit', 82000, NULL, 1654488720),
(30, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Botol sebanyak 9 unit', 82000, NULL, 1654488774),
(31, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Dus sebanyak 7 unit', 185000, NULL, 1655042233),
(32, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Cup sebanyak 14 unit', 80000, NULL, 1655088887),
(33, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Botol sebanyak 4 unit', 42000, NULL, 1655309162),
(34, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Dus sebanyak 12 unit', 310000, NULL, 1655551402),
(35, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Dus sebanyak 3 unit', 85000, NULL, 1655551586),
(36, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Botol sebanyak 9 unit', 82000, NULL, 1655551746),
(37, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Cup sebanyak 4 unit', 10000, NULL, 1655552240),
(38, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Dus sebanyak 1 unit', 35000, NULL, 1655553662),
(39, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Botol sebanyak 8 unit', 74000, NULL, 1655554101),
(40, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Cup sebanyak 4 unit', 30000, NULL, 1655554209),
(41, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Botol sebanyak 9 unit', 82000, NULL, 1655554223),
(42, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Botol sebanyak 16 unit', 138000, NULL, 1655558771),
(43, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Dus sebanyak 20 unit', 510000, NULL, 1655559103),
(44, 'pembelian bahan pokok minguan editd', 'ini keterangan lah ya', NULL, 50000, 1655559306),
(45, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Dus sebanyak 11 unit', 285000, NULL, 1655602580),
(49, 'Penjualan produk', 'Hasil dari penjualan produk Minrose Dus sebanyak 1 unit', 10000, NULL, 1655703531);

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `ulasan` text NOT NULL,
  `data_dibuat` int(11) NOT NULL,
  `data_diubah` int(11) NOT NULL,
  `isEdited` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ulasan`
--

INSERT INTO `ulasan` (`id`, `id_user`, `id_produk`, `rating`, `ulasan`, `data_dibuat`, `data_diubah`, `isEdited`) VALUES
(1, 4, 1, 5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur dolor corrupti sed, eos consequuntur eaque repellendus fuga laborum velit est numquam culpa? Voluptas officiis sint eius eos nisi, deserunt saepe magni maxime natus distinctio officia assumenda odio ducimus porro maiores, at necessitatibus cum et rerum voluptatum esse quis repellendus? Assumenda?', 1653142579, 1653142579, 0),
(10, 4, 3, 5, 'ulasan pertama bismillah', 1653216707, 1653216707, 0),
(13, 9, 1, 4, 'mantab bat dah', 1653371015, 1653371015, 0),
(24, 4, 2, 4, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Laborum nihil dolorum eaque! Sapiente error cupiditate suscipit ab, aliquid facilis. Necessitatibus consequuntur obcaecati laudantium maiores alias voluptate. Aut aliquam blanditiis, reiciendis sunt quisquam, consequuntur iste eum sed quibusdam inventore ipsam dolorum, laborum ab hic ullam. Minus asperiores doloremque repellendus facere commodi edited', 1653753599, 1653753611, 1),
(28, 8, 1, 5, 'puas dengan kualitas produk dan layanan', 1655089896, 1655089896, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `role_id` int(11) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `image` varchar(128) NOT NULL,
  `data_dibuat` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  `kupon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `username`, `email`, `password`, `jenis_kelamin`, `no_hp`, `role_id`, `alamat`, `image`, `data_dibuat`, `point`, `kupon`) VALUES
(3, 'Moh. Najib Fikri', 'pStar7', 'najibfikri13@gmail.com', '$2y$10$4Prh5XY25sgT43oSjkiteu2yMNjtclp41RjwclQdPTZEFcw6M3M6e', 'L', '089283912345', 1, 'Jln. Pattimura no 65, Banyuwangi, Jawa Timur', 'default.jpg', 1650206453, 0, 0),
(4, 'Patrick Star 7', 'Itsme patrick', 'member@gmail.com', '$2y$10$m8e4IDvFx63hhUF5cg4JNOcbOOIwibPNbx/U5Oz7SLQCCJrSj7dOa', 'L', '08123112312', 2, 'inialamatku', 'person1.jpg', 1650207116, 200, 0),
(6, 'Larry is real', 'just larry', 'gatau@gmail.com', '$2y$10$Uekb57i2C9kwI/YOuR3Sjuzzf4iyDJEV9Q9g3hIAZHVSSmV3aZ0jC', 'L', '081982936413', 2, 'inialamatsaya', 'person3.jpg', 1650622148, 0, 0),
(8, 'someone who is talented', 'squidy', 'emailbaru@gmail.com', '$2y$10$01i1hWk4oj/sBEzl74NWd.pPbfc50wxv9mbjoUwzfU/9./5Yoi/6a', 'L', '081982789231', 2, 'alamatbaru', 'person4.jpg', 1651900508, 185, 0),
(9, 'jane doe', 'halo im jane', 'janedoe@gmail.com', '$2y$10$KYTiNuar5Zo1xry2m4YdEeNR5POvuf3ohYzHbv4Ti8nSnouhJ3TSy', 'L', '0812341231127', 2, 'jawa timur, indonesia', 'person2.jpg', 1652276424, 8, 4),
(10, 'namalengkap', 'username', 'address@gmail.com', '$2y$10$vehEaAIlSdL5Xa98HbfNYeOAja82BzqVLtozQ0KUdTyWn3NA4cUAS', 'L', '0989821923', 2, 'alamataja', 'default.jpg', 1653222193, 0, 0),
(11, 'just a man', 'goodman', 'goodman@gmail.com', '$2y$10$AeJ3ukkStnx//2OWmD9UHO7aR8sdAT2ap7TkFWiAbh2BGNvsrkb7C', 'L', '08198293812', 2, 'place of peace lmao', 'default.jpg', 1653376561, 0, 0),
(12, 'ininamalengkap', 'iniusername', 'iniemail@gmail.com', '$2y$10$0hcBbH4dIS4pezwEl0fNjOI3sbHCY9n3WFtoluO1o4F1VM.DcO4du', 'L', '08198291923', 2, 'inialamat', 'default.jpg', 1653441668, 0, 0),
(13, 'ininamalengkap', 'person', 'emailbarubanget@gmail.com', '$2y$10$wVFeQuF.CgltXKyHUhQiK.o8Kg01oMDTrqICLwmX/7oiP.L5zPo26', 'L', '0812312323412', 2, 'inialamatku', 'avatar.jpg', 1655557783, 150, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metode`
--
ALTER TABLE `metode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `catatan`
--
ALTER TABLE `catatan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `metode`
--
ALTER TABLE `metode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
