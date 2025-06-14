
from faker import Faker

fake = Faker('pt_BR')

def get_fake_account():
    account = {
        "name": fake.name(),
        "email": fake.email(), 
        "cpf": fake.cpf(),
    }
    return account

def get_manager_account():
    account = {        
        "email": "sac@smartbit.com",
        "password": "pwd123",

    }
    return account 