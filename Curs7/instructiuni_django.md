
Daca Django nu este instalat
# pip install django

Crearea unui proiect Django
# python -m django startproject numeproiect
sau daca este vizibil django-admin
# django-admin startproject numeproiect

Intrarea in folderul proiectului prorpiu-zis
# cd numeproiect

Rularea serverului -> terminalul acesta ramane mereu deschis pt a mentine serverul
# python manage.py runserver

Deschiderea unui nou terminal
# VSCode -> Terminal -> New Terminal

Crearea unei noi aplicatii ( un proiect are de obicei mai multe aplicatii)
1. navighez la nivelul lui manage.py
# cd numeproiect
2. Verific daca sunt in locatia buna
# ls                ->  trebuie sa apara manage.py
3. Crearea unei noi aplicatii
# python manage.py startapp numeaplicatie
4. Instalarea aplicatiei -> in numeproiect -> settings.py -> in INSTALLED_APPS -> adaug 'numeaplicatie'

Pentru a crea o migrare (= actiune de tip DCL in cadrul bazei de date)
# python manage.py makemigrations
# python manage.py migrate

Pentru a crea un superuser (atentie, doar valori pur educationale)
# python manage.py createsuperuser
    username -> admin
    email -> admin@admin.com
    password -> admin
    Bypass password validation and create user anyway? [y/N]: y

-dupa crearea userului admin putem efectua loginul la: /admin

Pentru a crea un nou model: 
1. In folderul aplicatiei -> models.py -> se creeaza un modul (o clasa de oop), de ex:
class Departament(models.Model):
    nume = models.CharField(max_length=20)
2. Modelul trebuie adus in baza de date 
# python manage.py makemigrations
# python manage.py migrate

Pentru a inregistra un model in admin ( pentru a-l putea modifica din /admin )
1. in aplicatia in care se afla modelul -> admin.py
2. se inregsitreaza modelele cu urmatoarele comenzi
    # from .models import Departament
    # admin.site.register(Departament)

Pentru a inlocui default SQLite3 cu MySQL
1. instalarea clientului mysql
# pip install mysqlclient
alernativ (macOS) are nevoie de urmatoarele modificari
# pip install PyMySQL
si in __init__.py din proiect(doar daca nu merge mysqlclient):
    # import pymysql
    # pymysql.install_as_MySQLdb()
2. navigam in proiect -> settings.py
3. inlocuiesc datele pentru SQLite3 cu Mysql in variabila DATABASES si o comentez pe cea veche
<!-- DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
} -->
se inlocuieste cu:
<!-- DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'my_django_database',
        'USER': 'my_django_databaseuser',
        'PASSWORD': 'my_django_password',
        'HOST': '127.0.0.1',
        'PORT': '3306'
    }
} -->

Explicatii variabile:
# 'ENGINE': 'django.db.backends.mysql' -> engine pentru mysql
pentru urmatoarele, ar fi trebuit sa am in MySQL ceva similar
        # 'NAME': 'my_django_database',
        # 'USER': 'my_django_databaseuser',
        # 'PASSWORD': 'my_django_password',
adica:
    -> CREATE DATABASE IF NOT EXISTS my_django_database;
    -> CREATE USER 'my_django_databaseuser'@'127.0.0.1' IDENTIFIED BY 'my_django_password';
    -> GRANT ALL PRIVILEGES ON my_django_database.* TO'my_django_databaseuser'@'127.0.0.1';
# 'HOST': '127.0.0.1' -> host local
# 'PORT': '3306' -> port specific pentru mysql

Dupa conectarea la noua baza de date:
# python manage.py makemigrations
# python manage.py migrate

Pentru a vedea modelele dintr-o interfata
1. Template (HTML)
    -> in aplicatia modelului creez un folder 'templates' ( obligatoriu sa fie exact templates)
    -> in folderul 'templates' creez fisier .html care va afisa modelele
2.  View (functia) - leaga o cerere de server cu modelul de template (html)

    def departments_view(request):

    ## ORM face in spate un SELECT * FROM departament
    all_departments = Departament.objects.all()

    return(render(request, 'modele.html', context = {'departments': all_departments}))

3. URL - link ul la care functia view din view.py raspunde
    -> in urls.py din proiect