from sqlalchemy import Column, Integer, String, Float, Boolean, Date, ForeignKey, Enum
from sqlalchemy.orm import relationship
from QuanLy import db
from datetime import datetime
from enum import Enum as UserEnum
from flask_login import UserMixin

class BenhNhan(db.Model):
    __tablename__ = "DanhSachBenhNhan"
    id = Column(Integer, primary_key=True, autoincrement=True)
    hoten = Column(String(100), nullable=False)
    ngaykham = Column(Date, default=datetime.now())
    loaibenh = Column(String(100), nullable=True)
    trieuchung = Column(String(100), nullable=True)
    cophieukhambenh = relationship('PhieuKhamBenh', backref='PhieuKhamBenh', lazy=True)

class PhieuKhamBenh(db.Model):
    __tablename__ = "DanhSachKhamBenh"
    id = Column(Integer, primary_key=True, autoincrement=True)
    hoten = Column(String(100), ForeignKey(BenhNhan.hoten), nullable=False)
    ngaykham = Column(Date, ForeignKey(BenhNhan.ngaykham))
    gioitinh = Column(String(100), nullable=True)
    namsinh = Column(Date, nullable=True)
    diachi = Column(String(100), nullable=True)
    idbenhnhan = Column(Integer, ForeignKey(BenhNhan.id), nullable=False)

    def __str__(self):
         return self.name


class User(db.Model, UserMixin):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    active = Column(Boolean, default=True)
    username = Column(String(50), nullable=False)
    password = Column(String(50), nullable=False)

if __name__ == '__main__':
    db.create_all()





