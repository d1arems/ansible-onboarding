# ansible-onboarding
An optimized Ansible starter template featuring performance-tuned configurations (pipelining, YAML callbacks) for rapid infrastructure automation and management.


# Project Title

A brief description of what this project does and who it's for

Ansible Onboarding & Infrastructure
Setup
Project: Cloud Infrastructure & DevOps Transition
Environment Overview
This repository contains the configuration management baseline used for
automating cloud resources. The environment is strictly managed via a Python virtual
environment to ensure consistency across deployments.
OS: Ubuntu 22.04 LTS (via WSL2 on Windows 11)
Python Version: 3.10.x+
Ansible Installation: Installed within a local .venv using pip to prevent
conflicts with system-level packages.
Extensions & Tools
Extension / Tool Purpose
Ansible Extension (VS
Code)
Provides syntax highlighting, autocompletion, and integrated linting for
YAML playbooks.
ansible-lint
Ensures playbooks follow best practices and prevents use of deprecated
modules.
yamllint
Strictly enforces YAML formatting rules (indentation, spaces) to prevent
runtime crashes.
pre-commit Automates code quality checks before any git commit is finalized.
•
•
•
SSH Security & Configuration
Authentication to cloud nodes (AWS/Azure) is handled via SSH keys. No private keys
are stored in this repository.
Key Location: ~/.ssh/id_ed25519 (Ed25519 algorithm for superior security and
performance).
Local Config: Optimized settings in ~/.ssh/config include
ServerAliveInterval to prevent session timeouts during long-running
playbooks.
SECURITY POLICY: Any attempt to commit *.pem or *.key files is blocked by
the .gitignore and pre-commit hooks.
Git Configuration
Standardized Git settings are used to ensure commit traceability:
git config --global user.name "Oladayo Aremu"
git config --global user.email "your.email@example.com"
git config --global core.editor "code --wait"
# Signing is recommended for production environments to verify commit authenticity.
Development Workflow
Activating the Environment
source .venv/bin/activate
# Once active, your prompt will show (.venv)
Manual Code Quality Checks
# Run checks manually if needed
ansible-lint .
yamllint .
•
•
Corporate & Network Notes
Proxy: If working behind a corporate firewall, ensure HTTPS_PROXY is set in
~/.bashrc .
CA Certificates: For SSL verification issues, update the REQUESTS_CA_BUNDLE
path to point to your corporate root certificate.
"New Machine? Do This" Checklist
☐ Clone the repository from GitHub.
☐ Run python3 -m venv .venv to create the virtual environment.
☐ Activate the environment with source .venv/bin/activate .
☐ Upgrade pip: python -m pip install --upgrade pip .
☐ Install dependencies: pip install -r requirements.txt .
☐ Generate SSH keys if they don't exist: ssh-keygen -t ed25519 .
☐ Configure SSH safe defaults in ~/.ssh/config .
☐ Start SSH Agent: eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519 .
☐ Install pre-commit hooks: pre-commit install .
☐ Verify setup with ansible --version .
☐ Run pre-commit run --all-files to ensure baseline quality.
☐ Update .env with local environment variables (if required).
•
•
##  Links
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://katherineoelsner.com/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/)



