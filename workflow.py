from typing_extensions import TypedDict, Annotated
from langchain_community.tools import QuerySQLDatabaseTool  
from prompts import query_prompt_template
from LLM import get_llm
from db import get_db

class Query(TypedDict):
    query: Annotated[str, ..., "Syntacically correct SQL query to run to answer the question. One or more SQL queries to run, separated by semicolons."]

def write_query(state: dict):
    db = get_db()
    llm = get_llm()
    history = ""
    if "memory" in state and state["memory"]:
        history = state["memory"].buffer

    prompt = query_prompt_template.invoke({
        "dialect": db.dialect,
        "top_k": 10,
        "table_info": db.get_table_info(),
        "input": f"Conversation history:\n{history}\n\nCurrent question:\n{state['question']}"
    })
    
    print("\n🧾 Prompt sent to LLM:\n", prompt)

    structured_llm = llm.with_structured_output(Query)
    response = structured_llm.invoke(prompt)
    state = dict(state)
    state["query"] = response["query"]
    print(f"\n🔍 Generated SQL Query:\n{state['query']}\n")
    return state

def execute_query(state: dict):
# updated import
    db = get_db()
    execute_query_tool = QuerySQLDatabaseTool(db=db)

    queries = state["query"].split(";")
    results = []

    for q in queries:
        q = q.strip()
        if q:
            try:
                result = execute_query_tool.invoke({"query": q})
                results.append(result)
            except Exception as e:
                results.append(f"Error executing query: {q}\n{str(e)}")

    state = dict(state)
    state["result"] = results  # ✅ Ensures 'result' is always set
    return state



def generate_answer(state: dict):
    memory = state.get("memory")
    llm = get_llm()
    history = memory.buffer if memory is not None else ""
    prompt = (
        f"Use the following SQL query result to answer the user's question strictly based on the data. "
        f"Do not include any extra assumptions or unrelated product details.\n\n"
        f"Question: {state['question']}\n"
        f"SQL Query: {state['query']}\n"
        f"SQL Result: {state['result']}\n\n"
        f"Answer concisely based only on the result."
)

    # Optionally, use memory to save the context
    if memory is not None:
        memory.save_context(
            {"input": state["question"]},
            {"output": state.get("answer", str(state.get("result", "")))}
        )

    response = llm.invoke(prompt)
    state = dict(state)
    state["answer"] = response
    print(f"\n💬 Generated Answer:\n{state['answer']}\n")
    return state