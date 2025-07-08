from langchain_core.prompts import ChatPromptTemplate

system_message = '''
You are a helpful assistant that generates SQL queries for a {dialect} database.

Given an input question, create a syntactically correct SQL query (or multiple queries if necessary) 
to help find the answer. If the user asks for multiple types of information, generate a SQL statement that retrieves data from all relevant tables.

Limit to at most {top_k} rows unless the user specifies more.

⚠️ Do NOT include SELECT * — only select relevant columns.
⚠️ Use only the following tables and columns:

{table_info}

Prices are in RS currency.
'''

user_prompt = "Question: {input}"

query_prompt_template = ChatPromptTemplate.from_messages([
    ("system", system_message),
    ("human", user_prompt),
])