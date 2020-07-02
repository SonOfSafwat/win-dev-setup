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

function executeConfig {
	Param ([string]$config)
	$configUri = $helperUri + "/configs"
	write-host "Executing Config: $configUri/$config ..."
	iex ((new-object net.webclient).DownloadString("$configUri/$config"))
}

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
"vscode.ps1"
);

$configsList = @(
"file-explorer-config.ps1",
"git.ps1",
"iis.ps1",
"taskbar-config.ps1",
"vscode.ps1",
"npm.ps1"
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


#--- reenabling critial items ---
Enable-UAC
