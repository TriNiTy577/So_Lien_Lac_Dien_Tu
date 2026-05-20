-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 20, 2026 lúc 04:34 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `student-management-system`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance`
--

CREATE TABLE `attendance` (
  `sid` int(10) NOT NULL,
  `date` date NOT NULL,
  `aid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `attendance`
--

INSERT INTO `attendance` (`sid`, `date`, `aid`) VALUES
(2, '2020-05-25', 3),
(1, '2020-05-30', 4),
(2, '2020-05-02', 5),
(2, '1975-09-17', 6),
(3, '2005-06-30', 7),
(16, '2026-05-20', 8),
(18, '2026-05-20', 9),
(18, '2026-05-20', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendancereport`
--

CREATE TABLE `attendancereport` (
  `aid` int(20) NOT NULL,
  `sid` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `attendancereport`
--

INSERT INTO `attendancereport` (`aid`, `sid`, `status`) VALUES
(3, 'ST1000010001', 'Absent'),
(3, 'ST1000010002', 'Present'),
(4, 'ST1000010001', 'Present'),
(4, 'ST1000010002', 'Present');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom`
--

CREATE TABLE `classroom` (
  `hno` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `capacity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `classroom`
--

INSERT INTO `classroom` (`hno`, `title`, `location`, `capacity`) VALUES
('4-A', '4-A', 'Block-D', 12),
('4-B', '4-B', 'Block-D', 50),
('4-C', '4-C', 'Block-D', 48);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `teacher` varchar(50) NOT NULL,
  `classroom` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `stime` time NOT NULL,
  `etime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `exam`
--

INSERT INTO `exam` (`id`, `subject`, `teacher`, `classroom`, `date`, `stime`, `etime`) VALUES
(5, '1', '1', '4-A', '2026-05-19', '07:00:00', '11:00:00'),
(6, '1', '1', '4-A', '2026-05-20', '00:00:00', '00:00:00'),
(7, '1', '3', '4-A', '2026-05-22', '07:00:00', '11:00:00'),
(8, '4', '2', '4-A', '2026-05-21', '07:00:00', '11:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `examresult`
--

CREATE TABLE `examresult` (
  `exam` int(11) NOT NULL,
  `student` varchar(50) NOT NULL,
  `marks` int(10) NOT NULL,
  `grade` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `examresult`
--

INSERT INTO `examresult` (`exam`, `student`, `marks`, `grade`) VALUES
(5, '3', 78, 'B+'),
(5, '4', 67, 'D'),
(5, '5', 12, 'E'),
(5, '9', 78, 'B+'),
(8, '3', 74, 'B');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `notice` varchar(1500) NOT NULL,
  `odience` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `notice`
--

INSERT INTO `notice` (`id`, `notice`, `odience`, `date`) VALUES
(7, 'thong bao test cho Stu', 'Student', '2026-05-20 21:32:01'),
(8, 'Thong bao test cho pa', 'Parent', '2026-05-20 21:32:15'),
(9, 'Thong bao test cho all', 'All', '2026-05-20 21:32:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `parent`
--

CREATE TABLE `parent` (
  `pid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `job` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `nic` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `parent`
--

INSERT INTO `parent` (`pid`, `fname`, `lname`, `contact`, `job`, `address`, `gender`, `nic`, `email`) VALUES
(1, 'Kelly', 'Kelly', '078556645', 'Kỹ sư', 'Hà Nội', 'Male', '7855485552', 'parent@gmail.com'),
(2, 'Natasha', 'Romanoff', '213157964', 'Kế Toán', 'Hải Phòng', 'Female', '031205678994', 'Natasha@gmail.com'),
(3, 'Taylor', 'Swift', '214124567', 'Kế toán', 'Hải Phòng', 'Male', '103974758', 'Taylor@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `teacher` varchar(50) NOT NULL,
  `day` varchar(50) NOT NULL,
  `stime` time NOT NULL,
  `class` varchar(50) NOT NULL,
  `etime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `schedule`
--

INSERT INTO `schedule` (`id`, `subject`, `teacher`, `day`, `stime`, `class`, `etime`) VALUES
(16, '1', '1', 'Monday', '07:00:00', '4-A', '11:00:00'),
(17, '2', '2', 'Tuesday', '07:00:00', '4-B', '11:00:00'),
(18, '3', '3', 'Wendsday', '07:00:00', '4-C', '11:00:00'),
(19, '1', '1', 'Monday', '07:00:00', 'Select Class Room', '11:00:00'),
(20, '7', '3', 'Saturday', '07:00:00', '4-B', '00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
--

CREATE TABLE `student` (
  `sid` int(25) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `bday` date NOT NULL,
  `address` varchar(250) NOT NULL,
  `parent` int(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `classroom` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `student`
--

INSERT INTO `student` (`sid`, `fname`, `lname`, `bday`, `address`, `parent`, `gender`, `classroom`, `email`) VALUES
(1, 'Minh Quân', 'Nguyễn', '2018-01-23', 'Hà Nội', 1, 'Male', '4-A', 'quan@gmail.com'),
(2, 'Khánh Linh', 'Lê Trần', '2017-08-22', 'Hồ Chí Minh', 2, 'Male', '4-B', 'linh@gmail.com'),
(3, 'Đức Anh', 'Phạm ', '2017-01-11', 'Hải Phòng', 1, 'Male', '4-B', 'ducanh@gmail.com'),
(4, 'Thanh Tuyền', 'Trần Thị', '2016-04-06', 'Đà Nẵng', 1, 'Female', '4-B', 'thanhhuyen@gmail.com'),
(5, 'Gia Bảo', 'Hoàng', '2009-05-31', 'Hải Phòng', 1, 'Male', '4-B', 'bao@gmail.com'),
(6, 'Hải Yến', 'Vũ', '2010-03-12', 'Hà Nội', 1, 'Female', '4-B', 'haiyen@gmail.com'),
(7, 'Nam Phong', 'Đỗ', '2017-12-29', 'Hải Phòng', 1, 'Male', '4-A', 'phong@gmail.com'),
(8, 'Minh Tuyết', 'Bùi', '2022-05-19', 'Biên Hòa', 1, 'Female', '4-B', 'student@gmail.com'),
(9, 'Quang Huy', 'Ngô', '2020-05-31', 'Hạ Long', 1, 'Male', '4-B', 'huy@gmail.com'),
(10, 'Thúy Ngân', 'Đặng', '2022-05-19', 'Thái Bình', 1, 'Female', '4-B', 'ngan@gmail.com'),
(11, 'Đình Nguyên', 'Phan', '2020-05-27', 'Thanh Hóa', 1, 'Female', '4-B', 'nguyet@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subject`
--

CREATE TABLE `subject` (
  `sid` int(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `subject`
--

INSERT INTO `subject` (`sid`, `title`, `description`) VALUES
(1, 'Toán học', 'Toán học'),
(2, 'Ngữ Văn', 'Ngữ Văn'),
(3, 'Lịch Sử', 'Lịch Sử'),
(4, 'Tiếng Anh', 'Tiếng Anh'),
(5, 'Vật lí', 'Vật lí'),
(6, 'Hóa học', 'Hóa học'),
(7, 'Sinh học', 'Sinh học'),
(8, 'Địa lí', 'Địa lí'),
(9, 'Công nghệ', 'Công nghệ'),
(10, 'Tin học', 'Tin học');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacher`
--

CREATE TABLE `teacher` (
  `tid` int(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `bday` date NOT NULL,
  `skill` varchar(500) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `teacher`
--

INSERT INTO `teacher` (`tid`, `fname`, `lname`, `address`, `contact`, `bday`, `skill`, `gender`, `email`) VALUES
(1, 'Trọng Phú', 'Trần', 'Thái Bình', '0123456789', '2026-05-20', 'Toán', 'Male', 'phu@gmail.com'),
(2, 'Phúc', 'Hoàng', 'Hải Phòng', '1278371123', '2005-09-19', 'Ngữ Văn', 'Male', 'phuc@gmail.com'),
(3, 'Nimal ', 'Soyza', 'Hà Nội', '0339988554', '2026-05-20', 'Tin Học', 'Female', 'teacher@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `role` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`role`, `email`, `password`) VALUES
('Student', 'ducanh@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
('Parent', 'parent@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
('Teacher', 'phuc@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
('Student', 'student@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
('Teacher', 'teacher@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`aid`);

--
-- Chỉ mục cho bảng `attendancereport`
--
ALTER TABLE `attendancereport`
  ADD PRIMARY KEY (`aid`,`sid`);

--
-- Chỉ mục cho bảng `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`hno`);

--
-- Chỉ mục cho bảng `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `examresult`
--
ALTER TABLE `examresult`
  ADD PRIMARY KEY (`exam`,`student`);

--
-- Chỉ mục cho bảng `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sid`);

--
-- Chỉ mục cho bảng `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attendance`
--
ALTER TABLE `attendance`
  MODIFY `aid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `parent`
--
ALTER TABLE `parent`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `student`
--
ALTER TABLE `student`
  MODIFY `sid` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `subject`
--
ALTER TABLE `subject`
  MODIFY `sid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `teacher`
--
ALTER TABLE `teacher`
  MODIFY `tid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
