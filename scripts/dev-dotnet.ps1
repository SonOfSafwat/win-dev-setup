
cinst DotNet4.6 dotnet3.5  -y
choco install -y dotnetcore-sdk
choco install -y netfx-4.8-devpack

cinst -source windowsfeatures IIS-WebServerRole IIS-WebServer IIS-HealthAndDiagnostics
cinst -source windowsfeatures IIS-HttpTracing IIS-ApplicationDevelopment IIS-DefaultDocument IIS-CommonHttpFeatures IIS-RequestFiltering IIS-Security
cinst -source windowsfeatures IIS-ISAPIFilter IIS-ISAPIExtensions IIS-NetFxExtensibility
cinst -source windowsfeatures IIS-ASPNET

$aspnet_regiis = Join-path -Path $env:WinDir -ChildPath Microsoft.NET\Framework\v4.0.30319\aspnet_regiis.exe

& $aspnet_regiis -I

cinst UrlRewrite

# Set local state service to auto and run
cmd /c sc config aspnet_state start= auto
cmd /c net start aspnet_state

Write-Host "Now open IIS Manager and allow the ASP.NET 4.0 ISAPI modules"