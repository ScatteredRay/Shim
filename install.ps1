# https://github.com/edymtt/nugetstandalone
Invoke-WebRequest -Uri "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile "$psscriptroot\nuget.exe"
$destinationFolder = "$psscriptroot\packages"
if ((Test-Path -path $destinationFolder)) {
    Remove-Item -Path $destinationFolder -Recurse | Out-Null
}

New-Item $destinationFolder -Type Directory | Out-Null
.\nuget install packages.config -o $destinationFolder -ExcludeVersion
