Disable-UAC
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

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}



#--- Setting up Windows ---
executeScript "FileExplorerSettings.ps1";
executeScript "SystemConfiguration.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "CommonDevTools.ps1";
#--- installing Windows Template Studio ---
executeScript "WindowsTemplateStudio.ps1";
# common browsers
executeScript "Browsers.ps1";
# Hyper-V
executeScript "HyperV.ps1";
RefreshEnv
# Docker
executeScript "Docker.ps1";
# WSL
executeScript "WSL.ps1";
RefreshEnv


# personalize
#choco install -y microsoft-teams
#choco install -y office365business
choco install firacode --yes


# checkout recent projects
# mkdir C:\github
# cd C:\github
# git.exe clone https://github.com/microsoft/windows-dev-box-setup-scripts
# git.exe clone https://github.com/microsoft/winappdriver
# git.exe clone https://github.com/microsoft/wsl
# git.exe clone https://github.com/PowerShell/PowerShell



Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
