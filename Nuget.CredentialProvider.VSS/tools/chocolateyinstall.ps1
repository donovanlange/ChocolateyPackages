$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName   = 'Nuget.CredentialProvider.VSS'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url           = 'https://www.nuget.org/api/v2/package/Microsoft.VisualStudio.Services.NuGet.CredentialProvider/0.14.0'
$installDir    = Join-Path $env:LOCALAPPDATA "Nuget\CredentialProviders"

## Download and unpack the zip file:
$downloadedZip = Join-Path $toolsDir 'Nuget.CredentialProvider.VSS.zip'
Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$downloadedZip" -Url "$url" -Checksum "AA79AE37517A15F0807A19A6D68077188DEB2DB5CD0D886EDFC767AB5EACBB29" -ChecksumType "sha256"
Get-ChocolateyUnzip "$downloadedZip" "$toolsDir"

if (!(Test-Path -Path "$installDir"))
{
   New-Item -ItemType directory -Path "$installDir"
}

Copy-Item "$toolsDir\tools\CredentialProvider.VSS.exe" "$installDir" -Force