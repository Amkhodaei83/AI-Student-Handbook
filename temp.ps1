# ============ GROUP 1: Variables Block ============
# Define all project-specific values here. Edit these if necessary before running.
# These variables will remain in scope for the entire runbook execution.

# The GitHub username or organization name that owns the repository
$repoOwner     = "Amkhodaei83"           

# The exact name of the repository
$repoName      = "ai-student-handbook"   

# Keyword-rich SEO description of the project (extracted from the manifesto)
$repoDesc      = "The AI Student Handbook - A modern guide to using AI for academic research, writing, and technical automation."

# The primary URL for the project (can be GitHub Pages, a live demo, or the repo itself)
$homepage      = "https://github.com/$repoOwner/$repoName"

# The open-source license type (MIT chosen based on project context/badges)
$license       = "MIT"               

# The default branch for the repository
$defaultBranch = "main"

# SEO tags to improve discoverability on GitHub Explore and search engines.
# Rationale: Covers the domain (ai), target audience (student), core skill (prompt-engineering), and language (persian).
$topics        = @("ai", "student-toolkit", "prompt-engineering", "academic-research", "python-automation", "persian")

# ============ GROUP 2: Repository Identity & SEO Metadata ============
# Configure the core repository metadata using the variables defined above.

# Set the repository description, homepage, visibility, and default branch
gh repo edit "$repoOwner/$repoName" --description $repoDesc --homepage $homepage --visibility public --default-branch $defaultBranch

# Loop through the SEO topics array and apply each one to the repository
foreach ($topic in $topics) {
    # Adding topics one by one ensures the GitHub search index registers them properly
    gh repo edit "$repoOwner/$repoName" --add-topic $topic
}

# ============ GROUP 3: Feature Toggles & Merge Strategy ============
# Configure repository features and pull request merge behaviors for a professional workflow.

# Enable issues and discussions for community interaction, disable wiki and projects to centralize docs in the repo code
gh repo edit "$repoOwner/$repoName" --enable-issues=true --enable-wiki=false --enable-projects=false --enable-discussions=true

# Enforce squash merging to keep the main branch history clean and linear
gh repo edit "$repoOwner/$repoName" --enable-squash-merge=true 

# Disable rebase and standard merge commits to prevent cluttered git history
gh repo edit "$repoOwner/$repoName" --enable-rebase-merge=false --enable-merge-commit=false

# Enable auto-merge for pull requests (allows PRs to merge automatically once CI passes and approvals are met)
gh repo edit "$repoOwner/$repoName" --enable-auto-merge=true

# Automatically delete head branches after their pull requests are merged to keep the repository tidy
gh repo edit "$repoOwner/$repoName" --delete-branch-on-merge=true



# ============ GROUP 4: Community Standard Files ============
# Generate the foundational community and legal files for the open-source project.
# These establish terms of use, behavior expectations, and contribution rules.

# Fetch the MIT License from the GitHub API, replace placeholders with actual data, and write to LICENSE file
$licenseData = gh api licenses/mit | ConvertFrom-Json | Select-Object -ExpandProperty body
$currentYear = (Get-Date).Year
$licenseData = $licenseData -replace "\[year\]", $currentYear -replace "\[fullname\]", $repoOwner
$licenseData | Set-Content -Path "LICENSE" -Encoding UTF8

# Create a professional Code of Conduct using the Contributor Covenant v2.1
$codeOfConduct = @"
# Contributor Covenant Code of Conduct

## Our Pledge

We as members, contributors, and leaders pledge to make participation in our
community a harassment-free experience for everyone, regardless of age, body
size, visible or invisible disability, ethnicity, sex characteristics, gender
identity and expression, level of experience, education, socio-economic status,
nationality, personal appearance, race, caste, color, religion, or sexual
identity and orientation.

We pledge to act and interact in ways that contribute to an open, welcoming,
diverse, inclusive, and healthy community.

## Our Standards

Examples of behavior that contributes to a positive environment for our
community include:

* Demonstrating empathy and kindness toward other people
* Being respectful of differing opinions, viewpoints, and experiences
* Giving and gracefully accepting constructive feedback
* Accepting responsibility and apologizing to those affected by our mistakes,
  and learning from the experience
* Focusing on what is best not just for us as individuals, but for the overall
  community

Examples of unacceptable behavior include:

* The use of sexualized language or imagery, and sexual attention or advances of
  any kind
* Trolling, insulting or derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others' private information, such as a physical or email address,
  without their explicit permission
* Other conduct which could reasonably be considered inappropriate in a
  professional setting

## Enforcement Responsibilities

Community leaders are responsible for clarifying and enforcing our standards of
acceptable behavior and will take appropriate and fair corrective action in
response to any behavior that they deem inappropriate, threatening, offensive,
or harmful.

Community leaders have the right and responsibility to remove, edit, or reject
comments, commits, code, wiki edits, issues, and other contributions that are
not aligned to this Code of Conduct, and will communicate reasons for moderation
decisions when appropriate.

## Scope

This Code of Conduct applies within all community spaces, and also applies when
an individual is officially representing the community in public spaces.
Examples of representing our community include using an official e-mail address,
posting via an official social media account, or acting as an appointed
representative at an online or offline event.

## Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be
reported to the community leaders responsible for enforcement at
conduct@$($repoOwner).github.io (or directly via GitHub issues/discussions).
All complaints will be reviewed and investigated promptly and fairly.

All community leaders are obligated to respect the privacy and security of the
reporter of any incident.

## Enforcement Guidelines

Community leaders will follow these Community Impact Guidelines in determining
the consequences for any action they deem in violation of this Code of Conduct:

### 1. Correction
**Community Impact**: Use of inappropriate language or other behavior deemed
unprofessional or unwelcome in the community.
**Consequence**: A private, written warning from community leaders, providing
clarity around the nature of the violation and an explanation of why the
behavior was inappropriate. A public apology may be requested.

### 2. Warning
**Community Impact**: A violation through a single incident or series of
actions.
**Consequence**: A warning with consequences for continued behavior. No
interaction with the people involved, including unsolicited interaction with
those enforcing the Code of Conduct, for a specified period of time.

### 3. Temporary Ban
**Community Impact**: A serious violation of community standards, including
sustained inappropriate behavior.
**Consequence**: A temporary ban from any sort of interaction or public
communication with the community for a specified period of time.

### 4. Permanent Ban
**Community Impact**: Demonstrating a pattern of violation of community
standards, including sustained inappropriate behavior, harassment of an
individual, or aggression toward or disparagement of classes of individuals.
**Consequence**: A permanent ban from any sort of public interaction within the
community.

## Attribution

This Code of Conduct is adapted from the [Contributor Covenant][homepage],
version 2.1, available at[https://www.contributor-covenant.org/version/2/1/code_of_conduct.html][v2.1].

[homepage]: https://www.contributor-covenant.org
[v2.1]: https://www.contributor-covenant.org/version/2/1/code_of_conduct.html
"@
Set-Content -Path "CODE_OF_CONDUCT.md" -Value $codeOfConduct -Encoding UTF8

# Create a comprehensive Contributing guide tailored to the AI Student Handbook project
$contributingGuide = @"
# Contributing to the AI Student Handbook

First off, thank you for considering contributing to the AI Student Handbook! 
It's people like you that make this toolkit an incredible resource for Persian-speaking students.

## 🚀 How to Contribute

### 1. Fork and Clone
1. **Fork** the repository on GitHub.
2. **Clone** your fork locally:
   \`\`\`bash
   git clone https://github.com/YOUR_USERNAME/$repoName.git
   cd $repoName
   \`\`\`
3. **Add the upstream** remote to keep your fork in sync:
   \`\`\`bash
   git remote add upstream https://github.com/$repoOwner/$repoName.git
   \`\`\`

### 2. Branch Naming Conventions
Create a dedicated branch for your work. Use the following prefixes to keep things organized:
- \`feature/\` for new tutorials, AI prompts, or tools (e.g., \`feature/add-deepseek-guide\`)
- \`fix/\` for correcting typos, broken links, or formatting issues (e.g., \`fix/markdown-rendering\`)
- \`docs/\` for structural documentation updates

\`\`\`bash
git checkout -b feature/your-feature-name
\`\`\`

### 3. Making Changes & Local Testing
- **Markdown**: We use GitHub Flavored Markdown. Please use a Markdown previewer (like the one built into VS Code) to ensure your formatting, Mermaid.js diagrams, and tables render correctly.
- **HTML/CSS/JS**: If you are adding visual examples to the \`assets\` folder, open them in a modern web browser to ensure they work without throwing console errors.
- **Python**: Ensure any automation scripts are tested locally using Python 3.10+ and do not contain destructive operations.

### 4. Commit Message Format
We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification. This helps us auto-generate release notes.
- \`feat: add advanced prompt engineering framework\`
- \`fix: resolve broken image link in roadmap\`
- \`docs: update readme with new project structure\`

### 5. Pull Request Process
1. Push your branch to your fork: \`git push origin feature/your-feature-name\`
2. Open a Pull Request against the \`$defaultBranch\` branch of the upstream repository.
3. Fill out the PR template completely.
4. Ensure all CI status checks pass.
5. Wait for a maintainer to review your PR. We will try to review within 48 hours!

## 👩‍💻 Code Style Requirements
- **Language**: The primary language of the handbook is Persian (Farsi). Please maintain a professional, engaging, and clear tone.
- **Direction**: Ensure HTML wrappers like \`<div dir="rtl">\` are properly closed.
- **Visuals**: Use Emojis meaningfully as visual anchors, but do not overuse them.
- **References**: Always provide links to official AI tools or repositories being referenced.

Thank you for helping us empower the next generation of students!
"@
Set-Content -Path "CONTRIBUTING.md" -Value $contributingGuide -Encoding UTF8



# ============ GROUP 5: GitHub Issue & PR Templates ============
# Standardize how contributors report bugs and request features to ensure high-quality, actionable reports.
# Create the standard GitHub directory structure for templates.

# Ensure the issue template directory exists
New-Item -ItemType Directory -Force -Path ".github/ISSUE_TEMPLATE"

# Create the Bug Report template
$bugTemplate = @"
---
name: Bug Report
about: Report an issue with a tutorial, broken link, or non-functional AI prompt
title: '[BUG] '
labels: bug
assignees: ''
---

## 🐛 Bug Description
A clear and concise description of what the bug is. (e.g., The prompt provided in section 08-prompt-generation.md results in a hallucination, or the HTML execution fails).

## 🔍 Steps to Reproduce
Steps to reproduce the behavior:
1. Go to '...'
2. Copy prompt '...'
3. Paste into 'ChatGPT 4o / Claude 3.5'
4. See error

## 🎯 Expected Behavior
A clear and concise description of what you expected to happen.

## 🖥️ Environment (if applicable)
 - OS: [e.g. Windows, Mac]
 - Browser: [e.g. Chrome, Safari]
 - AI Model Used:[e.g. GPT-4o, Claude 3.5 Sonnet, Gemini 3 Pro]
 - Local IDE: [e.g. VS Code]

## 📸 Screenshots
If applicable, add screenshots to help explain your problem.

## 📝 Additional Context
Add any other context about the problem here.
"@
Set-Content -Path ".github/ISSUE_TEMPLATE/bug_report.md" -Value $bugTemplate -Encoding UTF8

# Create the Feature Request template
$featureTemplate = @"
---
name: Feature Request
about: Suggest a new AI tool, prompt framework, or tutorial for the handbook
title: '[FEATURE] '
labels: enhancement
assignees: ''
---

## 🚀 Is your feature request related to a problem? Please describe.
A clear and concise description of what the problem is. Ex. I'm always frustrated when I have to use [Tool] for [Task].

## 💡 Describe the solution you'd like
A clear and concise description of what you want to happen. For example, a new tutorial on how to use NotebookLM for qualitative research.

## 🔄 Describe alternatives you've considered
A clear and concise description of any alternative solutions or features you've considered.

## 📝 Additional Context
Add any other context, links to new AI tools, or screenshots about the feature request here.
"@
Set-Content -Path ".github/ISSUE_TEMPLATE/feature_request.md" -Value $featureTemplate -Encoding UTF8

# Create the Pull Request Template in the .github root directory
$prTemplate = @"
## 📝 Description
Please include a summary of the change and which issue is fixed. Include relevant motivation and context.

Fixes # (issue number)

## 🏷️ Type of change
Please delete options that are not relevant.
- [ ] 🐛 Bug fix (non-breaking change which fixes an issue)
- [ ] 🚀 New feature (non-breaking change which adds functionality)
- [ ] 📚 Documentation update (typos, new markdown files, formatting)
- [ ] 🛠️ Tooling or workflow update

## ✅ Checklist:
- [ ] My code/markdown follows the style guidelines of this project.
- [ ] I have performed a self-review of my own work.
- [ ] I have commented my code/scripts, particularly in hard-to-understand areas.
- [ ] Tests added/updated (if applicable).
- [ ] Documentation updated (links are relative and working).
- [ ] No breaking changes (or clearly noted).

## 🖼️ Screenshots (if UI/HTML changes were made)
[Drop screenshots here]
"@
Set-Content -Path ".github/PULL_REQUEST_TEMPLATE.md" -Value $prTemplate -Encoding UTF8



# ============ GROUP 6: GitHub Actions Workflows ============
# Configure CI/CD pipelines to automatically validate contributions and manage releases.
# Since this is a handbook/documentation repository with Python and HTML examples, 
# our CI will focus on Markdown linting and Python syntax validation.

# Ensure the workflows directory exists
New-Item -ItemType Directory -Force -Path ".github/workflows"

# Create the CI workflow (Continuous Integration)
# This runs on every push to main and every Pull Request to ensure quality.
$ciWorkflow = @"
name: CI Validation

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches:[ "main" ]

jobs:
  validate:
    name: Validate Content and Code
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - name: Check Python Syntax
        # Validates that any Python scripts added to the repository have valid syntax
        run: |
          find . -name "*.py" -exec python -m py_compile {} +
          echo "Python syntax check passed."

      - name: Validate Markdown
        # Uses standard markdownlint to check formatting. 
        # continue-on-error is true initially so we don't block PRs strictly on formatting.
        uses: DavidAnson/markdownlint-cli2-action@v16
        with:
          globs: |
            **/*.md
            !node_modules/**
        continue-on-error: true

      - name: Report Success
        run: echo "Validation complete! Repository is in good health."
"@
Set-Content -Path ".github/workflows/ci.yml" -Value $ciWorkflow -Encoding UTF8

# Create the Release workflow (Continuous Deployment)
# This automatically generates a GitHub Release with changelogs when a new version tag (e.g., v1.0.0) is pushed.
$releaseWorkflow = @"
name: Publish Release

on:
  push:
    tags:
      - 'v*.*.*'

permissions:
  contents: write

jobs:
  release:
    name: Create GitHub Release
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Create Release
        uses: softprops/action-gh-release@v2
        with:
          generate_release_notes: true
          draft: false
          prerelease: false
"@
Set-Content -Path ".github/workflows/release.yml" -Value $releaseWorkflow -Encoding UTF8

# Create an Issue Labeler workflow (Optional but highly professional)
# Automatically assigns labels to issues based on the template used.
$labelerWorkflow = @"
name: Auto Label Issues

on:
  issues:
    types: [opened]

jobs:
  label:
    runs-on: ubuntu-latest
    permissions:
      issues: write
    steps:
      - name: Label Bug
        if: startsWith(github.event.issue.title, '[BUG]')
        uses: actions/github-script@v7
        with:
          script: |
            github.rest.issues.addLabels({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              labels: ['bug']
            })
            
      - name: Label Feature
        if: startsWith(github.event.issue.title, '[FEATURE]')
        uses: actions/github-script@v7
        with:
          script: |
            github.rest.issues.addLabels({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              labels: ['enhancement']
            })
"@
Set-Content -Path ".github/workflows/auto-label.yml" -Value $labelerWorkflow -Encoding UTF8


# ============ GROUP 7: Branch Protection Rules ============
# Enforce quality standards and prevent accidental breakage on the default branch.
# This requires CI checks to pass and PRs to be reviewed before merging.

# Create a CODEOWNERS file to automatically request reviews from the repository owner
Set-Content -Path ".github/CODEOWNERS" -Value "* @$repoOwner" -Encoding UTF8

# Define the branch protection rules using a JSON payload
# - strict: true ensures branches are up to date before merging
# - contexts: references the exact job name from our CI workflow in GROUP 6
$protectionPayload = @"
{
  "required_status_checks": {
    "strict": true,
    "contexts": [
      "Validate Content and Code"
    ]
  },
  "enforce_admins": true,
  "required_pull_request_reviews": {
    "dismiss_stale_reviews": true,
    "require_code_owner_reviews": true,
    "required_approving_review_count": 1
  },
  "restrictions": null
}
"@

# Apply the branch protection rules via the GitHub REST API
$protectionPayload | gh api -X PUT "repos/$repoOwner/$repoName/branches/$defaultBranch/protection" --input -

# ============ GROUP 8: GitHub Environments ============
# Create isolated environments to safely manage the deployment lifecycle of the project's web assets.

# Create a Staging environment for testing HTML/Python outputs before going live
gh api -X PUT "repos/$repoOwner/$repoName/environments/staging" | Out-Null

# Create a Production environment for the live handbook/pages
gh api -X PUT "repos/$repoOwner/$repoName/environments/production" | Out-Null

# Configure a wait timer for the production environment to enforce a deployment gate (e.g., 10 minutes)
# Rationale: Provides a professional buffer window to cancel a production deployment if a last-minute issue is spotted.
$prodEnvPayload = @"
{
  "wait_timer": 600
}
"@
$prodEnvPayload | gh api -X PUT "repos/$repoOwner/$repoName/environments/production" --input -

# ============ GROUP 9: Secrets & CI/CD Variables ============
# Pre-configure repository secrets and variables.
# Since this toolkit focuses on AI API interactions (OpenAI, Gemini, DeepSeek), 
# we set up placeholders for the keys students might use in automated CI scripts.
# NOTE: Replace the placeholder values with actual keys before uncommenting and running.

# Set your AI API secrets — uncomment and replace the values before running
# gh secret set OPENAI_API_KEY --body "sk-your-openai-api-key" --repo "$repoOwner/$repoName"
# gh secret set GEMINI_API_KEY --body "AIza-your-gemini-api-key" --repo "$repoOwner/$repoName"
# gh secret set DEEPSEEK_API_KEY --body "sk-your-deepseek-api-key" --repo "$repoOwner/$repoName"

# Set non-sensitive environment variables available to GitHub Actions
# We set the Python version explicitly since the handbook relies heavily on Python automation
gh variable set PYTHON_VERSION --body "3.12" --repo "$repoOwner/$repoName"


# ============ GROUP 10: Release Tagging & Publishing ============
# Baseline the repository by cutting the first official release.
# This triggers the release.yml GitHub Action we set up in GROUP 6.

# Create an annotated git tag for version 1.0.0
git tag -a v1.0.0 -m "Initial release of The AI Student Handbook"

# Push the tag to the remote repository
git push origin v1.0.0

# Create an official GitHub Release with auto-generated release notes
gh release create v1.0.0 --generate-notes --title "$repoName v1.0.0" --notes "Initial public release of the AI Student Handbook, featuring complete guidelines for AI-assisted research, prompt engineering, Python automation, and HTML presentations."

# ============ GROUP 11: Webhooks ============
# Webhooks allow GitHub to notify external services (like Discord or Slack) when events happen.
# No immediate integrations are required for this handbook, so here is the template for future use.

# Uncomment and fill in your webhook URL to automatically ping a Discord/Slack channel on push:
<#
$webhookPayload = @"
{
  "name": "web",
  "active": true,
  "events":[
    "push",
    "pull_request"
  ],
  "config": {
    "url": "https://your-external-service.com/webhook",
    "content_type": "json",
    "insecure_ssl": "0"
  }
}
"@
$webhookPayload | gh api -X POST "repos/$repoOwner/$repoName/hooks" --input -
#>

# ============ GROUP 12: Commit & Push All Generated Files ============
# Add, commit, and push all the foundational files we just generated to the default branch.

# Stage all newly created directories and files (.github, LICENSE, CODE_OF_CONDUCT, CONTRIBUTING)
git add .

# Display the current status so the user can verify what is about to be committed
git status

# Commit the changes using Conventional Commits format, itemizing the added standards
git commit -m "chore: initialize repository configuration and community standards

- Add LICENSE ($license)
- Add CODE_OF_CONDUCT.md (Contributor Covenant v2.1)
- Add CONTRIBUTING.md with development guidelines
- Add GitHub Issue and PR templates (.github/ISSUE_TEMPLATE)
- Add CI/CD workflows for validation and releases (.github/workflows)
- Add CODEOWNERS"

# Push the newly created configuration files up to the remote default branch
git push origin $defaultBranch

# ============ GROUP 13: Verification & Status Report ============
# Run a final diagnostic check to ensure all API calls and git commands applied successfully.

Write-Host "`n===== REPOSITORY CONFIGURATION REPORT =====" -ForegroundColor Cyan

# Confirm repo metadata (Description, homepage, topics, and visibility)
Write-Host "`n[1/6] Repository Metadata:" -ForegroundColor Yellow
gh repo view "$repoOwner/$repoName" --json name,description,homepageUrl,topics,visibility

# Confirm branch protection is active on the default branch
Write-Host "`n[2/6] Branch Protection Rules:" -ForegroundColor Yellow
gh api "repos/$repoOwner/$repoName/branches/$defaultBranch/protection" | 
  ConvertFrom-Json | Select-Object enforce_admins, required_pull_request_reviews

# Confirm secrets and variables exist (values are hidden)
Write-Host "`n[3/6] Repository Secrets & Variables:" -ForegroundColor Yellow
gh secret list --repo "$repoOwner/$repoName"
gh variable list --repo "$repoOwner/$repoName"

# Confirm environments were created
Write-Host "`n[4/6] Deployment Environments:" -ForegroundColor Yellow
gh api "repos/$repoOwner/$repoName/environments" | 
  ConvertFrom-Json | Select-Object -ExpandProperty environments | 
  Select-Object name, protection_rules

# Confirm workflows are registered
Write-Host "`n[5/6] GitHub Actions Workflows:" -ForegroundColor Yellow
gh workflow list --repo "$repoOwner/$repoName"

# Confirm latest release
Write-Host "`n[6/6] Latest GitHub Release:" -ForegroundColor Yellow
gh release view --repo "$repoOwner/$repoName"

Write-Host "`n===== CONFIGURATION COMPLETE =====" -ForegroundColor Green