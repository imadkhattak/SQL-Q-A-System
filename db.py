from langchain_community.utilities import SQLDatabase

def get_db():
    return SQLDatabase.from_uri("mysql+mysqlconnector://root:imad123@localhost/imad_database")