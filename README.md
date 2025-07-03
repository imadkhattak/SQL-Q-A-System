# 🧠 SQL Q&A ChatBot

An interactive chatbot that converts natural language questions into SQL queries, fetches results from a MySQL database, and responds with clear, human-readable answers.

## 🚀 Features

- 💬 Ask natural language questions like:
  - "How many products are in stock?"
  - "What is the price of the washing machine?"
- 🤖 Uses **Gemini 2.5 (Free Version)** via LangChain and LangGraph to convert your question into SQL
- 🛢️ Executes queries on a MySQL database
- 🗣️ Model summarizes results in simple language
- 💻 Clean and modern chat UI (HTML, CSS, JS)
- 🔐 Safe SQL validation (read-only)

---

## 📁 Project Structure

```
Chat-Bot/
│
├── app.py            # Flask web server
├── main.py           # Core logic for running the chatbot
├── workflow.py       # Workflow steps for query generation, execution, and answer synthesis
├── graph_builder.py  # LangGraph graph construction
├── db.py             # Database connection utilities
├── LLM.py            # LLM initialization (Gemini 2.5)
├── prompts.py        # Prompt templates
├── static/
│   ├── style.css     # Chat UI styles
│   └── script.js     # Chat UI logic
├── templates/
│   └── index.html    # Main chat UI page
└── README.md         # Project documentation
```

---

## 🛠️ Tech Stack

- **Backend:** Python, Flask, LangChain, LangGraph
- **LLM:** Gemini 2.5 (Free Version)
- **Database:** MySQL
- **Frontend:** HTML, CSS, JavaScript

---

## ⚡ Quick Start

1. Clone the repo and install requirements.
2. Set up your MySQL database and update credentials in `db.py`.
3. Run the app:
   ```sh
   python app.py
   ```
4. Open [http://127.0.0.1:5000](http://127.0.0.1:5000) in your browser.

---

## 📄 License

MIT License