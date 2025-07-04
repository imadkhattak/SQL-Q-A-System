from graph_builder import build_graph
from typing_extensions import TypedDict
from langchain.memory import ConversationBufferMemory

memory = ConversationBufferMemory(return_messages=True)

class State(TypedDict):
    question: str
    query: str
    result: int
    answer: str
    memory: ConversationBufferMemory

def get_bot_answer(question: str) -> str:
    graph = build_graph(State)
    final_step = None
    # Add memory to the state if your workflow supports it
    state = {"question": question, "memory": memory}
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
    # For CLI testing
    print(get_bot_answer("what is the price of rice cooker?"))

if __name__ == "__main__":
    main()