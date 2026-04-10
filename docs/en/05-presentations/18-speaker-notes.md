<div align="center">

# 🗣️ Speaker Notes: Build Your Own Teleprompter
### Speaker Notes: Build Your Own Teleprompter

[🏠 Back to Home](../../../README.md) | [Previous Lesson: Building HTML Slides](17-html-slides.md) |[Resources & Course Wrap-up >](../06-resources/19-resources.md)

</div>

---

## 🎭 The Big Problem: Forgetting Your Lines on Stage

You've created amazing slides. Following the rules we learned, there's no long text on your slides; just keywords, big numbers, and engaging images.
But when you get on stage, stress makes you forget what story you were supposed to tell when you saw the keyword "52%"!

**The Amateur's Way:** They hold a sheet of A4 paper full of text and read from it (which breaks eye contact with the audience).
**The Professional's Way:** They use a **Teleprompter** or a Speaker Notes app on their phone or tablet that reminds them of key points (Cues) in a large font.

We're going to use AI to build a web-based teleprompter (another HTML file) that you can open on your phone on presentation day and deliver your speech like Steve Jobs.

---

## 🪄 The Prompt for Generating Speaker Dialogue (The Script Writer)

In lesson 17, we extracted the structure for our slides. Now, we need to tell the AI to write a "presentation dialogue" for each slide.

> [!TIP]
> **Prompt for Writing Notes (Copy this):**
>
> `Based on the slide table we created in the previous step, I want you to write "Speaker Notes" for each slide.`
>
> `[Constraints and Output Format]:`
> `1. The text shouldn't be formal. The tone must be completely conversational, energetic, and suitable for spoken language.`
> `2. For each slide, write a "stage direction" (Cue) in parentheses. (For example: "Look at the audience," "Point to the chart," "Pause here").`
> `3. **Bold** the important keywords so the speaker can remember the sentence at a glance.`
> `4. Specify the estimated speaking time for each slide (e.g., 1:30 to 2:00).`

---

## 📱 Building the Teleprompter with HTML Code (A Ready-Made Canvas)

To make your job easier, we've prepared a "blank but smart" template with HTML code for you. This file has the following features:
*   **Live Timer:** Shows you how long you've been talking so you don't run out of time.
*   **Font Size Slider:** If your eyesight isn't perfect, you can make the font on your phone bigger with one button.
*   **Focus Mode:** When you click on a section, the others dim so you don't lose your place.
*   **Live Edit Mode:** You can edit and save the text directly in the browser without any coding!

### 📥 Step 1: Get the Blank Canvas

Create a text file, copy the code below into it, and save it as `notes.html` (or download it directly from the link below).

📂 **[👉 View and Download the Blank Speaker Notes File](../../../assets/examples/speaker-note.html)**

### 🤖 Step 2: Fill the Canvas Using AI

Open the blank canvas file in a text editor (like Notepad or VS Code). Go to the end of the code (where it says `<!-- MAIN CONTENT AREA -->`).
Now, ask the AI to give you the text it generated in the previous step (the dialogues) in the exact card format of this application.

<table align="center" width="100%" border="0">
  <tr>
    <td width="100%">
      <b>🤖 Prompt for Injecting into Code (Copy this):</b><br><br>
      <code>I have an HTML application that displays notes as cards. Put the dialogues you wrote in the previous step into the following HTML code format:</code><br><br>
      <code>For each slide, create a block exactly like this one (replace the numbers and text):</code><br>
      <code>
&lt;div class="card" id="slide-[number]" onclick="focusCard(this)"&gt;<br>
&nbsp;&nbsp;&lt;div class="card-header"&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;span class="slide-badge"&gt;Slide [number]: [Slide Title]&lt;/span&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;span class="time-budget"&gt;[Time e.g., 1:30 - 3:00]&lt;/span&gt;<br>
&nbsp;&nbsp;&lt;/div&gt;<br>
&nbsp;&nbsp;&lt;div class="editable-content" data-id="content-[number]"&gt;<br>
&nbsp;&nbsp;&lt;span class="cue"&gt;[Stage Direction]&lt;/span&gt;[Speaker dialogue text... place important words inside &lt;span class="kw"&gt;word&lt;/span&gt; tags.]<br>
&nbsp;&nbsp;&lt;/div&gt;<br>
&lt;/div&gt;
      </code><br><br>
      <code>Just give me the code for these cards so I can copy them into my application myself.</code>
    </td>
  </tr>
</table>

### 🚀 Final Step: Practice and Perform

Paste the code the AI gives you into your `notes.html` file. Transfer the file to your phone (or send it to yourself via Telegram/email) and open it in your phone's browser.

Now, on presentation day:
1. You plug your flash drive into the university computer and project the holographic slides (from the previous lesson) on the screen.
2. You place your phone on the podium and start the timer.
3. You deliver the most precise and engaging dialogue with complete confidence!

---

## 🏆 The End of the Road: You Are No Longer Just a "Consumer"

If you've followed this handbook from the beginning to this point, you are no longer that student who would tell ChatGPT to "write a paper for me" and nervously hand in a robotic text to the professor.

You are now the **manager of a specialized AI team**:
*   Your researchers (Perplexity and Consensus) find credible articles.
*   Your data analyst (Python) reads Excel files.
*   Your front-end developer (HTML/Reveal.js) builds the best slides.
*   And you, as the **"System Architect,"** are the only one who knows how to connect these components to create a masterpiece.

<div align="center">

**[Final Section: Additional Resources and More Tools 👉](../06-resources/19-resources.md)**

</div>