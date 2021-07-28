Just a quick six-liner for first proof-of-concept.\
Two symbolic links are created on lines 1 & 2 to enable PowerShell to facilitate access to the shadow drive.\
The directory is tied to a variable and mapped to 'C:\shadowcopy' on lines 3 & 4.\
Copy of the SAM registry key is executed to local D:\ on line 5.  (Change target directory accordingly)\
The directory for powershell to access the shadowcopy via symbolic link is then deleted on line 6.
