import json
import random
import string

from flask import Blueprint, Response, request
from flask_mail import Message

from src.utils import mail, reset_mail_body
from src.users.models.User import User
from src.utils import db

user_blueprint = Blueprint('user', __name__)


@user_blueprint.route('/users/all', methods=['GET'])
def get_users():
    users = db.session.query(User).all()

    users_json = {'users': [user.__dict__ for user in users]}
    for user in users_json['users']:
        user.pop('_sa_instance_state')

    print(users_json)

    return Response(json.dumps(users_json), 200, mimetype='application/json')


@user_blueprint.route('/update_user', methods=['PUT'])
def update_user():
    user_json = json.loads(request.data)

    user_query = db.select(User).filter_by(login=user_json['login'])
    user = db.session.execute(user_query).scalar_one()

    for attribute in user.__dict__:
        if (attribute != 'login' or attribute != 'email') and attribute in user_json:
            setattr(user, attribute, user_json[attribute])

    db.session.commit()

    return Response('User updated', 200)


@user_blueprint.route('/delete_user', methods=['DELETE'])
def delete_user():
    user_json = json.loads(request.data)

    user_query = db.select(User).filter_by(login=user_json['login'])
    user = db.session.execute(user_query).scalar_one()
    print(user)

    db.session.delete(user)
    db.session.commit()

    return Response('User deleted', 204)


@user_blueprint.route('/password_reset', methods=['PUT'])
def send_mail():
    user_json = json.loads(request.data)

    new_pass = ''.join(random.choices(string.ascii_letters + string.digits + string.punctuation, k=12))
    print(new_pass)

    user_query = db.select(User).filter_by(email=user_json['email'])
    user = db.session.execute(user_query).scalar_one_or_none()

    if user is None:
        return Response('User does not exist', 400)

    print(user.password)

    setattr(user, 'password', new_pass)
    print(user.password)

    db.session.commit()

    mail_message = Message('Reset hasła', sender='guidepro12@gmail.com', recipients=[user.email])

    mail_message.body = reset_mail_body.format(name=user.name, password=new_pass)
    mail.send(mail_message)

    return Response('Password reset correctly', 200)
