from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root@123456@localhost/qlpmt?charset=utf8bm4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True

db = SQLAlchemy(app=app)
admin = Admin(app=app, name="QUẢN LÝ PHÒNG MẠCH TƯ", template_mode="bootstrap4")