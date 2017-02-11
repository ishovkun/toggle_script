# toggle_script
A bash script to toggle a specified application.

# Usage
I will demonstrate its application with assigning a shortcut to toggle Chromium on KDE.
Go to System Settings -> Shortcuts -> Custom Shortcuts.
Create a new global shortcut (Commang/URL) with a name ``toggle-chromium'' with a Trigger i.e. Meta-W (press Win-w) and the following action:
bash /path_to_script/toggle_app.sh -a chromium
