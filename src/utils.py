from flask_mail import Mail
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
mail = Mail()

reset_mail_body = """
Cześć {name}
\r\n
Oto twoje nowe hasło. Możesz je zmienić na bardziej wygodnie dla ciebie w twoim profilu
Hasło: {password}
\r\n
Jeśli nie wysyłałeś prośby o reset hasła, skontaktuj się z administracją strony
\r\n
Pozdrawiamy,
Administracja GuidePRO
"""
