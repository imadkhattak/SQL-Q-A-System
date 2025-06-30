import os
import re
import requests
from dotenv import load_dotenv
from db import execute_query

load_dotenv()

API_KEY = os.getenv('API_KEY')
API_URL = "https://meta-llama-3-1-405b.p.rapidapi.com/"

HEADERS = {
    'X-RapidAPI-Key': API_KEY,
    'X-RapidAPI-Host': 'meta-llama-3-1-405b.p.rapidapi.com',
    'Content-Type': 'application/json'
}

def call_llm(message):
    payload = {
        "model": "meta-llama-3-1-405b",
        "messages": [{"role": "user", "content": message}]
    }
    res = requests.post(API_URL, headers=HEADERS, json=payload)
    res.raise_for_status()
    return res.json()['choices'][0]['message']['content']

def is_safe_sql(query):
    query = query.strip().rstrip(';')  # remove trailing ;
    query_upper = query.upper()
    forbidden = ["DROP", "DELETE", "ALTER", "TRUNCATE", "INSERT", "UPDATE", "--"]
    return all(kw not in query_upper for kw in forbidden)


def format_result(result_dict):
    rows = result_dict["rows"]
    cols = result_dict["column_names"]
    if not rows:
        return "No data found."
    if len(rows) == 1 and len(cols) == 1:
        return str(rows[0][0])
    return str([{col: val for col, val in zip(cols, row)} for row in rows[:3]])


def extract_sql(text):
    # Match code block with ```sql or plain SQL line
    match = re.search(r"```sql\s*(.*?)\s*```", text, re.DOTALL)
    if match:
        return match.group(1).strip().rstrip(';')
    return text.strip().splitlines()[-1].strip().rstrip(';')



def simple_chain(user_question: str) -> str:
    # 1. Ask model for SQL query
    sql_prompt = (
        f"Convert this natural language question into a MySQL SELECT query. "
        f"Only use SELECT and do not include Markdown or comments.\n"
        f"Question: {user_question}"
    )
    raw_response = call_llm(sql_prompt)
    sql_query = extract_sql(raw_response)
    print("[DEBUG] SQL:", sql_query)

    if not is_safe_sql(sql_query):
        return "⚠️ Unsafe SQL detected. Only SELECT queries are allowed."

    # 2. Run query
    result = execute_query(sql_query)
    formatted = format_result(result)

    # 3. Generate answer
    summary_prompt = f"The SQL query was: {sql_query}. The result is: {formatted}. Respond briefly in natural language."
    final_answer = call_llm(summary_prompt)
    return final_answer
