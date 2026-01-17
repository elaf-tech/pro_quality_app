Copy-Item -Path "scripts\pre-commit.ps1" -Destination ".git\hooks\pre-commit" -Force
# Note: Git hooks on Windows usually require the file to be named 'pre-commit' (no extension) and invoke the interpreter.
# However, usually Git for Windows runs bash scripts. 
# If utilizing PowerShell specifically for hooks, one might need a wrapper.
# For simplicity in this environment, we'll assume a standard Git Bash environment for hooks or copied as is.
# A common pattern is creating a 'pre-commit' shell script that calls the ps1 script if needed,
# or just using the shell script if the user has Git Bash installed (recommended for Windows).

# Let's create a robust 'pre-commit' wrapper that works on Windows with Git Bash
$wrapperContent = "#!/bin/sh
if [ -f scripts/pre-commit.sh ]; then
  ./scripts/pre-commit.sh
else
  # Fallback to powershell if necessary, or just skip
  echo 'No script found'
  exit 1
fi"

Set-Content -Path ".git\hooks\pre-commit" -Value $wrapperContent
exit 0
