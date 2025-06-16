import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

db_connection = f"""
    dbname='{os.getenv('DB_NAME')}'
    user='{os.getenv('DB_USER')}'
    password='{os.getenv('DB_PASSWORD')}'
    host='{os.getenv('DB_HOST')}'
"""

def execute(query):
    try:
        connection = psycopg2.connect(db_connection)

        cursor = connection.cursor()
        cursor.execute(query)
        connection.commit()
        cursor.close()
        connection.close()
    except Exception as e:
        print("Erro ao executar query:", e)
        raise 

def insert_membership(data):

    account = data['account']
    plan = data['plan']
    credit_card = data['credit_card']['number'][-4:]

    query = f"""
    BEGIN; -- Inicia uma transação

    -- Remove o registro pelo email
    DELETE FROM accounts
    WHERE email = '{account['email']}';

    -- Insere uma nova conta e obtém o ID da conta recém-inserida
    WITH new_account AS (
        INSERT INTO accounts (name, email, cpf)
        VALUES ('{account['name']}', '{account['email']}', '{account['cpf']}')
        RETURNING id
    )

    -- Insere um registro na tabela memberships com o ID da conta
    INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
    SELECT id, {plan['id']}, '{credit_card}', {plan['price']}, true
    FROM new_account;

    COMMIT; -- Confirma a transação
    """
    execute(query)

def insert_account(account):
    query = f"INSERT INTO accounts (name, email, cpf) VALUES ('{account['name']}', '{account['email']}', '{account['cpf']}');"
    try:
        execute(query)
    except Exception as e:
        print(e)


def delete_account_by_email(email):
    query = f"DELETE FROM accounts WHERE email = '{email}';"
    try:
        execute(query)
    except Exception as e:
        print(e)