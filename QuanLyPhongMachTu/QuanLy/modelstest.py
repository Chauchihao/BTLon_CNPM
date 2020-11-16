from sqlalchemy import Column, Integer, String, Float, Boolean, Date, ForeignKey, Enum
from sqlalchemy.orm import relationships
from QuanLy import db
from datetime import datetime
from enum import Enum as UserEnum
from flask_login import UserMixin

if __name__ == '__main__':
    db.create_all()