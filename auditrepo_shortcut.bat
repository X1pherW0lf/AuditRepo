@echo off
set /p repo_url="GitHub URL: "
wsl ~/auditrepo.sh %repo_url%
pause
