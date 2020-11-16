from flask import render_template
from QuanLy import app
from flask_login import login_user, login_manager

@app.route("/")
def index():
    return render_template('index.html')

'@app.route("/login-admin" )'

if __name__ == "__main__":
    app.run(debug=True)