from flask import render_template, request, redirect, url_for
from QuanLy import app, login, models, utils
from QuanLy.static import *
from flask_login import login_user, LoginManager
from QuanLy.models import *
from QuanLy.admin import *
import hashlib, os


@app.route("/")
def index():
    return render_template('index.html')

@app.route("/login-admin", methods=["get", "post"])
def login_usr():
    if request.method == "POST":
        username = str(request.form.get("username"))
        password = str(request.form.get("password"))
        password = str(hashlib.md5(password.strip().encode("utf-8")).hexdigest())
        user = User.query.filter(User.username == username.strip(),
                                 User.password == password.strip()).first()
        if user and user.active == True:
            login_user(user=user)
    elif request.method == 'GET':
        print(request.url)
        return render_template('login.html')
    return redirect("/admin")

@app.route('/register', methods=['get', 'post'])
def register():
    err_msg = ''
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        username = request.form.get('username')
        password = request.form.get('password', '').strip()
        confirm_password = request.form.get('confirm_password', '').strip()

        if password == confirm_password:
            avatar = request.files["avatar"]
            avatar_path = 'images/upload/%s' % avatar.filename
            avatar.save(os.path.join(app.config['ROOT_PROJECT_PATH'],
                                     'static/', avatar_path))

            if utils.add_user(name=name, email=email, username=username,
                              password=password, avatar=avatar_path):
                return redirect('/admin')
        else:
            err_msg = "Mật khẩu KHÔNG khớp!"

    return render_template('register.html', err_msg=err_msg)


@app.route('/logout')
def logout_usr():
    logout_user()
    return redirect(url_for('index'))

@login.user_loader
def get_user(user_id):
    return User.query.get(user_id)

if __name__ == "__main__":
    app.run(debug=True, port=4999)
