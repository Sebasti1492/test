service mysql start
mysql -u root -e "CREATE USER user@localhost IDENTIFIED BY 'password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO user@localhost"
service mysql restart
python /countapp/init_database.py
gunicorn --bind 0.0.0.0:6000 --chdir countapp countapp.wsgi:app --reload --timeout=900
