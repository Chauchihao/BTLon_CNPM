from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_login import LoginManager

app = Flask(__name__)
app.secret_key = "3129yefa3&*#832ryiuwe"
app.config["SQLALCHEMY_DATABASE_URI"] ="mysql+pymysql://root:1234@localhost/qlpmt?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
app.config['ROOT_PROJECT_PATH'] = app.root_path

db = SQLAlchemy(app=app)
admin = Admin(app, name="QUẢN LÝ PHÒNG MẠCH TƯ", template_mode="bootstrap4")

login = LoginManager(app)

