---

# Project Setup Script

This script sets up a new local project environment tailored for Python or Bash projects. It creates the necessary project structure, including starter files and README instructions.

## Requirements

- Unix-like operating system (e.g., Linux, macOS)
- Bash shell
- Python 3 (if creating a Python project)
- Pip (if creating a Python project)

## Usage

1. Open a terminal.
2. Navigate to the directory where you want to create your project.
3. Run the following command:
bash project_setup.sh
4. Follow the prompts to enter the project name and type (Python or Bash).
5. The script will create the project directory and generate the necessary files based on your inputs.

## Project Structure

The script will create the following structure for your project:
project_name/
├── project_name.py (for Python projects)
├── project_name.sh (for Bash projects)
├── venv/ (for Python projects)
├── README.md
└── requirements.txt (for Python projects)
## Python Project Setup

If you choose Python as the project type, the script will:

- Create a Python starter file ( `project_name.py` ) with a simple "Hello, World!" print statement.
- Set up a virtual environment ( `venv` ) using  `python3 -m venv` .
- Activate the virtual environment using  `source venv/bin/activate` .
- Generate a README with setup instructions for Python projects.
- Create a  `requirements.txt`  file with pre-populated dependencies ( `numpy` ,  `pandas` ,  `python3` ).

## Bash Project Setup

If you choose Bash as the project type, the script will:

- Create a Bash starter file ( `project_name.sh` ) with a simple "Hello, World!" echo statement.
- Set execution permissions on the starter file using  `chmod +x` .
- Generate a README with setup instructions for running Bash scripts.

## Quick Start

1. Clone the repository.
2. Follow the setup instructions in the README.
3. Start working with the project.

---
