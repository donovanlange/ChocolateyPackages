$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName   = 'Nuget.CredentialProvider.VSS'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url           = 'https://www.nuget.org/api/v2/package/Microsoft.VisualStudio.Services.NuGet.CredentialProvider/0.23.0'
$installDir    = Join-Path $env:LOCALAPPDATA "Nuget\CredentialProviders"

## Download and unpack the zip file:
$downloadedZip = Join-Path $toolsDir 'Nuget.CredentialProvider.VSS.zip'
Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$downloadedZip" -Url "$url" -Checksum "1D59368C45A2163F75D53BEC565915DFFE0A3C2EF35DE6466570CFE502503274" -ChecksumType "sha256"
Get-ChocolateyUnzip "$downloadedZip" "$toolsDir"

if (!(Test-Path -Path "$installDir"))
{
   New-Item -ItemType directory -Path "$installDir"
}

Copy-Item "$toolsDir\tools\CredentialProvider.VSS.exe" "$installDir" -Force