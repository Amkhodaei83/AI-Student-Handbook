# Contributing to the AI Student Handbook

First off, thank you for considering contributing to the AI Student Handbook! 
It's people like you that make this toolkit an incredible resource for Persian-speaking students.

## 🚀 How to Contribute

### 1. Fork and Clone
1. **Fork** the repository on GitHub.
2. **Clone** your fork locally:
   \\\ash
   git clone https://github.com/YOUR_USERNAME/ai-student-handbook.git
   cd ai-student-handbook
   \\\
3. **Add the upstream** remote to keep your fork in sync:
   \\\ash
   git remote add upstream https://github.com/Amkhodaei83/ai-student-handbook.git
   \\\

### 2. Branch Naming Conventions
Create a dedicated branch for your work. Use the following prefixes to keep things organized:
- \eature/\ for new tutorials, AI prompts, or tools (e.g., \eature/add-deepseek-guide\)
- \ix/\ for correcting typos, broken links, or formatting issues (e.g., \ix/markdown-rendering\)
- \docs/\ for structural documentation updates

\\\ash
git checkout -b feature/your-feature-name
\\\

### 3. Making Changes & Local Testing
- **Markdown**: We use GitHub Flavored Markdown. Please use a Markdown previewer (like the one built into VS Code) to ensure your formatting, Mermaid.js diagrams, and tables render correctly.
- **HTML/CSS/JS**: If you are adding visual examples to the \ssets\ folder, open them in a modern web browser to ensure they work without throwing console errors.
- **Python**: Ensure any automation scripts are tested locally using Python 3.10+ and do not contain destructive operations.

### 4. Commit Message Format
We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification. This helps us auto-generate release notes.
- \eat: add advanced prompt engineering framework\
- \ix: resolve broken image link in roadmap\
- \docs: update readme with new project structure\

### 5. Pull Request Process
1. Push your branch to your fork: \git push origin feature/your-feature-name\
2. Open a Pull Request against the \$defaultBranch\ branch of the upstream repository.
3. Fill out the PR template completely.
4. Ensure all CI status checks pass.
5. Wait for a maintainer to review your PR. We will try to review within 48 hours!

## 👩‍💻 Code Style Requirements
- **Language**: The primary language of the handbook is Persian (Farsi). Please maintain a professional, engaging, and clear tone.
- **Direction**: Ensure HTML wrappers like \<div dir="rtl">\ are properly closed.
- **Visuals**: Use Emojis meaningfully as visual anchors, but do not overuse them.
- **References**: Always provide links to official AI tools or repositories being referenced.

Thank you for helping us empower the next generation of students!
