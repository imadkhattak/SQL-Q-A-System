from langgraph.graph import START, StateGraph
from workflow import write_query, execute_query, generate_answer

def build_graph(State):
    graph_builder = StateGraph(State).add_sequence([
        write_query,
        execute_query,
        generate_answer,
    ])
    graph_builder.add_edge(START, "write_query")
    return graph_builder.compile()