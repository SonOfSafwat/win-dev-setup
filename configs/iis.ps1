
choco install -y -source windowsfeatures IIS-WebServerRole IIS-WebServer IIS-HealthAndDiagnostics
choco install -y -source windowsfeatures IIS-HttpTracing IIS-ApplicationDevelopment IIS-DefaultDocument IIS-CommonHttpFeatures IIS-RequestFiltering IIS-Security
choco install -y -source windowsfeatures IIS-ISAPIFilter IIS-ISAPIExtensions IIS-NetFxExtensibility
choco install -y -source windowsfeatures IIS-ASPNET

$aspnet_regiis = Join-path -Path $env:WinDir -ChildPath Microsoft.NET\Framework\v4.0.30319\aspnet_regiis.exe

& $aspnet_regiis -I

choco install -y UrlRewrite

# Set local state service to auto and run
cmd /c sc config aspnet_state start= auto
cmd /c net start aspnet_state

Write-Host "Now open IIS Manager and allow the ASP.NET 4.0 ISAPI modules"