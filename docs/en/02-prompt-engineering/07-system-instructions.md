<div dir="ltr">
<div align="center">

# 🎛️ System Instructions: Build Your Personal AI Minion
### System Instructions: Build Your Personal AI Minion

[🏠 Back to Home](../../../README.md) |[Previous Lesson: Advanced Frameworks](06-advanced-frameworks.md) |[Next Lesson: Prompt Generation with AI >](08-prompt-generation.md)

</div>

---

## 🔁 The Problem: Repetition is for Amateurs

So far, we've learned that to get good answers, we need to give the AI a "Role" and set "Constraints" (the RISEN formula).
But do we really have to type *"You are a university professor, your tone should be academic, don't use clichés..."* every time we open a new chat?

**No.** This is both time-consuming and exhausting.
Even worse, when a chat gets long, the AI suffers from **"Context Drift."** This means after 20 messages, it suddenly forgets it was supposed to be a strict professor and turns back into the same cheerful, default chatbot!

---

## 🧠 The Solution: The Hidden Layer (System Instructions)

Professional platforms (like ChatGPT, Claude, and API platforms) have a section called **Custom Instructions** or **System Prompts**.
This section is the hidden layer of the AI's mind. The command you write here acts like a **constitution**. In every single message, before the AI answers you, it first reads this rule and never forgets it.

<table align="center" width="100%" border="0">
  <tr>
    <td width="50%" valign="top">
      <h3>🗣️ User Prompt (Regular Prompt)</h3>
      The request you type in the chat box.<br>
      <i>Example: "Summarize this text."</i><br>
      <b>Feature:</b> It's temporary and might be forgotten during the chat. It's like a "request to an employee."
    </td>
    <td width="50%" valign="top">
      <h3>⚙️ System Prompt</h3>
      The settings you save in the background.<br>
      <i>Example: "Always provide outputs in a table and never use the word 'nowadays'."</i><br>
      <b>Feature:</b> It's permanent and absolute. It's like an "employment contract and job description."
    </td>
  </tr>
</table>

---

## 🛠️ How to Enable It

*   **In ChatGPT:** Click on your profile picture (bottom left) ➔ `Customize ChatGPT` ➔ Enter your system instructions in the second box (How would you like ChatGPT to respond).
*   **In other tools (like Claude or APIs):** There is usually a box called `System Instructions` in the `Settings` or project area.

---

## 📂 Practical Scenarios: 3 Ready-to-Use Assistants for Students

Here are three copy-paste-ready examples you can put directly into your system settings to permanently turn your AI into an expert.

<details>
<summary><b>🎓 Scenario 1: "The Socratic Examiner" (Best for Exam Prep)</b> <i>(Click here)</i></summary>
<p><i>If you really want to learn a subject (not just copy the answer), put this instruction in the system. The AI will no longer give you ready-made answers; instead, it will challenge your mind by asking questions.</i></p>

```text
[Role]
You are a caring but extremely strict private tutor who teaches using the "Socratic method." Your behavior should be like a university professor during an oral exam.

[Rules]
1. Never start by teaching or lecturing at the beginning.
2. Never give me the direct and complete answer.
3. At each turn, ask only "one question" to see if I have understood the topic.
4. If my answer is "wrong": Do not give the correct answer. Provide a small hint and ask me to try again.
5. If my answer is "correct": Confirm it and immediately ask a more difficult and deeper question on the same topic.
6. Your tone must be academic, serious, but encouraging. Always write technical terms in English.
```
</details>

<details>
<summary><b>✍️ Scenario 2: "The Ruthless Editor" (Best for Thesis Writing)</b> <i>(Click here)</i></summary>
<p><i>If you are writing a paper and want your text to meet ISI standards, these settings will turn the AI into a strict editor.</i></p>

```text
[Role]
You are a senior editor for a scientific journal (Peer-Reviewer) with 20 years of experience. You hate wordiness, vague sentences, and "fluff."

[Rules]
1. When I send you a text, do not rewrite it immediately. First, ruthlessly point out its logical, structural, and grammatical flaws in a bulleted list.
2. Find and strike through cliché phrases (like "it is worth noting," "in today's world").
3. Replace colloquial words with precise academic equivalents.
4. Vary the sentence lengths (humanize the text with "burstiness").
5. After providing the critique, present the final, edited version of the paragraph. Your output must be 100% ready to be copied into a formal paper.
```
</details>

<details>
<summary><b>💻 Scenario 3: "The Senior Programmer" (Best for Coding Projects)</b> <i>(Click here)</i></summary>
<p><i>Stop copying code you don't understand. This command teaches you "why" the code works, turning you from a typist into a software engineer.</i></p>

```text
[Role]
You are a senior software engineer at Google, and I am a junior programmer. Your job is not to code for me; your job is to improve my engineering skills.

[Rules]
1. If I ask you for code, don't just give the final solution. First, explain the logic (algorithm) in 2 lines and explain "why" this is the most efficient method.
2. Always add comments in simple English to the code to explain the logic of complex lines.
3. If the code I wrote has a security vulnerability or is slow (e.g., I used a nested O(n^2) loop), criticize it constructively and show the optimized version (O(n)).
4. Always present the code in formatted Markdown Code Blocks.
```
</details>

---

> [!IMPORTANT]
> **Security Tip:**
> Don't forget to clear or change these settings when your project or course is finished! If the "Ruthless Editor" setting is on and you ask it to write a friendly email, it will edit your email in the style of an ISI paper!

## 🚀 Hold On: Do We Have to Memorize All This?

So far, we've learned rules, frameworks (RISEN), and system settings. But what if I told you that you don't even need to write these long prompts yourself?
In the next lesson, we'll learn the most powerful technique in this entire handbook: **using the AI itself to generate prompts!** (Hacking the machine with the machine).

<div align="center">

**[Next Lesson: Meta-Prompting (Prompt Generation with AI) 👉](08-prompt-generation.md)**

</div>

</div>