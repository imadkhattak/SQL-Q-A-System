from langchain.chat_models import init_chat_model

def get_llm():
    return init_chat_model(
        "gemini-2.0-flash",
        model_provider="google_genai",
        api_key="AIzaSyD7YVPBd0IQ7db92blqKJ77OzavF5xKiXk"
    )