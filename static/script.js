async function sendMessage() {
  const input = document.getElementById("user-input");
  const message = input.value.trim();
  if (!message) return;

  appendMessage("user", message);
  input.value = "";

  // Show bot typing indicator
  showBotTyping();

  try {
    const response = await fetch("/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ question: message })
    });

    const data = await response.json();
    removeBotTyping();
    if (data.answer) {
      // Animate bot reply typing
      await appendBotMessageWithTyping(data.answer);
    } else {
      appendMessage("bot", "❌ Error: " + (data.error || "Unknown error"));
    }
  } catch (err) {
    removeBotTyping();
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

function showBotTyping() {
  removeBotTyping();
  const chatBox = document.getElementById("chat-box");
  const msg = document.createElement("div");
  msg.className = "chat-msg bot-msg bot-typing";
  msg.id = "bot-typing-indicator";
  msg.innerHTML = `<span class="typing-dots"><span>.</span><span>.</span><span>.</span></span> Typing...`;
  chatBox.appendChild(msg);
  chatBox.scrollTop = chatBox.scrollHeight;
}

function removeBotTyping() {
  const typing = document.getElementById("bot-typing-indicator");
  if (typing && typing.parentNode) typing.parentNode.removeChild(typing);
}

// Animate bot's reply as if typing
async function appendBotMessageWithTyping(text) {
  const chatBox = document.getElementById("chat-box");
  const msg = document.createElement("div");
  msg.className = "chat-msg bot-msg";
  chatBox.appendChild(msg);

  let i = 0;
  const typingSpeed = 13 + Math.random() * 10;
  while (i <= text.length) {
    msg.innerText = text.slice(0, i);
    chatBox.scrollTop = chatBox.scrollHeight;
    await new Promise(r => setTimeout(r, typingSpeed));
    i++;
  }
  msg.innerText = text;
  chatBox.scrollTop = chatBox.scrollHeight;
}

function handleKeyDown(e) {
  if (e.key === "Enter") {
    sendMessage();
  }
}