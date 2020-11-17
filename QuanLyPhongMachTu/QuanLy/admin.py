from werkzeug.utils import redirect

from QuanLy import admin, db, app
from flask_admin.contrib.sqla import ModelView
from flask_admin import Admin, BaseView, expose
from flask_login import logout_user, current_user

from QuanLy.models import BenhNhan, PhieuKhamBenh


class MySelftModelView(ModelView):
    column_display_pk = False
    can_edit = True
    can_export = True
    can_create = True
    can_delete = True

    def is_accessible(self):
        return current_user.is_authenticated

class LogoutView(BaseView):
    @expose('/')
    def index(self):
        logout_user()
        return redirect('/admin')

    def is_accessible(self):
        return current_user.is_authenticated


admin.add_view(MySelftModelView(BenhNhan, db.session, name="Bệnh Nhân"))
admin.add_view(MySelftModelView(PhieuKhamBenh, db.session, name="Phiếu khám bệnh"))
admin.add_view(LogoutView(name="Đăng xuất"))