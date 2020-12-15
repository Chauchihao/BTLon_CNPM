import json, hashlib
from QuanLy import db
from QuanLy.models import User, UserRole


# def get_product_by_id(product_id):
    # return Product.query.get(product_id)

def add_user(name, email, username, password, avatar):
    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())
    u = User(name=name,
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




# def add_receipt(cart):
#     if cart:
#         try:
#             receipt = Receipt(customer_id=1)
#             db.session.add(receipt)
#
#             for p in list(cart.values()):
#                 detail = ReceiptDetail(product_id=int(p["id"]),
#                                        receipt_id=receipt.id,
#                                        price=float(p["price"]),
#                                        quantity=p["quantity"])
#                 db.session.add(detail)
#
#             db.session.commit()
#
#             return True
#         except :
#             pass
#
#     return False
