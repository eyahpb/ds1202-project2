# DS1202 AS02 – Server Access & Git Proficiency

## 1. Project Overview

This project was developed for the DS1202 ICT Infrastructure Basics assignment. It demonstrates secure SSH access to a Linux server, shell scripting for system information reporting, and version control using Git and GitHub.

The main script, `scripts/sysinfo.sh`, collects and displays important information about the system. The enhanced version also includes CPU load, system uptime, and a logging feature that saves timestamped reports in the `logs/` directory.

## 2. System Information Report

The `sysinfo.sh` script reports the following information:

- **Date and time:** Shows when the report was generated.
- **Hostname:** Displays the name of the current machine.
- **Operating system:** Identifies the operating system.
- **Kernel information:** Displays the Linux kernel version.
- **CPU load:** Shows the current system load.
- **System uptime:** Displays how long the system has been running.
- **Memory usage:** Reports the system's memory utilisation.
- **Disk usage:** Shows the storage space used and available.

The script displays the report in the terminal and saves a timestamped copy in the `logs/` directory for future reference.

## 3. Project Directory Structure

The project uses the following directory structure:

```text
ds1202-project/
├── scripts/
│   └── sysinfo.sh
├── docs/
├── logs/
│   └── sysinfo_*.txt
└── README.md
```

- `scripts/` contains the system information script.
- `docs/` stores supporting documentation.
- `logs/` stores generated system information reports.
- `README.md` explains the project, setup instructions, and Git workflow.

The project directory is assigned permission `755`, allowing the owner to read, write, and access the directory while other users can read and access it.

## 4. Setup Instructions

### Step 1: Generate an SSH key pair

Generate an Ed25519 SSH key pair on the computer used to connect to the lab server:

```bash
ssh-keygen -t ed25519 -C "your.email@pb.edu.bn"
```

Follow the prompts to save the key pair. The public key ends in `.pub`, while the private key must remain confidential.

### Step 2: Configure passwordless SSH login

Copy the public key to the lab server:

```bash
ssh-copy-id username@<lab-server>
```

Replace `username` and `<lab-server>` with the assigned login details.

Connect to the server:

```bash
ssh username@<lab-server>
```

The SSH key allows authentication without entering the account password each time, provided the key and server configuration are correct.

### Step 3: Create the project directories

On the lab server, run:

```bash
mkdir -p ~/ds1202-project/{scripts,docs,logs}
cd ~/ds1202-project
```

Set the project directory permissions:

```bash
chmod 755 ~/ds1202-project
```

### Step 4: Make the script executable

Run:

```bash
chmod +x scripts/sysinfo.sh
```

Check the directory structure and permissions:

```bash
ls -la
ls -la scripts/
```

## 5. How to Run the Script

Navigate to the project directory:

```bash
cd ~/ds1202-project
```

Execute the script:

```bash
./scripts/sysinfo.sh
```

The system information report should appear in the terminal. The enhanced script also saves a timestamped report in the `logs/` directory.

To view the generated log files, run:

```bash
ls -lh logs/
```

To view a saved report, use:

```bash
cat logs/<log-filename>
```

Replace `<log-filename>` with the actual filename created by the script.

## 6. Git Workflow

Git was used to track the development of the project, including the initial script, improvements made on a feature branch, and the final merged version.

### Step 1: Initialise the repository

```bash
git init
git add .
git commit -m "Add directory structure and sysinfo script"
```

The initial commit records the project structure and the original script.

### Step 2: Create a feature branch

```bash
git switch -c feature-logging
```

The `feature-logging` branch was used to develop improvements to the system information script.

### Step 3: Enhance and commit the script

The script was enhanced with additional system information and report logging. After testing the changes, they were committed:

```bash
git add scripts/sysinfo.sh
git commit -m "Enhance sysinfo with logging and system details"
```

### Step 4: Merge the feature branch

The feature branch should be merged into `main`:

```bash
git switch main
git merge feature-logging
```

The merge incorporates the completed enhancements into the main branch.

### Step 5: Configure the GitHub remote

```bash
git remote add origin git@github.com:eyahpb/ds1202-project2.git
```

If `origin` already exists, update the URL instead:

```bash
git remote set-url origin git@github.com:eyahpb/ds1202-project2.git
```

### Step 6: Push the branches to GitHub

```bash
git push -u origin main
git push -u origin feature-logging
```

The repository is published at:

https://github.com/eyahpb/ds1202-project2

### Step 7: Verify the Git history

```bash
git log --graph --oneline --all
```

This command displays the commit history and branches, allowing the initial commit, feature development, and merge history to be reviewed.

## 7. Evidence PDF Screenshots

The evidence PDF contains the following screenshots in the order required by the assignment brief:

1. **SSH key generation:** Terminal output showing that the SSH key pair was generated.
2. **Passwordless SSH login:** Successful login to the lab Linux server without entering a password.
3. **Project directory structure and permissions:** `ls -la` output showing the project directories and their permissions.
4. **Enhanced system information report:** Output from running `scripts/sysinfo.sh` after merging the enhanced version into the main branch.
5. **Git commit history and branches:** Output of `git log --graph --oneline --all` showing the project's commit history and branches.

The SSH key, login, and directory setup screenshots required for the separate Mid-Assessment Check should also be submitted to the appropriate LMS activity.

## 8. Conclusion

This project demonstrates the practical use of SSH for secure server access, Bash scripting for automated system information reporting, and Git for managing code changes. The enhanced script provides additional system details and saves reports for later reference. The Git workflow records the development process through commits, branching, merging, and publishing the repository on GitHub.

