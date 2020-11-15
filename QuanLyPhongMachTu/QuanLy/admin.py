from QuanLy import admin, db, app
from flask_admin.contrib.sqla import ModelView
from flask_admin import Admin

admin = Admin(app, name="QUẢN LÝ PHÒNG MẠCH TƯ", template_mode="bootstrap4")
