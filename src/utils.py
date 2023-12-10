from flask_mail import Mail
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
mail = Mail()

reset_mail_body = """
Cześć {name}
\r\n
Oto twoje nowe hasło:
\r\n
{password}
\r\n
Zalecamy zmianę tego hasła. Możesz je zmienić na swoim profilu.
\r\n
Jeśli nie wysyłałeś prośby o reset hasła, skontaktuj się z administracją strony
\r\n
Pozdrawiamy,
Administracja GuidePRO
"""
