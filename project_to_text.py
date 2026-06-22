import os
import subprocess
import json

# --- CONFIGURATION ---

OUTPUT_FILE = "project_full_context.txt"
MAX_FILE_SIZE_BYTES = 50 * 1024  # 50KB limit per file (Prevents massive dumps)

# 1. Directories to Exclude (Noise reduction and menu omission)
IGNORE_DIRS = {
    'node_modules', '.git', '.idea', '.vscode', 'dist', 'build', 
    'coverage', '__pycache__', 'venv', 'env', 'target', 'bin', 'obj',
    '.gradle', '.next', 'db', 'legacy'  # Added 'db' to exclude list
}

# 2. Files to Explicitly Ignore
IGNORE_FILES = {
    'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 
    '.DS_Store', 'thumbs.db', OUTPUT_FILE, os.path.basename(__file__)
}

# 3. Categorized Extensions
INCLUDE_EXTENSIONS = {
    # Web / React / TS
    '.js', '.jsx', '.ts', '.tsx', '.json', '.html', '.css', '.scss', '.sass',
    # Java / JavaFX
    '.java', '.fxml', '.properties', '.gradle', '.xml',
    # C / C++
    '.c', '.cpp', '.h', '.hpp', '.cc',
    # Configuration / Ops / Docs
    '.md', '.gitignore', '.env.example', '.yml', '.yaml', '.txt', '.conf',

    '.php', '.env'
}

# 4. Critical Build Files (Always include these regardless of extension)
CRITICAL_FILENAMES = {
    'Dockerfile', 'Makefile', 'CMakeLists.txt', 'pom.xml', 
    'build.gradle', 'package.json', 'tsconfig.json'
}

def select_target_directory():
    """
    Dynamically lists directories in the current working directory, 
    excluding those in IGNORE_DIRS, and prompts the user to select which folder to process.
    """
    current_dir = os.getcwd()
    
    # Read and filter subdirectories in the current directory
    try:
        entries = sorted(os.listdir(current_dir))
        subdirs = [
            d for d in entries 
            if os.path.isdir(os.path.join(current_dir, d)) and d not in IGNORE_DIRS
        ]
    except Exception as e:
        print(f"Error reading root directories: {e}")
        subdirs = []

    # Map the directories to selection options dynamically
    options = {}
    index = 1
    for folder in subdirs:
        options[str(index)] = (folder, folder)
        index += 1
        
    # Append the option for the entire project
    full_project_option_key = str(index)
    options[full_project_option_key] = ("Full Project (All except excluded)", ".")
    
    print("\nSelect the target folder to process:")
    for key, (label, _) in options.items():
        print(f"  [{key}] {label}")
        
    choice = input(f"\nEnter choice (1-{index}) [Default: {full_project_option_key}]: ").strip()
    if not choice:
        choice = full_project_option_key
        
    if choice in options:
        folder_name = options[choice][1]
        target_path = os.path.join(current_dir, folder_name)
        
        # If target path does not exist, fallback to current working directory
        if not os.path.exists(target_path):
            print(f"\n[Warning]: Folder '{folder_name}' not found.")
            print("Defaulting to full project scan instead.\n")
            return os.path.abspath(current_dir)
            
        return os.path.abspath(target_path)
    else:
        print("\nInvalid choice. Defaulting to full project scan.\n")
        return os.path.abspath(current_dir)

def get_github_repo_info():
    """
    Uses GitHub CLI (gh) to fetch repository details.
    """
    print("Attempting to fetch GitHub Metadata via CLI...")
    try:
        result = subprocess.run(
            ['gh', 'repo', 'view', '--json', 'name,description,url,homepageUrl,repositoryTopics,languages'],
            capture_output=True,
            text=True
        )
        
        if result.returncode != 0:
            return "GitHub Context: [GitHub CLI ('gh') not configured or not a git repo. Skipping.]\n"

        data = json.loads(result.stdout)
        
        info = "GITHUB REPOSITORY CONTEXT:\n"
        info += "=" * 30 + "\n"
        info += f"Name:        {data.get('name', 'N/A')}\n"
        info += f"Description: {data.get('description', 'N/A')}\n"
        info += f"URL:         {data.get('url', 'N/A')}\n"
        info += f"Homepage:    {data.get('homepageUrl', 'N/A')}\n"
        
        topics = data.get('repositoryTopics', [])
        topic_names = [t['name'] for t in topics] if topics else []
        info += f"Topics/Tags: {', '.join(topic_names)}\n"
        
        langs = data.get('languages', [])
        lang_names = [l['node']['name'] for l in langs] if langs else []
        info += f"Languages:   {', '.join(lang_names)}\n"
        info += "=" * 30 + "\n\n"
        
        return info

    except FileNotFoundError:
        return "GitHub Context: [GitHub CLI not installed. Skipping.]\n\n"
    except Exception as e:
        return f"GitHub Context: [Error fetching data: {e}]\n\n"

def is_binary_file(filepath):
    """
    Detects binary files by checking for null bytes in the first chunk.
    """
    try:
        with open(filepath, 'rb') as f:
            chunk = f.read(1024)
            if b'\0' in chunk:
                return True
    except:
        return True
    return False

def get_tree_structure(startpath):
    """
    Generates a visual directory tree structure using Unicode box-drawing characters.
    """
    tree_str = "PROJECT DIRECTORY STRUCTURE:\n"
    tree_str += "=" * 30 + "\n"
    
    def build_tree(dir_path, prefix=""):
        nonlocal tree_str
        try:
            entries = sorted(os.listdir(dir_path))
        except PermissionError:
            return

        valid_entries = []
        for entry in entries:
            full_path = os.path.join(dir_path, entry)
            if os.path.isdir(full_path):
                if entry not in IGNORE_DIRS:
                    valid_entries.append((entry, True))
            else:
                if entry not in IGNORE_FILES:
                    valid_entries.append((entry, False))

        for idx, (name, is_dir) in enumerate(valid_entries):
            is_last = (idx == len(valid_entries) - 1)
            connector = "└── " if is_last else "├── "
            
            if is_dir:
                tree_str += f"{prefix}{connector}{name}/\n"
                next_prefix = prefix + ("    " if is_last else "│   ")
                build_tree(os.path.join(dir_path, name), next_prefix)
            else:
                tree_str += f"{prefix}{connector}{name}\n"

    root_name = os.path.basename(os.path.abspath(startpath)) or startpath
    tree_str += f"{root_name}/\n"
    build_tree(startpath)
    
    tree_str += "=" * 30 + "\n\n"
    return tree_str

def main():
    # Prompt user for selection
    root_dir = select_target_directory()
    
    print(f"Targeting: {root_dir}")
    
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as outfile:
        
        # --- SECTION 1: SYSTEM PROMPT / META ---
        outfile.write("PROJECT CONTEXT FILE\n")
        outfile.write("This document contains the directory structure, repository metadata,\n")
        outfile.write("and source code content for the project.\n\n")

        # --- SECTION 2: GITHUB INFO ---
        gh_info = get_github_repo_info()
        outfile.write(gh_info)

        # --- SECTION 3: DIRECTORY TREE ---
        print("Generating directory tree...")
        tree = get_tree_structure(root_dir)
        outfile.write(tree)

        # --- SECTION 4: FILE CONTENTS ---
        print(f"Extracting file contents (Skipping files > {MAX_FILE_SIZE_BYTES/1024:.0f}KB)...")
        outfile.write("FILE CONTENTS:\n")
        outfile.write("=" * 30 + "\n")

        for root, dirs, files in os.walk(root_dir):
            dirs[:] = [d for d in dirs if d not in IGNORE_DIRS]

            for file in files:
                if file in IGNORE_FILES:
                    continue

                file_path = os.path.join(root, file)
                rel_path = os.path.relpath(file_path, root_dir)
                _, ext = os.path.splitext(file)

                # Determine if we should process this file
                is_code_ext = ext.lower() in INCLUDE_EXTENSIONS
                is_critical = file in CRITICAL_FILENAMES

                if is_code_ext or is_critical:
                    
                    # HEADER
                    outfile.write(f"\n\n--- FILE: {rel_path} ---\n")
                    
                    # 1. Check Binary
                    if is_binary_file(file_path):
                        outfile.write("[SKIPPED: Binary file detected]\n")
                        outfile.write("--- END OF FILE ---\n")
                        continue

                    # 2. Check Size
                    file_size = os.path.getsize(file_path)
                    if file_size > MAX_FILE_SIZE_BYTES:
                        outfile.write(f"[SKIPPED: File size ({file_size} bytes) exceeds limit. Content truncated to save context.]\n")
                        outfile.write("--- END OF FILE ---\n")
                        continue

                    # 3. Read Content
                    try:
                        with open(file_path, 'r', encoding='utf-8', errors='replace') as f:
                            content = f.read()
                            outfile.write(content)
                        outfile.write(f"\n--- END OF FILE: {rel_path} ---\n")
                        print(f"Processed: {rel_path}")
                    except Exception as e:
                        outfile.write(f"[ERROR READING FILE: {e}]\n")
                        print(f"Error reading {rel_path}: {e}")

    print(f"\nSUCCESS! Context generated at: {os.path.abspath(OUTPUT_FILE)}")
    print("Upload this file to Gemini/LLM.")

if __name__ == "__main__":
    main()