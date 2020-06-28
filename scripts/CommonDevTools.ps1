
Write-Host "###############################################" -ForegroundColor White;
Write-Host "Installing Developer Tools..." -ForegroundColor White;
Write-Host "###############################################" -ForegroundColor White;
choco install -y cmder
choco install -y microsoft-windows-terminal
choco install -y notepadplusplus.install
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal /NoAutoCrlf /NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration /SChannel'"
choco install -y git-credential-winstore
choco isntall -y Git-Credential-Manager-for-Windows
choco install -y python
choco install -y 7zip.install
choco install -y sysinternals
choco install -y powershell-core
choco install -y azure-cli
choco install -y poshgit
Install-Module -Force oh-my-posh
Install-Module -Force Az
Install-Module -Force posh-git
choco install -y postman
choco install -y soapui

Write-Host ""
Update-SessionEnvironment
