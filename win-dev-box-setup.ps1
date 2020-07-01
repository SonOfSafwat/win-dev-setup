Enable-RemoteDesktop
Disable-UAC
Update-ExecutionPolicy Unrestricted
$ConfirmPreference = "None" #ensure installing powershell modules don't prompt on needed dependencies

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeConfig {
	Param ([string]$config)
	$configUri = $helperUri + "/configs"
	write-host "Executing Config: $configUri/$config ..."
	iex ((new-object net.webclient).DownloadString("$configUri/$config"))
}

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}


$scriptsList = @(

);

$configsList = @(

);

#--- Setting up Windows ---
foreach ($script in $scriptsList) {
	executeScript $script
    Update-SessionEnvironment
    RefreshEnv
}

foreach ($config in $configsList) {
	executeConfig $config
    Update-SessionEnvironment
    RefreshEnv
}




# checkout recent projects
# mkdir C:\github
# cd C:\github
# git.exe clone https://github.com/microsoft/windows-dev-box-setup-scripts
# git.exe clone https://github.com/microsoft/winappdriver
# git.exe clone https://github.com/microsoft/wsl
# git.exe clone https://github.com/PowerShell/PowerShell


#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
