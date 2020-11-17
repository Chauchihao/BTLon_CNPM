from werkzeug.utils import redirect

from QuanLy import admin, db, app
from flask_admin.contrib.sqla import ModelView
from flask_admin import Admin, BaseView, expose
from flask_login import logout_user, current_user

admin = Admin(app, name="QUẢN LÝ PHÒNG MẠCH TƯ", template_mode="bootstrap4")

class LogoutView(BaseView):
    @expose('/')
    def index(self):
        logout_user()
        return redirect('/admin')

    def is_accessible(self):
        return current_user.is_authenticated

admin.add_view(LogoutView(name="Đăng xuất"))
