import mysql.connector 
import os

def get_connection():
    return mysql.connector.connect(
        host=os.getenv('DB_HOST'),
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'),
        database=os.getenv('DB_NAME')
    )

def execute_query(query, params=None):
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(query, params)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]   
        return {
            'column_names': column_names,
            'rows': results
        }
    finally:
        cursor.close()
        conn.close()
