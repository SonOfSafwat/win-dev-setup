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
write-host "helper script base URI is $helperUri"


function executeScript {
		Param ([string]$script)
		$scriptsUri = $helperUri + "/scripts"
    write-host "executing $scriptsUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$scriptsUri/$script"))
}


$scriptsList = @(
"browsers.ps1",
"dotnet.ps1",
"fonts.ps1",
"git.ps1",
"node.ps1",
"terminals.ps1",
"tools.ps1",
"visual-studio.ps1",
"vscode.ps1",
"wsl.ps1",
"docker.ps1",
"hyper-v.ps1"
);


#--- Setting up Windows ---
foreach ($script in $scriptsList) {
	executeScript $script
    Update-SessionEnvironment
    RefreshEnv
}




#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
