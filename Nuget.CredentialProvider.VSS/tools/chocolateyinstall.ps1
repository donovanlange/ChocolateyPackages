$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName   = 'Nuget.CredentialProvider.VSS'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url           = 'https://www.nuget.org/api/v2/package/Microsoft.VisualStudio.Services.NuGet.CredentialProvider/0.14.0'
$installDir    = Join-Path $env:LOCALAPPDATA "Nuget\CredentialProviders"

## Download and unpack the zip file:
$downloadedZip = Join-Path $toolsDir 'Nuget.CredentialProvider.VSS.zip'
Get-ChocolateyWebFile "$packageName" "$downloadedZip" "$url"
Get-ChocolateyUnzip "$downloadedZip" "$toolsDir"

if (!(Test-Path -Path "$installDir"))
{
   New-Item -ItemType directory -Path "$installDir"
}

Copy-Item "$toolsDir\tools\CredentialProvider.VSS.exe" "$installDir" -Force