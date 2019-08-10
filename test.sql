-- MySQL Script generated by MySQL Workbench
-- Thứ năm, 25 Tháng tư Năm 2019 01:01:14 +07
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema quanlynhaxe
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema quanlynhaxe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quanlynhaxe` DEFAULT CHARACTER SET utf8 ;
USE `quanlynhaxe` ;

-- -----------------------------------------------------
-- Table `quanlynhaxe`.`chamcong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlynhaxe`.`chamcong` (
  `manv` INT(11) NOT NULL,
  `ngay` DATE NOT NULL,
  `vskp` BIGINT(20) NULL DEFAULT NULL,
  `vsbd` BIGINT(20) NULL DEFAULT NULL,
  `ghichu` LONGTEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`manv`, `ngay`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `quanlynhaxe`.`chitiethoadonle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlynhaxe`.`chitiethoadonle` (
  `ma` INT(11) NOT NULL AUTO_INCREMENT,
  `mahoadon` VARCHAR(50) NOT NULL,
  `maphutung` VARCHAR(50) NULL DEFAULT NULL,
  `tenphutung` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `dongia` BIGINT(20) NULL DEFAULT '0',
  `soluong` INT(11) NOT NULL DEFAULT '0',
  `ghichu` LONGTEXT NULL DEFAULT NULL,
  `chietkhau` INT(11) NULL DEFAULT '0',
  `nhacungcap` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`ma`),
  INDEX `mahoadon` (`mahoadon` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `quanlynhaxe`.`chitiethoadonsuachua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlynhaxe`.`chitiethoadonsuachua` (
  `ma` INT(11) NOT NULL AUTO_INCREMENT,
  `mahoadon` VARCHAR(50) NOT NULL,
  `tenphutungvacongviec` VARCHAR(200) COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `nhacungcap` VARCHAR(45) NULL DEFAULT NULL,
  `maphutung` VARCHAR(100) NULL DEFAULT NULL,
  `soluongphutung` INT(11) NULL DEFAULT '0',
  `dongia` BIGINT(20) NULL DEFAULT '0',
  `tiencong` BIGINT(20) NULL DEFAULT '0',
  `tongtien` BIGINT(20) NULL DEFAULT '0',
  `manvsuachua` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ma`),
  INDEX `mahoadon` (`mahoadon` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `quanlynhaxe`.`cuahangngoai`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlynhaxe`.`cuahangngoai` (
  `tenphutung` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  `nhacungcap` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  `dongia` INT(11) NULL DEFAULT NULL,
  `ghichu` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`tenphutung`, `nhacungcap`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `quanlynhaxe`.`hoadon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlynhaxe`.`hoadon` (
  `mahoadon` VARCHAR(50) NOT NULL,
  `manv` INT(11) NOT NULL,
  `manvsuachua` INT(11) NULL DEFAULT NULL,
  `manvtiepnhan` INT(11) NULL DEFAULT NULL,
  `tenkh` VARCHAR(100) COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `makh` INT(11) NULL DEFAULT NULL,
  `biensoxe` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tongtien` BIGINT(20) NOT NULL DEFAULT '0',
  `ngayban` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngaythanhtoan` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangthai` INT(11) NULL DEFAULT NULL,
  `loaihoadon` INT(11) NOT NULL,
  `ngaysuachua` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `isdelete` INT(11) NULL DEFAULT '0',
  `yeucaukhachhang` LONGTEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tuvansuachua` LONGTEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `sokm` INT(11) NULL DEFAULT '0',
  PRIMARY KEY (`mahoadon`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `quanlynhaxe`.`khachhang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlynhaxe`.`khachhang` (
  `ma` INT(11) NOT NULL AUTO_INCREMENT,
  `ten` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  `sodienthoai` VARCHAR(20) NULL DEFAULT NULL,
  `diachi` VARCHAR(200) COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `biensoxe` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  `loaixe` VARCHAR(45) NULL DEFAULT NULL,
  `sokhung` VARCHAR(45) NULL DEFAULT NULL,
  `somay` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ma`),
  UNIQUE INDEX `biensoxe_UNIQUE` (`biensoxe` ASC),
  INDEX `ten` (`ten` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `quanlynhaxe`.`nhanvien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlynhaxe`.`nhanvien` (
  `ma` INT(11) NOT NULL AUTO_INCREMENT,
  `ten` VARCHAR(100) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `cmnd` VARCHAR(20) NULL DEFAULT NULL,
  `sdt` VARCHAR(20) NULL DEFAULT NULL,
  `gmail` VARCHAR(200) NULL DEFAULT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` LONGTEXT NOT NULL,
  `chucvu` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `isdelete` INT(11) NULL DEFAULT '0',
  PRIMARY KEY (`ma`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `ten` (`ten` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 54
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `quanlynhaxe`.`phutung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlynhaxe`.`phutung` (
  `maphutung` VARCHAR(30) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `tentienganh` VARCHAR(100) COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT 'Không có',
  `tentiengviet` VARCHAR(1000) COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT 'Không có',
  `loaiphutung` VARCHAR(20) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `giaban_head` BIGINT(20) NOT NULL DEFAULT '0',
  `giaban_le` BIGINT(20) NOT NULL DEFAULT '0',
  `soluongtonkho` INT(11) NOT NULL DEFAULT '0',
  `ghichu` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `vitri` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `ngaycapnhat` DATETIME NULL DEFAULT NULL,
  `loaixe` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `mau` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `model` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`maphutung`),
  UNIQUE INDEX `MaPhuTung` (`maphutung` ASC),
  INDEX `TenTiengViet` (`tentiengviet`(191) ASC),
  INDEX `tentienganh` (`tentienganh` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `quanlynhaxe`.`tiencong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlynhaxe`.`tiencong` (
  `ma` INT(11) NOT NULL AUTO_INCREMENT,
  `ten` VARCHAR(100) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `tien` BIGINT(20) NOT NULL,
  PRIMARY KEY (`ma`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
