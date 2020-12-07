from flask import render_template, request, redirect
from QuanLy import app, login, models
from QuanLy.static import *
from flask_login import login_user, LoginManager
from QuanLy.models import *
from QuanLy.admin import *
import hashlib, os


@app.route("/")
def index():
    # index_path = 'index.html'
    #
    # return render_template((os.path.join(app.config['ROOT_PROJECT_PATH'], 'static/', index_path)))
    return render_template('index.html')

@app.route("/login-admin", methods=["get", "post"])
def login_admin():
    if request.method == "POST":
        username = str(request.form.get("username"))
        password = str(request.form.get("password"))
        # password = str(hashlib.md5(password.strip().encode("utf-8")).hexdigest())
        user = User.query.filter(User.username == username.strip(),
                                 User.password == password.strip()).first()
        if user and current_user.user_role == models.UserRole.ADMIN.value:
            login_user(user=user)
    return redirect("/admin")

@login.user_loader
def user_load(user_id):
    return User.query.get(user_id)

if __name__ == "__main__":
    app.run(debug=True, port=4999)