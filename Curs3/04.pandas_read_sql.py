
import pandas as pd
import mysql.connector

# este necesara instalarea connector-ului catre sql ---- pip install mysql-connector-python
# nu este ok sa ne scriem user/password in clar, este stric de demo

# con = mysql.connector.connect(user = 'user', password = 'password', host = 'ip_local_host', database = 'database')


# trebuie instalata o librarie care ne permite lucrul cu variabilele de tip env
# parole si alte variabile sensibile se vor scrie in .env si con devine

import os
from load_dotenv import load_dotenv

load_dotenv()

DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

con = mysql.connector.connect(user = DB_USER, password = DB_PASSWORD, host = '127.0.0.1', database = 'facultate')

sql_query = "SELECT * FROM facultate.student;"

response = pd.read_sql(sql_query, con)
print(response)

# con.close()