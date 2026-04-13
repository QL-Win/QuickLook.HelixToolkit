Set-Location $PSScriptRoot

Write-Host @"
███╗   ██╗██╗   ██╗ ██████╗ ███████╗████████╗
████╗  ██║██║   ██║██╔════╝ ██╔════╝╚══██╔══╝
██╔██╗ ██║██║   ██║██║  ███╗█████╗     ██║   
██║╚██╗██║██║   ██║██║   ██║██╔══╝     ██║   
██║ ╚████║╚██████╔╝╚██████╔╝███████╗   ██║   
╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝   
"@

Push-Location HelixToolkit
& git clean -xfd
& git apply ../QuickLook.HelixToolkit.patch # git format-patch -1 --stdout > ..\QuickLook.HelixToolkit.patch
Pop-Location

Push-Location HelixToolkit\Source
& dotnet build -c Release
Pop-Location

Copy-Item HelixToolkit\Source\HelixToolkit.Wpf\bin\Release\*.*nupkg .

Write-Host "`nPress any key to exit..."
[void][System.Console]::ReadKey($true)
