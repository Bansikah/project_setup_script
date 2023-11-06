#!/bin/bash

# Prompt user for project name
read -rp "Enter project name: " project_name

# Create project directory
mkdir $project_name
cd $project_name

# Prompt user for project type
read -rp "Enter project type (Python or Bash): " project_type

# Create starter file and README
if [ "$project_type" == "Python" ]; then
  # Create Python starter file
  touch $project_name.py
  echo "print('Hello, World!')" >> $project_name.py

  # Set up virtual environment using pip
  python3 -m venv venv
  source venv/bin/activate

  # Generate README with instructions for Python project
  echo "## Setup" > README.md
  echo "1. Create and activate the virtual environment using \`source venv/bin/activate\`." >> README.md
  echo "2. Install dependencies using \`pip install -r requirements.txt\`." >> README.md
  echo "3. Run the script using \`python $project_name.py\`." >> README.md

  # Create requirements.txt file
  touch requirements.txt
  echo "numpy" >> requirements.txt
  echo "pandas" >> requirements.txt
  echo "python3" >> requirements.txt
else
  # Create Bash starter file
  touch $project_name.sh
  echo "#!/bin/bash" >> $project_name.sh
  echo "echo 'Hello, World!'" >> $project_name.sh
  chmod +x $project_name.sh

  # Generate README with instructions for Bash project
  echo "## Setup" > README.md
  echo "1. Run the script using \`bash $project_name.sh\`." >> README.md
  echo "2. To run the script with execution permissions, use \`./$project_name.sh\`." >> README.md
fi

# Add general instructions to README
echo "## Quick Start" >> README.md
echo "1. Clone the repository." >> README.md
echo "2. Follow the setup instructions in the README." >> README.md
echo "3. Start working with the project." >> README.md

# Add project name to README
echo "# $project_name" >> README.md

# Move script to directory in PATH
sudo mv "$0" /usr/local/bin