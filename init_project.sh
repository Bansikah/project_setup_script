#!/bin/bash

# Get the directory path of the script
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to prompt user for project name
prompt_project_name() {
  read -rp "Enter project name: " project_name
}

# Function to prompt user for project type
prompt_project_type() {
  PS3="Enter project type (Python or Bash): "
  select project_type in "Python" "Bash"; do
    case $project_type in
      "Python"|"Bash")
        break
        ;;
      *)
        echo "Invalid option. Please try again."
        ;;
    esac
  done
}

# Prompt user for project name
prompt_project_name

# Create project directory
mkdir "$project_name"
cd "$project_name" || exit 1

# Prompt user for project type
prompt_project_type

# Function to prompt user for project name change
prompt_rename_project_name() {
  read -rp "Enter new project name: " project_name
}

# Prompt user to rename project name if desired
PS3="Do you want to rename the project name? "
select rename_option in "Yes" "No"; do
  case $rename_option in
    "Yes")
      prompt_rename_project_name
      break
      ;;
    "No")
      break
      ;;
    *)
      echo "Invalid option. Please try again."
      ;;
  esac
done

# Create starter file and README
if [ "$project_type" == "Python" ]; then
  # Create Python starter file
  touch "$project_name.py"
  echo "print('Hello, World!')" >> "$project_name.py"

  # Set up virtual environment using pip
  python3 -m venv venv
  source venv/bin/activate

  # Generate README with instructions for Python project
  cat <<EOF > README.md
## Setup
1. Create and activate the virtual environment using \`source venv/bin/activate\`.
2. Install dependencies using \`pip install -r requirements.txt\`.
3. Run the script using \`python $project_name.py\`.
EOF

  # Create requirements.txt file
  touch requirements.txt
  echo "numpy" >> requirements.txt
  echo "pandas" >> requirements.txt
else
  # Create Bash starter file
  touch "$project_name.sh"
  echo "#!/bin/bash" >> "$project_name.sh"
  echo "echo 'Hello, World!'" >> "$project_name.sh"
  chmod +x "$project_name.sh"

  # Generate README with instructions for Bash project
  cat <<EOF > README.md
## Setup
1. Run the script using \`bash $project_name.sh\`.
2. To run the script with execution permissions, use \`./$project_name.sh\`.
EOF
fi

# Add general instructions to README
cat <<EOF >> README.md
## Quick Start
1. Clone the repository.
2. Follow the setup instructions in the README.
3. Start working with the project.
EOF

# Move script to directory in PATH
sudo mv "$SCRIPT_PATH/init_project.sh" /usr/local/bin

# Provide instructions to reload the shell profile
echo "Please reload your shell profile to make the script globally accessible."