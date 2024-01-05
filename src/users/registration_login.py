import json

from flask import request, Response, Blueprint

from src.users.models.User import User, UserGuide
from src.utils import db

login_blueprint = Blueprint('register', __name__)


@login_blueprint.route('/register', methods=['POST'])
def register_user():
    user_json = json.loads(request.data)

    new_user = User(**user_json)

    db.session.add(new_user)
    db.session.commit()

    return Response('New user were created', 201)


@login_blueprint.route('/register_guide', methods=['POST'])
def register_guide():
    guide_json = json.loads(request.data)

    new_guide = UserGuide(**guide_json)

    db.session.add(new_guide)
    db.session.commit()

    return Response('New guide were created', 201)


@login_blueprint.route('/login', methods=['POST'])
def login():
    user_json = json.loads(request.data)

    user_query = db.select(User)\
        .filter_by(email=user_json['email'])\
        .filter(User.user_type.in_(['GUIDE', 'TOURIST']))

    user = db.session.execute(user_query).scalar_one_or_none()
    user.__dict__.pop('_sa_instance_state')

    if user:
        if user_json['password'] == user.password:
            return Response(json.dumps(user.__dict__), 200, mimetype='application/json')

    return Response("Incorrect login or password", 400)


@login_blueprint.route('/login-moderator', methods=['POST'])
def login_moderator():
    user_json = json.loads(request.data)

    user_query = db.select(User)\
        .filter_by(email=user_json['email'])\
        .filter_by(user_type='MODERATOR')

    user = db.session.execute(user_query).scalar_one_or_none()
    user.__dict__.pop('_sa_instance_state')

    if user:
        if user_json['password'] == user.password:
            return Response(json.dumps(user.__dict__), 200, mimetype='application/json')

    return Response("Incorrect login or password", 400)

