import os
import subprocess

repos = [
    "https://github.com/PS-003R32/picoCTF-solutions-writeups.git",
    "https://github.com/PS-003R32/RaspberryPi-netscan-toolkit.git",
    "https://github.com/PS-003R32/RaspberryPi-wifi-cracker-toolkit.git",
    "https://github.com/PS-003R32/Telegram-task_bot.git"]

backup_dir = os.path.expanduser("~/repo_backups")
os.makedirs(backup_dir, exist_ok=True)

for repo in repos:
    name = repo.split("/")[-1].replace(".git", "")
    subprocess.run(["git", "clone", "--mirror", repo, os.path.join(backup_dir, f"{name}.git")])
