from graph_builder import build_graph
from typing_extensions import TypedDict
from typing import Union
from langchain.memory import ConversationBufferMemory

memory = ConversationBufferMemory(return_messages=True)

class State(TypedDict, total=False):
    question: str
    query: str
    result: Union[list, str]
    answer: str
    memory: ConversationBufferMemory

def get_bot_answer(question: str) -> str:
    if not question or not question.strip():
        return "Please ask a question so I can assist you."
    cleaned = question.strip().lower()
    if cleaned in ["hello", "hi", "hey"]:
        return "Hello! How can I assist you today?"
    
    graph = build_graph(State)
    state = {"question": question, "memory": memory}
    final_step = None
    for step in graph.stream(state):
        final_step = step

    if final_step and "generate_answer" in final_step:
        answer = final_step["generate_answer"].get("answer")
        if hasattr(answer, "content"):
            return answer.content
        else:
            return str(answer)
    return "No answer found."

def main():
    print(get_bot_answer("what is the price of rice cooker?"))

if __name__ == "__main__":
    main()
