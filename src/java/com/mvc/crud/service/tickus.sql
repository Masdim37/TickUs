-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jun 2025 pada 00.30
-- Versi server: 8.0.41
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tickus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bioskop`
--

CREATE TABLE `bioskop` (
  `bioskopID` varchar(7) NOT NULL,
  `namaBioskop` varchar(100) NOT NULL,
  `lokasiBioskop` varchar(255) NOT NULL,
  `brandBioskop` varchar(20) NOT NULL,
  `jumlahRuangan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `bioskop`
--

INSERT INTO `bioskop` (`bioskopID`, `namaBioskop`, `lokasiBioskop`, `brandBioskop`, `jumlahRuangan`) VALUES
('bskp001', 'Rita Supermall CGV', 'RITA SuperMall Purwokerto, Jl. Jend. Soedirman No.296, Pereng, Sokanegara, Kec. Purwokerto Tim., Kabupaten Banyumas, Jawa Tengah 53116', 'CGV', 4),
('bskp002', 'Rajawali Cinema', 'Jl. S. Parman No.69, Karangbawang, Purwokerto Kulon, Kec. Purwokerto Sel., Kabupaten Banyumas, Jawa Tengah 53141', 'Rajawali', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `film`
--

CREATE TABLE `film` (
  `filmID` varchar(7) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `durasi` int NOT NULL,
  `ratingUsia` varchar(10) NOT NULL,
  `sutradara` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `film`
--

INSERT INTO `film` (`filmID`, `judul`, `durasi`, `ratingUsia`, `sutradara`) VALUES
('flm0001', 'JUMBO', 102, 'SU', 'Ryan Adriandhy'),
('flm0002', 'LILO & STITCH', 108, 'PG', 'Dean Fleischer Camp');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_tayang`
--

CREATE TABLE `jadwal_tayang` (
  `jadwalTayangID` varchar(7) NOT NULL,
  `tanggalTayang` date NOT NULL,
  `jamTayang` time NOT NULL,
  `filmID` varchar(7) DEFAULT NULL,
  `ruangID` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `jadwal_tayang`
--

INSERT INTO `jadwal_tayang` (`jadwalTayangID`, `tanggalTayang`, `jamTayang`, `filmID`, `ruangID`) VALUES
('jt00001', '2025-06-11', '16:25:00', 'flm0001', 'rng0001'),
('jt00002', '2025-06-11', '18:40:00', 'flm0002', 'rng0001'),
('jt00003', '2025-06-11', '20:55:00', 'flm0001', 'rng0001'),
('jt00004', '2025-06-11', '16:30:00', 'flm0001', 'rng0003'),
('jt00005', '2025-06-11', '18:45:00', 'flm0001', 'rng0003'),
('jt00006', '2025-06-11', '21:00:00', 'flm0001', 'rng0101'),
('jt00007', '2025-06-11', '10:00:00', 'flm0002', 'rng0102'),
('jt00008', '2025-06-12', '16:25:00', 'flm0001', 'rng0001'),
('jt00009', '2025-06-12', '18:40:00', 'flm0002', 'rng0001'),
('jt00010', '2025-06-12', '20:55:00', 'flm0001', 'rng0001'),
('jt00011', '2025-06-12', '16:30:00', 'flm0001', 'rng0003'),
('jt00012', '2025-06-12', '18:45:00', 'flm0001', 'rng0003'),
('jt00013', '2025-06-12', '21:00:00', 'flm0001', 'rng0101'),
('jt00014', '2025-06-12', '10:00:00', 'flm0002', 'rng0102'),
('jt00015', '2025-06-13', '16:25:00', 'flm0001', 'rng0001'),
('jt00016', '2025-06-13', '18:40:00', 'flm0002', 'rng0001'),
('jt00017', '2025-06-13', '20:55:00', 'flm0001', 'rng0001'),
('jt00018', '2025-06-13', '16:30:00', 'flm0001', 'rng0003'),
('jt00019', '2025-06-13', '18:45:00', 'flm0001', 'rng0003'),
('jt00020', '2025-06-13', '21:00:00', 'flm0001', 'rng0101'),
('jt00021', '2025-06-13', '10:00:00', 'flm0002', 'rng0102'),
('jt00022', '2025-06-14', '16:25:00', 'flm0001', 'rng0001'),
('jt00023', '2025-06-14', '18:40:00', 'flm0002', 'rng0001'),
('jt00024', '2025-06-14', '20:55:00', 'flm0001', 'rng0001'),
('jt00025', '2025-06-14', '16:30:00', 'flm0001', 'rng0003'),
('jt00026', '2025-06-14', '18:45:00', 'flm0001', 'rng0003'),
('jt00027', '2025-06-14', '21:00:00', 'flm0001', 'rng0101'),
('jt00028', '2025-06-14', '10:00:00', 'flm0002', 'rng0102'),
('jt00029', '2025-06-15', '16:25:00', 'flm0001', 'rng0001'),
('jt00030', '2025-06-15', '18:40:00', 'flm0002', 'rng0001'),
('jt00031', '2025-06-15', '20:55:00', 'flm0001', 'rng0001'),
('jt00032', '2025-06-15', '16:30:00', 'flm0001', 'rng0003'),
('jt00033', '2025-06-15', '18:45:00', 'flm0001', 'rng0003'),
('jt00034', '2025-06-15', '21:00:00', 'flm0001', 'rng0101'),
('jt00035', '2025-06-15', '10:00:00', 'flm0002', 'rng0102'),
('jt00036', '2025-06-16', '16:25:00', 'flm0001', 'rng0001'),
('jt00037', '2025-06-16', '18:40:00', 'flm0002', 'rng0001'),
('jt00038', '2025-06-16', '20:55:00', 'flm0001', 'rng0001'),
('jt00039', '2025-06-16', '16:30:00', 'flm0001', 'rng0003'),
('jt00040', '2025-06-16', '18:45:00', 'flm0001', 'rng0003'),
('jt00041', '2025-06-16', '21:00:00', 'flm0001', 'rng0101'),
('jt00042', '2025-06-16', '10:00:00', 'flm0002', 'rng0102'),
('jt00043', '2025-06-17', '16:25:00', 'flm0001', 'rng0001'),
('jt00044', '2025-06-17', '18:40:00', 'flm0002', 'rng0001'),
('jt00045', '2025-06-17', '20:55:00', 'flm0001', 'rng0001'),
('jt00046', '2025-06-17', '16:30:00', 'flm0001', 'rng0003'),
('jt00047', '2025-06-17', '18:45:00', 'flm0001', 'rng0003'),
('jt00048', '2025-06-17', '21:00:00', 'flm0001', 'rng0101'),
('jt00049', '2025-06-17', '10:00:00', 'flm0002', 'rng0102'),
('jt00050', '2025-06-18', '16:25:00', 'flm0001', 'rng0001'),
('jt00051', '2025-06-18', '18:40:00', 'flm0002', 'rng0001'),
('jt00052', '2025-06-18', '20:55:00', 'flm0001', 'rng0001'),
('jt00053', '2025-06-18', '16:30:00', 'flm0001', 'rng0003'),
('jt00054', '2025-06-18', '18:45:00', 'flm0001', 'rng0003'),
('jt00055', '2025-06-18', '21:00:00', 'flm0001', 'rng0101'),
('jt00056', '2025-06-18', '10:00:00', 'flm0002', 'rng0102');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kursi`
--

CREATE TABLE `kursi` (
  `kursiID` varchar(7) NOT NULL,
  `nomorKursi` varchar(10) NOT NULL,
  `ruangID` varchar(7) DEFAULT NULL,
  `statusIsi` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `kursi`
--

INSERT INTO `kursi` (`kursiID`, `nomorKursi`, `ruangID`, `statusIsi`) VALUES
('krs0201', 'A1', 'rng0001', 0),
('krs0202', 'A2', 'rng0001', 0),
('krs0203', 'A3', 'rng0001', 0),
('krs0204', 'A4', 'rng0001', 0),
('krs0205', 'A5', 'rng0001', 0),
('krs0206', 'A6', 'rng0001', 0),
('krs0207', 'A7', 'rng0001', 0),
('krs0208', 'A8', 'rng0001', 0),
('krs0209', 'B1', 'rng0001', 0),
('krs0210', 'B2', 'rng0001', 0),
('krs0211', 'B3', 'rng0001', 0),
('krs0212', 'B4', 'rng0001', 0),
('krs0213', 'B5', 'rng0001', 0),
('krs0214', 'B6', 'rng0001', 0),
('krs0215', 'B7', 'rng0001', 0),
('krs0216', 'B8', 'rng0001', 0),
('krs0217', 'C1', 'rng0001', 0),
('krs0218', 'C2', 'rng0001', 0),
('krs0219', 'C3', 'rng0001', 0),
('krs0220', 'C4', 'rng0001', 0),
('krs0221', 'C5', 'rng0001', 0),
('krs0222', 'C6', 'rng0001', 0),
('krs0223', 'C7', 'rng0001', 0),
('krs0224', 'C8', 'rng0001', 0),
('krs0225', 'D1', 'rng0001', 0),
('krs0226', 'D2', 'rng0001', 0),
('krs0227', 'D3', 'rng0001', 0),
('krs0228', 'D4', 'rng0001', 0),
('krs0229', 'D5', 'rng0001', 0),
('krs0230', 'D6', 'rng0001', 0),
('krs0231', 'D7', 'rng0001', 0),
('krs0232', 'D8', 'rng0001', 0),
('krs0233', 'E1', 'rng0001', 0),
('krs0234', 'E2', 'rng0001', 0),
('krs0235', 'E3', 'rng0001', 0),
('krs0236', 'E4', 'rng0001', 0),
('krs0237', 'E5', 'rng0001', 0),
('krs0238', 'E6', 'rng0001', 0),
('krs0239', 'E7', 'rng0001', 0),
('krs0240', 'E8', 'rng0001', 0),
('krs0241', 'F1', 'rng0001', 0),
('krs0242', 'F2', 'rng0001', 0),
('krs0243', 'F3', 'rng0001', 0),
('krs0244', 'F4', 'rng0001', 0),
('krs0245', 'F5', 'rng0001', 0),
('krs0246', 'F6', 'rng0001', 0),
('krs0247', 'F7', 'rng0001', 0),
('krs0248', 'F8', 'rng0001', 0),
('krs0249', 'G1', 'rng0001', 0),
('krs0250', 'G2', 'rng0001', 0),
('krs0251', 'G3', 'rng0001', 0),
('krs0252', 'G4', 'rng0001', 0),
('krs0253', 'G5', 'rng0001', 0),
('krs0254', 'G6', 'rng0001', 0),
('krs0255', 'G7', 'rng0001', 0),
('krs0256', 'G8', 'rng0001', 0),
('krs0257', 'H1', 'rng0001', 0),
('krs0258', 'H2', 'rng0001', 0),
('krs0259', 'H3', 'rng0001', 0),
('krs0260', 'H4', 'rng0001', 0),
('krs0261', 'H5', 'rng0001', 0),
('krs0262', 'H6', 'rng0001', 0),
('krs0263', 'H7', 'rng0001', 0),
('krs0264', 'H8', 'rng0001', 0),
('krs0265', 'A1', 'rng0002', 0),
('krs0266', 'A2', 'rng0002', 0),
('krs0267', 'A3', 'rng0002', 0),
('krs0268', 'A4', 'rng0002', 0),
('krs0269', 'A5', 'rng0002', 0),
('krs0270', 'A6', 'rng0002', 0),
('krs0271', 'A7', 'rng0002', 0),
('krs0272', 'A8', 'rng0002', 0),
('krs0273', 'B1', 'rng0002', 0),
('krs0274', 'B2', 'rng0002', 0),
('krs0275', 'B3', 'rng0002', 0),
('krs0276', 'B4', 'rng0002', 0),
('krs0277', 'B5', 'rng0002', 0),
('krs0278', 'B6', 'rng0002', 0),
('krs0279', 'B7', 'rng0002', 0),
('krs0280', 'B8', 'rng0002', 0),
('krs0281', 'C1', 'rng0002', 0),
('krs0282', 'C2', 'rng0002', 0),
('krs0283', 'C3', 'rng0002', 0),
('krs0284', 'C4', 'rng0002', 0),
('krs0285', 'C5', 'rng0002', 0),
('krs0286', 'C6', 'rng0002', 0),
('krs0287', 'C7', 'rng0002', 0),
('krs0288', 'C8', 'rng0002', 0),
('krs0289', 'D1', 'rng0002', 0),
('krs0290', 'D2', 'rng0002', 0),
('krs0291', 'D3', 'rng0002', 0),
('krs0292', 'D4', 'rng0002', 0),
('krs0293', 'D5', 'rng0002', 0),
('krs0294', 'D6', 'rng0002', 0),
('krs0295', 'D7', 'rng0002', 0),
('krs0296', 'D8', 'rng0002', 0),
('krs0297', 'E1', 'rng0002', 0),
('krs0298', 'E2', 'rng0002', 0),
('krs0299', 'E3', 'rng0002', 0),
('krs0300', 'E4', 'rng0002', 0),
('krs0301', 'E5', 'rng0002', 0),
('krs0302', 'E6', 'rng0002', 0),
('krs0303', 'E7', 'rng0002', 0),
('krs0304', 'E8', 'rng0002', 0),
('krs0305', 'F1', 'rng0002', 0),
('krs0306', 'F2', 'rng0002', 0),
('krs0307', 'F3', 'rng0002', 0),
('krs0308', 'F4', 'rng0002', 0),
('krs0309', 'F5', 'rng0002', 0),
('krs0310', 'F6', 'rng0002', 0),
('krs0311', 'F7', 'rng0002', 0),
('krs0312', 'F8', 'rng0002', 0),
('krs0313', 'G1', 'rng0002', 0),
('krs0314', 'G2', 'rng0002', 0),
('krs0315', 'G3', 'rng0002', 0),
('krs0316', 'G4', 'rng0002', 0),
('krs0317', 'G5', 'rng0002', 0),
('krs0318', 'G6', 'rng0002', 0),
('krs0319', 'G7', 'rng0002', 0),
('krs0320', 'G8', 'rng0002', 0),
('krs0321', 'H1', 'rng0002', 0),
('krs0322', 'H2', 'rng0002', 0),
('krs0323', 'H3', 'rng0002', 0),
('krs0324', 'H4', 'rng0002', 0),
('krs0325', 'H5', 'rng0002', 0),
('krs0326', 'H6', 'rng0002', 0),
('krs0327', 'H7', 'rng0002', 0),
('krs0328', 'H8', 'rng0002', 0),
('krs0329', 'A1', 'rng0003', 0),
('krs0330', 'A2', 'rng0003', 0),
('krs0331', 'A3', 'rng0003', 0),
('krs0332', 'A4', 'rng0003', 0),
('krs0333', 'A5', 'rng0003', 0),
('krs0334', 'A6', 'rng0003', 0),
('krs0335', 'A7', 'rng0003', 0),
('krs0336', 'A8', 'rng0003', 0),
('krs0337', 'B1', 'rng0003', 0),
('krs0338', 'B2', 'rng0003', 0),
('krs0339', 'B3', 'rng0003', 0),
('krs0340', 'B4', 'rng0003', 0),
('krs0341', 'B5', 'rng0003', 0),
('krs0342', 'B6', 'rng0003', 0),
('krs0343', 'B7', 'rng0003', 0),
('krs0344', 'B8', 'rng0003', 0),
('krs0345', 'C1', 'rng0003', 0),
('krs0346', 'C2', 'rng0003', 0),
('krs0347', 'C3', 'rng0003', 0),
('krs0348', 'C4', 'rng0003', 0),
('krs0349', 'C5', 'rng0003', 0),
('krs0350', 'C6', 'rng0003', 0),
('krs0351', 'C7', 'rng0003', 0),
('krs0352', 'C8', 'rng0003', 0),
('krs0353', 'D1', 'rng0003', 0),
('krs0354', 'D2', 'rng0003', 0),
('krs0355', 'D3', 'rng0003', 0),
('krs0356', 'D4', 'rng0003', 0),
('krs0357', 'D5', 'rng0003', 0),
('krs0358', 'D6', 'rng0003', 0),
('krs0359', 'D7', 'rng0003', 0),
('krs0360', 'D8', 'rng0003', 0),
('krs0361', 'A1', 'rng0004', 0),
('krs0362', 'A2', 'rng0004', 0),
('krs0363', 'A3', 'rng0004', 0),
('krs0364', 'A4', 'rng0004', 0),
('krs0365', 'A5', 'rng0004', 0),
('krs0366', 'A6', 'rng0004', 0),
('krs0367', 'A7', 'rng0004', 0),
('krs0368', 'A8', 'rng0004', 0),
('krs0369', 'B1', 'rng0004', 0),
('krs0370', 'B2', 'rng0004', 0),
('krs0371', 'B3', 'rng0004', 0),
('krs0372', 'B4', 'rng0004', 0),
('krs0373', 'B5', 'rng0004', 0),
('krs0374', 'B6', 'rng0004', 0),
('krs0375', 'B7', 'rng0004', 0),
('krs0376', 'B8', 'rng0004', 0),
('krs0377', 'C1', 'rng0004', 0),
('krs0378', 'C2', 'rng0004', 0),
('krs0379', 'C3', 'rng0004', 0),
('krs0380', 'C4', 'rng0004', 0),
('krs0381', 'C5', 'rng0004', 0),
('krs0382', 'C6', 'rng0004', 0),
('krs0383', 'C7', 'rng0004', 0),
('krs0384', 'C8', 'rng0004', 0),
('krs0385', 'D1', 'rng0004', 0),
('krs0386', 'D2', 'rng0004', 0),
('krs0387', 'D3', 'rng0004', 0),
('krs0388', 'D4', 'rng0004', 0),
('krs0389', 'D5', 'rng0004', 0),
('krs0390', 'D6', 'rng0004', 0),
('krs0391', 'D7', 'rng0004', 0),
('krs0392', 'D8', 'rng0004', 0),
('krs0393', 'A1', 'rng0101', 0),
('krs0394', 'A2', 'rng0101', 0),
('krs0395', 'A3', 'rng0101', 0),
('krs0396', 'A4', 'rng0101', 0),
('krs0397', 'A5', 'rng0101', 0),
('krs0398', 'A6', 'rng0101', 0),
('krs0399', 'A7', 'rng0101', 0),
('krs0400', 'A8', 'rng0101', 0),
('krs0401', 'B1', 'rng0101', 0),
('krs0402', 'B2', 'rng0101', 0),
('krs0403', 'B3', 'rng0101', 0),
('krs0404', 'B4', 'rng0101', 0),
('krs0405', 'B5', 'rng0101', 0),
('krs0406', 'B6', 'rng0101', 0),
('krs0407', 'B7', 'rng0101', 0),
('krs0408', 'B8', 'rng0101', 0),
('krs0409', 'C1', 'rng0101', 0),
('krs0410', 'C2', 'rng0101', 0),
('krs0411', 'C3', 'rng0101', 0),
('krs0412', 'C4', 'rng0101', 0),
('krs0413', 'C5', 'rng0101', 0),
('krs0414', 'C6', 'rng0101', 0),
('krs0415', 'C7', 'rng0101', 0),
('krs0416', 'C8', 'rng0101', 0),
('krs0417', 'D1', 'rng0101', 0),
('krs0418', 'D2', 'rng0101', 0),
('krs0419', 'D3', 'rng0101', 0),
('krs0420', 'D4', 'rng0101', 0),
('krs0421', 'D5', 'rng0101', 0),
('krs0422', 'D6', 'rng0101', 0),
('krs0423', 'D7', 'rng0101', 0),
('krs0424', 'D8', 'rng0101', 0),
('krs0425', 'E1', 'rng0101', 0),
('krs0426', 'E2', 'rng0101', 0),
('krs0427', 'E3', 'rng0101', 0),
('krs0428', 'E4', 'rng0101', 0),
('krs0429', 'E5', 'rng0101', 0),
('krs0430', 'E6', 'rng0101', 0),
('krs0431', 'E7', 'rng0101', 0),
('krs0432', 'E8', 'rng0101', 0),
('krs0433', 'F1', 'rng0101', 0),
('krs0434', 'F2', 'rng0101', 0),
('krs0435', 'F3', 'rng0101', 0),
('krs0436', 'F4', 'rng0101', 0),
('krs0437', 'F5', 'rng0101', 0),
('krs0438', 'F6', 'rng0101', 0),
('krs0439', 'F7', 'rng0101', 0),
('krs0440', 'F8', 'rng0101', 0),
('krs0441', 'G1', 'rng0101', 0),
('krs0442', 'G2', 'rng0101', 0),
('krs0443', 'G3', 'rng0101', 0),
('krs0444', 'G4', 'rng0101', 0),
('krs0445', 'G5', 'rng0101', 0),
('krs0446', 'G6', 'rng0101', 0),
('krs0447', 'G7', 'rng0101', 0),
('krs0448', 'G8', 'rng0101', 0),
('krs0449', 'H1', 'rng0101', 0),
('krs0450', 'H2', 'rng0101', 0),
('krs0451', 'H3', 'rng0101', 0),
('krs0452', 'H4', 'rng0101', 0),
('krs0453', 'H5', 'rng0101', 0),
('krs0454', 'H6', 'rng0101', 0),
('krs0455', 'H7', 'rng0101', 0),
('krs0456', 'H8', 'rng0101', 0),
('krs0457', 'A1', 'rng0102', 0),
('krs0458', 'A2', 'rng0102', 0),
('krs0459', 'A3', 'rng0102', 0),
('krs0460', 'A4', 'rng0102', 0),
('krs0461', 'A5', 'rng0102', 0),
('krs0462', 'A6', 'rng0102', 0),
('krs0463', 'A7', 'rng0102', 0),
('krs0464', 'A8', 'rng0102', 0),
('krs0465', 'B1', 'rng0102', 0),
('krs0466', 'B2', 'rng0102', 0),
('krs0467', 'B3', 'rng0102', 0),
('krs0468', 'B4', 'rng0102', 0),
('krs0469', 'B5', 'rng0102', 0),
('krs0470', 'B6', 'rng0102', 0),
('krs0471', 'B7', 'rng0102', 0),
('krs0472', 'B8', 'rng0102', 0),
('krs0473', 'C1', 'rng0102', 0),
('krs0474', 'C2', 'rng0102', 0),
('krs0475', 'C3', 'rng0102', 0),
('krs0476', 'C4', 'rng0102', 0),
('krs0477', 'C5', 'rng0102', 0),
('krs0478', 'C6', 'rng0102', 0),
('krs0479', 'C7', 'rng0102', 0),
('krs0480', 'C8', 'rng0102', 0),
('krs0481', 'D1', 'rng0102', 0),
('krs0482', 'D2', 'rng0102', 0),
('krs0483', 'D3', 'rng0102', 0),
('krs0484', 'D4', 'rng0102', 0),
('krs0485', 'D5', 'rng0102', 0),
('krs0486', 'D6', 'rng0102', 0),
('krs0487', 'D7', 'rng0102', 0),
('krs0488', 'D8', 'rng0102', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `orderID` varchar(7) NOT NULL,
  `tanggalOrder` date NOT NULL,
  `userID` varchar(7) DEFAULT NULL,
  `totalHarga` decimal(12,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `paymentID` varchar(7) NOT NULL,
  `tanggalbayar` date NOT NULL,
  `totalBayar` decimal(12,2) DEFAULT '0.00',
  `statusBayar` varchar(10) NOT NULL,
  `userID` varchar(7) DEFAULT NULL,
  `orderID` varchar(7) DEFAULT NULL,
  `walletID` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang_bioskop`
--

CREATE TABLE `ruang_bioskop` (
  `ruangID` varchar(7) NOT NULL,
  `namaruang` varchar(50) NOT NULL,
  `bioskopID` varchar(7) DEFAULT NULL,
  `tipeRuang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `ruang_bioskop`
--

INSERT INTO `ruang_bioskop` (`ruangID`, `namaruang`, `bioskopID`, `tipeRuang`) VALUES
('rng0001', 'Audi 1', 'bskp001', 'Reguler'),
('rng0002', 'Audi 2', 'bskp001', 'Reguler'),
('rng0003', 'Audi 3', 'bskp001', 'Premium'),
('rng0004', 'Audi 4', 'bskp001', 'Premium'),
('rng0101', 'Audi 1', 'bskp002', 'Reguler'),
('rng0102', 'Audi 2', 'bskp002', 'Premium');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang_premium`
--

CREATE TABLE `ruang_premium` (
  `ruangID` varchar(7) NOT NULL,
  `jumlahKursi` int NOT NULL,
  `harga` decimal(12,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `ruang_premium`
--

INSERT INTO `ruang_premium` (`ruangID`, `jumlahKursi`, `harga`) VALUES
('rng0003', 32, 60000.00),
('rng0004', 32, 60000.00),
('rng0102', 32, 60000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang_reguler`
--

CREATE TABLE `ruang_reguler` (
  `ruangID` varchar(7) NOT NULL,
  `jumlahKursi` int NOT NULL,
  `harga` decimal(12,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `ruang_reguler`
--

INSERT INTO `ruang_reguler` (`ruangID`, `jumlahKursi`, `harga`) VALUES
('rng0001', 64, 40000.00),
('rng0002', 64, 40000.00),
('rng0101', 64, 40000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE `tiket` (
  `tiketID` varchar(7) NOT NULL,
  `totalHarga` decimal(10,2) NOT NULL,
  `jadwalTayangID` varchar(7) DEFAULT NULL,
  `kursiID` varchar(7) DEFAULT NULL,
  `orderID` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_wallet`
--

CREATE TABLE `t_wallet` (
  `walletID` varchar(7) NOT NULL,
  `saldo` decimal(12,2) DEFAULT '30000.00',
  `userID` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `t_wallet`
--

INSERT INTO `t_wallet` (`walletID`, `saldo`, `userID`) VALUES
('wlt0001', 20000000.00, 'usr0001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userID` varchar(7) NOT NULL,
  `namaUser` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `noTelp` varchar(15) DEFAULT NULL,
  `jenisKelamin` tinyint(1) DEFAULT NULL,
  `tanggalLahir` date DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`userID`, `namaUser`, `email`, `noTelp`, `jenisKelamin`, `tanggalLahir`, `username`, `password`) VALUES
('usr0001', 'Dhimas Hafizh F', 'dhimas.hfzh375@gmail.com', '081200000000', 1, '2004-12-30', 'dhimas', 'dhimas123');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bioskop`
--
ALTER TABLE `bioskop`
  ADD PRIMARY KEY (`bioskopID`);

--
-- Indeks untuk tabel `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`filmID`);

--
-- Indeks untuk tabel `jadwal_tayang`
--
ALTER TABLE `jadwal_tayang`
  ADD PRIMARY KEY (`jadwalTayangID`),
  ADD KEY `filmID` (`filmID`),
  ADD KEY `ruangID` (`ruangID`);

--
-- Indeks untuk tabel `kursi`
--
ALTER TABLE `kursi`
  ADD PRIMARY KEY (`kursiID`),
  ADD KEY `ruangID` (`ruangID`);

--
-- Indeks untuk tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `userID` (`userID`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `walletID` (`walletID`),
  ADD KEY `userID` (`userID`);

--
-- Indeks untuk tabel `ruang_bioskop`
--
ALTER TABLE `ruang_bioskop`
  ADD PRIMARY KEY (`ruangID`),
  ADD KEY `bioskopID` (`bioskopID`);

--
-- Indeks untuk tabel `ruang_premium`
--
ALTER TABLE `ruang_premium`
  ADD PRIMARY KEY (`ruangID`);

--
-- Indeks untuk tabel `ruang_reguler`
--
ALTER TABLE `ruang_reguler`
  ADD PRIMARY KEY (`ruangID`);

--
-- Indeks untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`tiketID`),
  ADD KEY `jadwalTayangID` (`jadwalTayangID`),
  ADD KEY `kursiID` (`kursiID`),
  ADD KEY `orderID` (`orderID`);

--
-- Indeks untuk tabel `t_wallet`
--
ALTER TABLE `t_wallet`
  ADD PRIMARY KEY (`walletID`),
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal_tayang`
--
ALTER TABLE `jadwal_tayang`
  ADD CONSTRAINT `jadwal_tayang_ibfk_1` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`),
  ADD CONSTRAINT `jadwal_tayang_ibfk_2` FOREIGN KEY (`ruangID`) REFERENCES `ruang_bioskop` (`ruangID`);

--
-- Ketidakleluasaan untuk tabel `kursi`
--
ALTER TABLE `kursi`
  ADD CONSTRAINT `kursi_ibfk_1` FOREIGN KEY (`ruangID`) REFERENCES `ruang_bioskop` (`ruangID`);

--
-- Ketidakleluasaan untuk tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Ketidakleluasaan untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`walletID`) REFERENCES `t_wallet` (`walletID`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Ketidakleluasaan untuk tabel `ruang_bioskop`
--
ALTER TABLE `ruang_bioskop`
  ADD CONSTRAINT `ruang_bioskop_ibfk_1` FOREIGN KEY (`bioskopID`) REFERENCES `bioskop` (`bioskopID`);

--
-- Ketidakleluasaan untuk tabel `ruang_premium`
--
ALTER TABLE `ruang_premium`
  ADD CONSTRAINT `ruang_premium_ibfk_1` FOREIGN KEY (`ruangID`) REFERENCES `ruang_bioskop` (`ruangID`);

--
-- Ketidakleluasaan untuk tabel `ruang_reguler`
--
ALTER TABLE `ruang_reguler`
  ADD CONSTRAINT `ruang_reguler_ibfk_1` FOREIGN KEY (`ruangID`) REFERENCES `ruang_bioskop` (`ruangID`);

--
-- Ketidakleluasaan untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`jadwalTayangID`) REFERENCES `jadwal_tayang` (`jadwalTayangID`),
  ADD CONSTRAINT `tiket_ibfk_2` FOREIGN KEY (`kursiID`) REFERENCES `kursi` (`kursiID`),
  ADD CONSTRAINT `tiket_ibfk_3` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`);

--
-- Ketidakleluasaan untuk tabel `t_wallet`
--
ALTER TABLE `t_wallet`
  ADD CONSTRAINT `t_wallet_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
