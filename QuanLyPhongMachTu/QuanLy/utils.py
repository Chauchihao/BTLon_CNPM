import json, hashlib
from QuanLy import db
from QuanLy.models import User, UserRole

def add_user(user_role,name, email, username, password, avatar):
    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())
    u = User(user_role=user_role,
             name=name,
             email=email,
             username=username,
             password=password,
             avatar=avatar)
    try:
        db.session.add(u)
        db.session.commit()

        return True
    except Exception as ex:
        print(ex)
        return False

