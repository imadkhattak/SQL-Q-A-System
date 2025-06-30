async function sendMessage() {
  const input = document.getElementById("user-input");
  const message = input.value.trim();
  if (!message) return;

  appendMessage("user", message);
  input.value = "";

  try {
    const response = await fetch("/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ question: message })
    });

    const data = await response.json();
    if (data.answer) {
      appendMessage("bot", data.answer);
    } else {
      appendMessage("bot", "❌ Error: " + (data.error || "Unknown error"));
    }
  } catch (err) {
    appendMessage("bot", "❌ Server error.");
  }
}

function appendMessage(sender, text) {
  const chatBox = document.getElementById("chat-box");
  const msg = document.createElement("div");
  msg.className = `chat-msg ${sender === "user" ? "user-msg" : "bot-msg"}`;
  msg.innerText = text;
  chatBox.appendChild(msg);
  chatBox.scrollTop = chatBox.scrollHeight;
}
