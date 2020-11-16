from sqlalchemy import Column, Integer, String, Float, Boolean, Date, ForeignKey, Enum
from sqlalchemy.orm import relationships
from QuanLy import db
from datetime import datetime
from enum import Enum as UserEnum
from flask_login import UserMixin

# class Base(db.Model):
#     __abstract__ = True
#
#     id = Column(Integer, primary_key=True, autoincrement=True)
#
#     def __str__(self):
#         return self.name

class DanhSachKhamBenh(db.Model):
    __tablename__ = "DanhSachKhamBenh"
    id = Column(Integer, primary_key=True, autoincrement=True)
    hoten = Column(String(100), nullable=False)
    ngaykham = Column(Date, default=datetime.now())
    gioitinh = Column(String(100), nullable=True)
    namsinh = Column(Date, nullable=True)
    diachi = Column(String(100), nullable=True)

    def __str__(self):
         return self.name
#
# class PhieuKhamBenh(db.Model):
#     __tablename__ = "PhieuKhamBenh"
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     hoten = Column(String(100), ForeignKey(DanhSachKhamBenh.hoten), nullable=False)
#     trieuchung = Column(String(100), nullable=True)
#     ngaykham = Column(Date, ForeignKey(DanhSachKhamBenh.ngaykham))
#     dudoanloaibenh = Column(String(100), nullable=True)
#     thuoc = Column(String(100), nullable=True)
#     donvi = Column(Integer, nullable=True)
#     soluong = Column(Integer, nullable=True)
#     cachdung = Column(String(100), nullable=True)
#     def __str__(self):
#          return self.name
#
# # class DanhSachBenhNhan(Base):
# #     __tablename__ = "DanhSachBenhNhan"
# #     hoten = Column(String(100), ForeignKey(DanhSachKhamBenh.hoten), nullable=False)
# #     ngaykham = Column(Date, ForeignKey(DanhSachKhamBenh.ngaykham))
# #     loaibenh = Column(String(100), ForeignKey(PhieuKhamBenh.dudoanloaibenh), nullable=True)
# #     trieuchung = Column(String(100), ForeignKey(PhieuKhamBenh.trieuchung), nullable=True)
# #
# # class HoaDonThanhToan(Base):
# #     __tablename__ = "HoaDonThanhToan"
# #     hoten = Column(String(100), ForeignKey(DanhSachKhamBenh.hoten), nullable=False)
# #     ngaykham = Column(Date, ForeignKey(DanhSachKhamBenh.ngaykham))
# #     tienkham = Column(Float, nullable=True)
# #     tienthuoc = Column(Float, nullable=True)
#
# # class BaoCaoDanhThuTheoNgay(Base):
# #     __tablename__ = "BaoCaoDanhThuTheoNgay"
# #     thang = Column(Integer, nullable=False)
# #     ngay = Column(Date, ForeignKey(PhieuKhamBenh.ngaykham))
# #
# # class BaoCaoSuDungThuoc(Base):
# #     __tablename__ = "BaoCaoSuDungThuoc"
# #     thang = Column(Integer, nullable=False)
#
# class UserRole(UserEnum):
#     Admin = 1
#     BacSi = 2
#     NhanVien = 3
#
#
# class User(db.Model, UserMixin):
#     __tablename__ = 'user'
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     email = Column(String(50))
#     username = Column(String(100), nullable=False)
#     password = Column(String(100), nullable=False)
#     avatar = Column(String(100))
#     active = Column(Boolean, default=True)
#     joined_date = Column(Date, default=datetime.now())
#     #user_role = Column(Enum(UserRole), default=UserRole.USER)
#     def __str__(self):
#          return self.name


if __name__ == '__main__':
    db.create_all()


