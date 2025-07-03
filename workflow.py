from typing_extensions import TypedDict, Annotated
from langchain_community.tools.sql_database.tool import QuerySQLDataBaseTool
from prompts import query_prompt_template
from LLM import get_llm
from db import get_db

class Query(TypedDict):
    query: Annotated[str, ..., "Syntacically correct SQL query to run to answer the question."]

def write_query(state: dict):
    db = get_db()
    llm = get_llm()
    prompt = query_prompt_template.invoke({
        "dialect": db.dialect,
        "top_k": 10,
        "table_info": db.get_table_info(),
        "input": state["question"]
    })
    structured_llm = llm.with_structured_output(Query)
    response = structured_llm.invoke(prompt)
    state = dict(state)
    state["query"] = response["query"]
    return state

def execute_query(state: dict):
    db = get_db()
    execute_query_tool = QuerySQLDataBaseTool(db=db)
    result = execute_query_tool.invoke({"query": state["query"]})
    state = dict(state)
    state["result"] = result
    return state

def generate_answer(state: dict):
    llm = get_llm()
    prompt = (
        "Given the following query result, generate a concise answer to the question.\n\n"
        f"Question: {state['question']}\n"
        f"Query: {state['query']}\n"
        f"Result: {state['result']}\n"
    )
    response = llm.invoke(prompt)
    state = dict(state)
    state["answer"] = response
    return state