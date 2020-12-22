from sqlalchemy import Column, Integer, String, Float, Boolean, Date, ForeignKey, Enum, DateTime
from sqlalchemy.orm import relationship, backref
from QuanLy import db
from datetime import datetime
from flask_login import UserMixin
from enum import Enum as AEnum


class BenhNhan(db.Model):
    __tablename__ = "danhsachbenhnhan"
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100), nullable=False)
    date = Column(Date, default=datetime.now())
    date_of_birth = Column(Date, nullable=True)
    loaibenh = relationship('LoaiBenh', secondary='benhnhan_loaibenh', lazy='subquery',
                               backref=backref('BenhNhan', lazy=True))
    trieuchung = relationship('TrieuChung', secondary='benhnhan_trieuchung', lazy='subquery',
                               backref=backref('BenhNhan', lazy=True))
    # co_phieu_kham_benh = relationship('PhieuKhamBenh', backref='BenhNhan', lazy=True)

    def __str__(self):
        return self.name
#
#
# class PhieuKhamBenh(BaseView):
#     __tablename__ = "DanhSachKhamBenh"
#     gioi_tinh = Column(String(100), nullable=True)
#     nam_sinh = Column(Date, nullable=True)
#     dia_chi = Column(String(100), nullable=True)
#     id_benh_nhan = Column(Integer, ForeignKey(BenhNhan.id), nullable=False)

class LoaiBenh(db.Model):
    __tablename__ = 'loaibenh'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100), nullable=False)
    trieuchung = relationship('TrieuChung', secondary='loaibenh_trieuchung', lazy='subquery',
                               backref=backref('LoaiBenh', lazy=True))

    def __str__(self):
        return self.name

benhnhan_loaibenh = db.Table('benhnhan_loaibenh',
                             Column('id_benhnhan', Integer, ForeignKey(BenhNhan.id), primary_key=True),
                             Column('id_loaibenh', Integer, ForeignKey(LoaiBenh.id), primary_key=True))

class TrieuChung(db.Model):
    __tablename__ = 'trieuchung'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100), nullable=False)

    def __str__(self):
        return self.name

loaibenh_trieuchung = db.Table('loaibenh_trieuchung',
                                Column('id_trieuchung', Integer, ForeignKey(TrieuChung.id), primary_key=True),
                                Column('id_loaibenh', Integer, ForeignKey(LoaiBenh.id), primary_key=True))

benhnhan_trieuchung = db.Table('benhnhan_trieuchung',
                                Column('id_benhnhan', Integer, ForeignKey(BenhNhan.id), primary_key=True),
                                Column('id_trieuchung', Integer, ForeignKey(TrieuChung.id), primary_key=True))

class LoaiThuoc(db.Model):
    __tablename__ = 'loaithuoc'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100), nullable=False)
    cachdung = relationship('CachDungThuoc', secondary='loaithuoc_cachdung', lazy='subquery',
                          backref=backref('LoaiThuoc', lazy=True))

    def __str__(self):
        return self.name

class DonViThuoc(db.Model):
    __tablename__ = 'donvithuoc'
    id = Column(Integer, primary_key=True, autoincrement=True)
    donvi = Column(String(100), nullable=False)

    def __str__(self):
        return self.donvi

class DonGiaThuoc(db.Model):
    __tablename__ = 'dongiathuoc'
    id = Column(Integer, primary_key=True, autoincrement=True)
    dongia = Column(String(100), nullable=False)
    donvi = relationship('DonViThuoc', secondary='dongia_donvithuoc', lazy='subquery',
                               backref=backref('DonGiaThuoc', lazy=True))

    def __str__(self):
        return self.dongia

dongia_donvithuoc = db.Table('dongia_donvithuoc',
                                Column('id_dongia', Integer, ForeignKey(DonViThuoc.id), primary_key=True),
                                Column('id_donvi', Integer, ForeignKey(DonGiaThuoc.id), primary_key=True))

loaithuoc_donvithuoc = db.Table('loaithuoc_donvithuoc',
                                Column('id_loaithuoc', Integer, ForeignKey(LoaiThuoc.id), primary_key=True),
                                Column('id_donvi', Integer, ForeignKey(DonViThuoc.id), primary_key=True))

class CachDungThuoc(db.Model):
    __tablename__ = 'cachdungthuoc'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100), nullable=False)
    loaithuoc = relationship('LoaiThuoc', secondary='loaithuoc_cachdung', lazy='subquery',
                          backref=backref('CachDungThuoc', lazy=True))

    def __str__(self):
        return self.name

loaithuoc_cachdung = db.Table('loaithuoc_cachdung',
                                Column('id_loaithuoc', Integer, ForeignKey(LoaiThuoc.id), primary_key=True),
                                Column('id_cachdung', Integer, ForeignKey(CachDungThuoc.id), primary_key=True))

class UserRole(AEnum):
    ADMIN = 1
    DOCTOR = 2
    MEDICAL_WORKER = 3

class Gender(AEnum):
    MALE = 1
    FEMALE = 2

class User(db.Model, UserMixin):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100), nullable=False)
    username = Column(String(100), nullable=False)
    password = Column(String(100), nullable=False)
    avatar = Column(String(100))
    email = Column(String(100))
    active = Column(Boolean, default=True)
    address = Column(String(100), nullable=True)
    gender = Column(Enum(Gender), default=Gender.FEMALE)
    year_of_birth = Column(Integer, nullable=True)
    join_date = Column(Date, default=datetime.now())
    user_role = Column(Enum(UserRole))

    def __str__(self):
        return self.name

def insertUser():
    u1 = User(name="Admin",
              username="Admin",
              password="202cb962ac59075b964b07152d234b70",
              gender=Gender.MALE,
              user_role=UserRole.ADMIN)
    u2 = User(name="Doctor",
              username="Doctor",
              password="202cb962ac59075b964b07152d234b70",
              gender=Gender.MALE,
              user_role=UserRole.DOCTOR)
    u3 = User(name="Worker",
              username="Worker",
              password="202cb962ac59075b964b07152d234b70",
              gender=Gender.FEMALE,
              user_role=UserRole.MEDICAL_WORKER)
    db.session.add(u1)
    db.session.add(u2)
    db.session.add(u3)

def insertCachDung():
    cd1 = CachDungThuoc(name="Uống")
    cd2 = CachDungThuoc(name="Thoa")
    cd3 = CachDungThuoc(name="Tiêm")
    cd4 = CachDungThuoc(name="Ngậm")
    db.session.add(cd1)
    db.session.add(cd2)
    db.session.add(cd3)
    db.session.add(cd4)

def insertDonViThuoc():
    dvt1 = DonViThuoc(donvi="Viên")
    dvt2 = DonViThuoc(donvi="Chai")
    db.session.add(dvt1)
    db.session.add(dvt2)

def insertDonGiaThuoc():
    dgt1 = DonGiaThuoc(dongia=5000)
    dgt2 = DonGiaThuoc(dongia=10000)
    dgt3 = DonGiaThuoc(dongia=20000)
    dgt4 = DonGiaThuoc(dongia=50000)
    db.session.add(dgt1)
    db.session.add(dgt2)
    db.session.add(dgt3)
    db.session.add(dgt4)

def insertLoaiThuoc():
    lt1 = LoaiThuoc(name="Becberin")
    lt2 = LoaiThuoc(name="Aspirin")
    lt3 = LoaiThuoc(name="Paracetamol ")
    lt4 = LoaiThuoc(name="Hidrasec")
    lt5 = LoaiThuoc(name="Natufib")
    lt6 = LoaiThuoc(name="Acetaminophen")
    lt7 = LoaiThuoc(name="Codeine")
    lt8 = LoaiThuoc(name="Fentanyl")
    lt9 = LoaiThuoc(name="Methadone")
    lt10 = LoaiThuoc(name="Morphine")
    lt11 = LoaiThuoc(name="Amitriptyline")
    lt12 = LoaiThuoc(name="Cyclizine")
    lt13 = LoaiThuoc(name="Dexamethasone")
    lt14 = LoaiThuoc(name="Diazepam")
    lt15 = LoaiThuoc(name="Docusate sodium")
    lt16 = LoaiThuoc(name="Dexamethasone")
    lt17 = LoaiThuoc(name="Hydrocortisone")
    lt18 = LoaiThuoc(name="Penicillamine")
    lt19 = LoaiThuoc(name="Natri thiosulfate")
    lt20 = LoaiThuoc(name="Diazepam")
    lt21 = LoaiThuoc(name="Lamotrigine")
    lt22 = LoaiThuoc(name="Midazolam")
    lt23 = LoaiThuoc(name="Ethosuximide")
    lt24 = LoaiThuoc(name="Ivermectin")
    lt25 = LoaiThuoc(name="Levamisole")
    lt26 = LoaiThuoc(name="Niclosamide")
    lt27 = LoaiThuoc(name="Praziquantel")
    lt28 = LoaiThuoc(name="Diethylcarbamazine")
    lt29 = LoaiThuoc(name="Ivermectin")
    lt30 = LoaiThuoc(name="Triclabendazole")




    db.session.add(lt1)
    db.session.add(lt2)
    db.session.add(lt3)
    db.session.add(lt4)
    db.session.add(lt5)
    db.session.add(lt6)
    db.session.add(lt7)
    db.session.add(lt8)
    db.session.add(lt9)
    db.session.add(lt10)
    db.session.add(lt11)
    db.session.add(lt12)
    db.session.add(lt13)
    db.session.add(lt14)
    db.session.add(lt15)
    db.session.add(lt16)
    db.session.add(lt17)
    db.session.add(lt18)
    db.session.add(lt19)
    db.session.add(lt20)
    db.session.add(lt21)
    db.session.add(lt22)
    db.session.add(lt23)
    db.session.add(lt24)
    db.session.add(lt25)
    db.session.add(lt26)
    db.session.add(lt27)
    db.session.add(lt28)
    db.session.add(lt29)
    db.session.add(lt30)

def insertLoaiBenh():
    lb1 = LoaiBenh(name="Đau đầu")
    lb2 = LoaiBenh(name="Sốt")
    lb3 = LoaiBenh(name="Cảm cúm")
    lb4 = LoaiBenh(name="Viêm khớp")
    lb5 = LoaiBenh(name="Tay chân miệng")
    db.session.add(lb1)
    db.session.add(lb2)
    db.session.add(lb3)
    db.session.add(lb4)
    db.session.add(lb5)

def insertTrieuChung():
    tc1 = TrieuChung(name="Chảy mũi")
    tc2 = TrieuChung(name="Chóng mặt")
    tc3 = TrieuChung(name="Nóng sốt")
    tc4 = TrieuChung(name="Hoa mắt")
    db.session.add(tc1)
    db.session.add(tc2)
    db.session.add(tc3)
    db.session.add(tc4)

def insertBenhNhan():
    bn1 = BenhNhan(name="Nguyễn Văn A")
    bn2 = BenhNhan(name="Trần Thị B")
    bn3 = BenhNhan(name="Lê C")
    bn4 = BenhNhan(name="Cao D")
    bn5 = BenhNhan(name="Trương E")
    bn6 = BenhNhan(name="Huỳnh F")
    bn7 = BenhNhan(name="Vũ G")
    bn8 = BenhNhan(name="Đinh H")
    bn9 = BenhNhan(name="Phạm I")
    bn10 = BenhNhan(name="Hứa J")
    db.session.add(bn1)
    db.session.add(bn2)
    db.session.add(bn3)
    db.session.add(bn4)
    db.session.add(bn5)
    db.session.add(bn6)
    db.session.add(bn7)
    db.session.add(bn8)
    db.session.add(bn9)
    db.session.add(bn10)

if __name__ == '__main__':
    db.drop_all()
    db.create_all()
    insertUser()
    insertBenhNhan()
    insertLoaiBenh()
    insertCachDung()
    insertDonGiaThuoc()
    insertDonViThuoc()
    insertLoaiThuoc()
    insertTrieuChung()
    db.session.commit()





