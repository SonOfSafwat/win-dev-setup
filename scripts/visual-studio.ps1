
#--- Installing VS and VS Code with Git
# visualstudio2017community
# visualstudio2017professional
# visualstudio2017enterprise
choco install -y visualstudio2017community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
Update-SessionEnvironment #refreshing env due to Git install

#--- UWP Workload and installing Windows Template Studio ---
choco install -y visualstudio2017buildtools
choco install -y visualstudio2017-workload-vctools
choco install -y visualstudio2017-workload-azure
choco install -y visualstudio2017-workload-universal
choco install -y visualstudio2017-workload-manageddesktop
choco install -y visualstudio2017-workload-nativedesktop

choco install -y sql-server-management-studio
Write-Host ""
Update-SessionEnvironment