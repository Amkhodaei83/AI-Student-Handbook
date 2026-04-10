<div align="center">

# 🤖 Automation with Python: Hiring a Robot Worker
### Python Automation: Let the Machine Do the Boring Work

[🏠 Back to Home](../../../README.md) |[Previous Lesson: The Magic of HTML](14-html-visualization.md) |[Next Lesson: Presentation Structure >](../05-presentations/16-presentation-structure.md)

</div>

---

## ⏳ A Crime Against Time (The Manual Labor Trap)

Imagine you've downloaded 100 PDF articles for your thesis, and all their filenames are a jumble of meaningless numbers, like `10.1016_j.eswa.2023.pdf`.
Now, your professor asks you to:
1. Rename the files to "Year_AuthorName".
2. Copy the Abstract from all 100 articles into a single Word file.

**The Traditional Student:** Puts on some calm music, makes a cup of tea, and spends 3 full days opening each file one by one, renaming it, and copying the text. (This is a waste of human life!)
**The Cyborg Student:** Gives a 3-line command to an AI, gets a Python script, and the system does the job in **2.5 seconds**.

You're not a programmer, but Python is the best "robot worker" for doing repetitive and boring tasks.

---

## 🛠️ 3 Awesome Missions for Your Python Robot

Python can talk directly to your Windows or Mac. Here are 3 examples of jobs you can give it:

### 1. Bulk Sorting and Renaming (Bulk File Management)
Your professor has given you 500 photos of lab cells. You can ask an AI to write code that:
*   Goes into the folder.
*   Reads all the photos and sorts them by the date they were taken.
*   Renames them from `Sample_001` to `Sample_500`.
*   Deletes any blurry or corrupted files (with a size of zero).

### 2. The PDF Extractor (The PDF Miner)
Python can read books. You can ask an AI to write code (using libraries like `PyPDF2` or `pdfplumber`) that:
*   Opens all 50 PDF files inside a folder.
*   Searches only the first page of each article to find the title and abstract.
*   Saves all of them neatly into an Excel file (`.csv`).

### 3. Gathering Data from the Web (Web Scraping)
Need to extract the prices of 1000 products from a website? Or do you want to copy the list of all professors in a department from the university website?
Instead of manually copy-pasting, tell an AI to write code with `BeautifulSoup` that takes a website link, reads the tables, and gives you a clean output.

---

## 🪄 An Engineered Prompt for Automation

When you ask an AI to write an automation script for you, you must be extremely clear about the "file execution environment." It doesn't have eyes to see where your files are!

> [!TIP]
> **Automation Prompt Template (Copy this):**
>
> `You are a Python Automation Engineer. I want to automate a repetitive and boring task on my own computer.`
>
> `[My Current System State]:`
> `I have a folder on my desktop at "C:/Users/Desktop/Papers". Inside this folder, there are about 100 PDF files.`
>
> `[What You Need to Do - Steps]:`
> `Write a Python script that:`
> `1. Enters this folder.`
> `2. Opens the files one by one and extracts only the first paragraph (the abstract).`
> `3. Saves the extracted texts, along with the filename, into a text file named 'results.txt' in the same folder.`
>
> `[Technical Constraints]:`
> `- I am not a programmer, so the code must be in a single, very simple file.`
> `- Be sure to use Try-Except blocks so that if a PDF file is corrupt, the program doesn't crash. It should print an error and move on to the next file.`
> `- At the beginning of your answer, tell me exactly which libraries I need to install in the terminal (pip install ...).`

---

## 🚨 The Golden Safety Rule: Don't Hit the Self-Destruct Button!

Python automation scripts are very powerful. If you tell it to "delete all files in this folder," it will destroy everything in a fraction of a second **without asking for your confirmation**, and the files won't even go to the Recycle Bin!

> [!WARNING]
> **The Backup Rule:**
> **Never** run AI-generated Python scripts on the "original and only copy" of your files.
> Always make a copy of some of your files (e.g., 10 of the articles) in a new folder named `Test_Folder`. Run the script on that folder first. If the result is exactly what you wanted, you can now run it on the main folder (with all 500 files).

---

## ⚙️ How to Run it in VS Code

As we learned in [Lesson 12 (Setting Up Your Workspace)](12-environment-setup.md):
1. Copy the code the AI gave you.
2. In VS Code, create a new file named `auto_task.py` and paste the code.
3. In the VS Code terminal, install the libraries the AI mentioned (e.g., `pip install PyPDF2`).
4. Press the **Run (▶)** button.
5. Lean back in your chair and watch the computer do 5 days of your work in 5 seconds! ☕

---

## 🏁 End of the Technical Phase: Entering the Spotlight

Up to this point, you have become a "research and technical beast." You can find articles in seconds, write them with advanced methodologies and a human tone, analyze messy data with Python, and automate repetitive tasks.

You now have top-notch content. But there's a harsh truth in academia: **If you can't present your work well, no one will care about your content.**

Ugly slides and boring speeches are the killers of the best research.
In the fifth (and final) phase of this handbook, we will learn how to use AI to create presentations that will captivate your professor and the judges.

<div align="center">

**[Next Section: The Stage & Presentation Structure (Goodbye, PowerPoint) 👉](../05-presentations/16-presentation-structure.md)**

</div>