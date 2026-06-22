<div dir="ltr">
<div align="center">

# 🛠️ Setting Up Your Workspace: Your Tech Lab
### Environment Setup: Building Your Tech Lab

[🏠 Back to Home](../../../README.md) |[Previous Lesson: Humanizing Text](../03-research-writing/11-humanizing-text.md) |[Next Lesson: Data Analysis & Python >](13-data-analysis.md)

</div>

---

## 💻 Why Should We Code? (Overcoming Code Phobia)

So far, we've learned how to write text with AI. But the real power of AI isn't in "text"; it's in **"logic and computation."**
Many students in non-computer fields (like management, architecture, humanities, and medicine) are afraid of coding. When ChatGPT gives them a Python code block to analyze their data, they ignore it because **they don't know where to run it.**

> [!IMPORTANT]
> **You are not going to become a programmer!**
> Our goal is for you to be a **"code execution operator."** The AI writes the code, finds the bugs, and builds the algorithm. You just need to learn how to set up an environment and press the **Run** button.

To do this, we first need to get familiar with the types of files we'll be working with.

---

## 🗂️ The File Alphabet: What Are We Dealing With?

In this "tech lab," we're saying goodbye to heavy and slow software like SPSS, Excel, or Microsoft Word. We'll work directly with "raw files," which AI loves.

Before installing any tools, get to know these 3 crucial formats:

### 1. CSV Format (The Data Mine)
*   **What is it?** Short for *Comma-Separated Values*. It's just like Excel, but without the graphics and colors. It's just pure text where values are separated by commas (`,`).
*   **Why is it important?** Python and AI can read CSV files in a fraction of a second. In the next lesson, we'll learn how to convert raw data into CSV and use Python to clean it.

### 2. HTML / CSS / JS Format (The Interactive Display)
*   **What is it?** The languages that build web pages. HTML is the skeleton, CSS adds the style and color, and JS (JavaScript) makes it move.
*   **Why is it important?** Once we've analyzed our data, we won't be creating boring, static charts anymore. We'll ask the AI to create an HTML file where our charts are **interactive** (hover your mouse over them to see the numbers change!).

 ### 3. LaTeX Format (World-Class Papers)
 *   **What is it?** LaTeX (pronounced "Lah-tech") is a professional typesetting system. In top universities, no one writes engineering or math papers in Word.
 *   **Why is it important?** The AI can directly convert your entire paper or complex formulas into LaTeX code, giving you a super elegant and journal-quality PDF output.
 *   **How to use it?** You don't need to install any software on your system or in VS Code! The best and easiest way is to use the online website **[Overleaf.com](https://www.overleaf.com/)**. You copy the code there and get your PDF.
 
 [!WARNING]
 **Important Warning for Iranian Students:** Using LaTeX for **Persian texts** (due to issues with right-to-left alignment, Jalali calendar, and fonts) is extremely troublesome and not recommended at all! Use LaTeX only for **English** papers and assignments.

---

## ⚙️ Setting Up Your Arsenal: Installing the Tools

To open these files and run Python code, we only need **two free and very lightweight tools**.

*(If you already have these tools, you can skip to the next lesson).*




### 1. Python: The Machine's Processing Engine

Python is the language AI uses to write its analysis code. You don't need to learn its syntax; you just need to install it on your system so your Windows or Mac can "understand" these codes.

**Method 1: Graphical Install (Recommended for Beginners)**
1. Go to the official [Python.org](https://www.python.org/downloads/) website.
2. Download the version suitable for your operating system.
3. ⚠️ **Crucial Tip for Windows:** On the very first installation screen, make sure to check the box for **`Add Python to PATH`**. If you don't do this, none of your code will run!

**Method 2: Install via Terminal (The Fast, Hacker Way 💻)**
If you want to act like a pro, open your command line (CMD on Windows or Terminal on Mac) and copy/paste the following commands:
*   **Windows (using Winget):** `winget install Python.Python.3.12`
*   **Mac (using Homebrew):** `brew install python`

---

### 2. VS Code Editor: Your Workbench

You can't open Python code or HTML files in a simple Notepad or Word. You need a unified environment called an IDE. **Visual Studio Code** is the best, lightest, and most popular choice in the world.

1. Download and install it from the [official VS Code website](https://code.visualstudio.com/).
2. After installation, open the software and go to the **Extensions** section from the left-hand menu (the icon with four squares).
3. Search for and install these 3 essential extensions:
   *   **`Python`** (by Microsoft): To run the code the AI gives you.
   *   **`Live Server`** (by Ritwick Dey): To run HTML files and see interactive charts with a single click.
   *   **`LaTeX Workshop`** (Optional): If you want to render your journal-style papers in LaTeX format.

---


### 📦 Installing Python Libraries

A fresh Python installation is like a car with no features. To analyze data (CSV) and draw charts, we need to install specialized tools on it. This is only done through the **terminal**.

Don't be scared! In VS Code, go to the top menu, click `Terminal`, and then `New Terminal` (or use the shortcut `` Ctrl + ` ``). Now, copy the command below and press `Enter`:

```bash
pip install pandas matplotlib seaborn openpyxl
```

**What are these weird words?**
*   `pandas`: The most powerful tool for reading and cleaning CSV and Excel files.
*   `matplotlib` and `seaborn`: Tools for drawing charts and scientific graphics.
*   `openpyxl`: Allows Python to read native Excel files (`.xlsx`).

---

## 🗺️ Our Lab's Roadmap (What We'll Build)

Now that our workspace (VS Code + Python) is ready, we'll execute this magical workflow over the next 3 lessons:

1.  **Data Processing:** We'll ask the AI to write a Python script to clean and analyze our messy Excel/CSV files.
2.  **Visualization:** Instead of boring charts, we'll ask the AI for an **HTML + JS** file to create 3D and interactive charts in our browser.
3.  **Paper Generation (LaTeX):** Finally, we'll ask it to convert all our analyses and text into **LaTeX** format to get a PDF output worthy of a Harvard paper!

<div align="center">

**[Next Lesson: Data Analysis with Python and CSV (No-Code Magic) 👉](13-data-analysis.md)**

</div>

</div>