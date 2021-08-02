# PROJECT-BEEWOLF
There's a task in Task Scheduler called "SilentCleanup" which, while it's executed as Users, automatically runs with elevated privileges. 
When it runs, it executes the file 
Since it runs as Users, and we can control user's environment variables, 
we can change %windir% (normally pointing to C:\Windows) to point to whatever we want, and it'll run as admin. 
 basically checks if we are admin, so that the script can detect whether it has been called by the user or by the task, and do stuff accordingly. 
 Everything that need admin privs goes in this block of the if statement, while in the "else" block goes what can be run as standard user, including the bypass itself.

The "Set-ItemProperty" line creates a new Registry Key "HKCU:\Environment\windir" in order to change the %windir% variable value to the command we want to be run as admin, 
in this case "powershell -ep bypass -w h $PSCommandPath;#"
