from werkzeug.utils import redirect
from  QuanLy.models import *
from QuanLy import admin, db, app, models
from flask_admin.contrib.sqla import ModelView
from flask_admin import Admin, BaseView, expose
from flask_login import logout_user, current_user

from QuanLy.models import User


class MySelftModelView(ModelView):
    column_display_pk = False
    can_edit = True
    can_export = True
    can_create = True
    can_delete = True
    can_view_details = True

    def is_accessible(self):
        return current_user.is_authenticated

class BenhNhanView(MySelftModelView):
    column_labels = dict(name="Họ tên", date="Ngày khám", date_of_birth="Ngày sinh", loaibenh="loại bệnh", trieuchung="Triệu chứng")

class LoaiBenhView(MySelftModelView):
    column_labels = dict(name="Loại bệnh", trieuchung="Triệu chứng")

class TrieuChungView(MySelftModelView):
    column_labels = dict(name="Triệu chứng")

class LoaiThuocView(MySelftModelView):
    column_labels = dict(name="Loại thuốc", cachdung="Cách dùng")

class DonViThuocView(MySelftModelView):
    column_labels = dict(donvi="Đơn vị")

class DonGiaThuocView(MySelftModelView):
    column_labels = dict(dongia="Đơn giá", donvi="Đơn vị")

class CachDungThuocView(MySelftModelView):
    column_labels = dict(name="Cách dùng", loaithuoc="Loại thuốc")



# class DoctorModelView(MySelftModelView):
#     def is_doctor(user = User.query.all()):
#         if user.user_role == models.UserRole.DOCTOR.name:
#             return current_user.is_authenticated

class LogoutView(BaseView):
    @expose('/')
    def index(self):
        logout_user()
        return redirect('/admin')

    def is_accessible(self):
        return current_user.is_authenticated


admin.add_view(MySelftModelView(User, db.session, name="User"))
admin.add_view(MySelftModelView(LoaiBenh, db.session, name="Loại bệnh"))
admin.add_view(MySelftModelView(TrieuChung, db.session, name="Triệu chứng"))
admin.add_view(MySelftModelView(LoaiThuoc, db.session, name="Loại thuốc"))
admin.add_view(MySelftModelView(BenhNhan, db.session, name="Bệnh nhân"))
admin.add_view(MySelftModelView(DonViThuoc, db.session, name="Đơn vị"))
admin.add_view(MySelftModelView(DonGiaThuoc, db.session, name="Đơn giá"))
admin.add_view(MySelftModelView(CachDungThuoc, db.session, name="Cách dùng"))

admin.add_view(LogoutView(name="Đăng xuất"))
