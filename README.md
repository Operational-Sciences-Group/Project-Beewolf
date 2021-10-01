# Project-Beewolf
#### SAM extraction via PowerShell
![GitHub top language](https://img.shields.io/github/languages/top/Operational-Sciences-Group/Project-birddog?label=PowerShell&logo=powershell&style=plastic)
![Version](https://img.shields.io/badge/Version-1.0-sucess?style=plastic)
![GitHub issues](https://img.shields.io/github/issues/Operational-Sciences-Group/Prussian-Red?logo=Github&style=plastic)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Operational-Sciences-Group/Project-Birddog?style=plastic)


Beewolf is a PowerShell (Version 7/5/2) script that exploits the HiveNightmare (aka SeriousSAM) vulnerability [CVE-2021-36934](https://msrc.microsoft.com/update-guide/en-US/vulnerability/CVE-2021-36934)

## Table of contents

1. [About](https://github.com/Operational-Sciences-Group/Project-Beewolf#about)
2. [Installation /usage](https://github.com/Operational-Sciences-Group/Project-Beewolf#installation--usage)
3. [Disclaimer / Warning](https://github.com/Operational-Sciences-Group/Project-Beewolf#disclaimer--warning)
4. [Credits](https://github.com/Operational-Sciences-Group/Project-Beewolf#credits)
5. [License](https://github.com/Operational-Sciences-Group/Project-Beewolf#license)

## About

Beewolf copies the Windows [Security Account Manager](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc756748(v=ws.10)?redirectedfrom=MSDN) database to $env:PUBLIC (or another filepath) for your viewing pleasure. It works by creating symbolic links to a shadowcopy of the SAM, and preforming slight of hand with variables.

It has been tested on the following versions of Windows:
- Windows 10 Pro.    10.0.19043.0 (Major.Minor.Build.Revision)
- Windows 8.1 Enterprise.    6.3.9600.0 (Major.Minor.Build.Revision)
- Windows 7 Enterprise Service Pack 1.   6.1.7601.65536 (Major.Minor.Build.Revision)
- We anticipate it will work on Windows 11. 

Here is the concept of operation:

<a href="https://ibb.co/rGZCdZH"><img src="https://i.ibb.co/4Zj61jp/image.jpg" alt="image" border="0"></a>

## Installation / Usage

**Install using PowerShell Version 3 or later**

Installation:

1. Navigate to the desired install path:

&emsp;```Set-Location <install\path>```

2. Place Beewolf.ps1 into path:

        (Invoke-WebRequest -URI "https://raw.githubusercontent.com/Operational-Sciences-Group/Project-Beewolf/main/Beewolf.ps1").Content > Beewolf.ps1

Usage:

```.\Beewolf.ps1```


## Disclaimer / Warning
All the contents of this repository should be used for authorized and/or educational purposes only. Any misuse of this repository will not be the responsibility of the author or of any other collaborator.

## Credits

Credit to [enigma0x3](https://web.archive.org/web/20210924173309/https://enigma0x3.net/2016/07/22/bypassing-uac-on-windows-10-using-disk-cleanup/) and [Matt Graeber](https://twitter.com/mattifestation) for the UAC bypass.

Credit to [Jonas L](https://web.archive.org/web/20210822093858/https://twitter.com/jonasLyk/status/1417205166172950531) for discovering the vuln.
## License
[GPL-3.0](https://github.com/Operational-Sciences-Group/Project-Beewolf/blob/main/LICENSE)
