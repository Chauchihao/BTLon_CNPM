from sqlalchemy import Column, Integer, String, Float, Boolean, Date, ForeignKey, Enum
from sqlalchemy.orm import relationship, backref
from QuanLy import db
from datetime import datetime
from flask_login import UserMixin
from enum import Enum as UserEnum

class BaseView(db.Model):
    __abstract__ = True

    id = Column(Integer, primary_key=True, autoincrement=True)

    def __str__(self):
        return self.id

# class BenhNhan(BaseModal):
#     __tablename__ = "DanhSachBenhNhan"
#     ho_ten = Column(String(100), nullable=False)
#     ngay_kham = Column(Date, default=datetime.now())
#     loai_benh = Column(String(100), nullable=True)
#     trieu_chung = Column(String(100), nullable=True)
#     co_phieu_kham_benh = relationship('PhieuKhamBenh', backref='BenhNhan', lazy=True)
#
#
# class PhieuKhamBenh(BaseModal):
#     __tablename__ = "DanhSachKhamBenh"
#     gioi_tinh = Column(String(100), nullable=True)
#     nam_sinh = Column(Date, nullable=True)
#     dia_chi = Column(String(100), nullable=True)
#     id_benh_nhan = Column(Integer, ForeignKey(BenhNhan.id), nullable=False)

# loaibenh_trieuchung = db.Table('loaibenh_trieuchung',
#                                 Column('id_trieu_chung', Integer, ForeignKey('ql_trieu_chung.id'), primary_key=True),
#                                 Column('id_loai_benh', Integer, ForeignKey('ql_loai_benh.id'), primary_key=True))
#

class QL_LoaiBenh(BaseView):
    name = Column(String(100), nullable=False)
#     trieu_chung = relationship('Ql_TrieuChung', secondary='loaibenh_trieuchung', lazy='subquery',
#                                backref=backref('QL_LoaiBenh', lazy=True))
#
class QL_TrieuChung(BaseView):
    name = Column(String(100), nullable=False)

class QL_LoaiThuoc(BaseView):
    name = Column(String(100), nullable=False)



don_gia_don_vi_thuoc = db.Table('don_gia_don_vi_thuoc',
                                Column('id_don_gia', Integer, ForeignKey('don_vi_thuoc.id'), primary_key=True),
                                Column('id_don_vi', Integer, ForeignKey('don_gia_thuoc.id'), primary_key=True))

# class DonViThuoc(Enum):
#     VIEN = 1
#     CHAI = 2

class DonViThuoc(BaseView):
    don_vi = Column(String(100), nullable=False)

class DonGiaThuoc(BaseView):
    don_gia = Column(Float, nullable=False)
    don_vi = relationship('DonViThuoc', secondary='don_gia_don_vi_thuoc', lazy='subquery',
                               backref=backref('DonGiaThuoc', lazy=True))

class CachDungThuoc(Enum):
    UONG = 1
    THOA = 2
    NGAM = 3
    HIT = 4

class UserRole(UserEnum):
    ADMIN = 1
    DOCTOR = 2
    MEDICAL_WORKER = 3
    PATIENT = 4

class User(BaseView, UserMixin):
    __tablename__ = 'User'
    name = Column(String(100), nullable=False)
    username = Column(String(100), nullable=False)
    password = Column(String(100), nullable=False)
    avatar = Column(String(100))
    active = Column(Boolean, default=False)
    address = Column(String(100), nullable=True)
    sex = Column(Boolean, default=True)
    year_of_birth = Column(Integer, nullable=True)
    join_date = Column(Date, default=datetime.now())
    user_role = Column(Enum(UserRole))

class Doctor(User):
    __tablename__ = 'Doctor'
    khoa = Column(String(100), nullable=False)

if __name__ == '__main__':
    db.create_all()





