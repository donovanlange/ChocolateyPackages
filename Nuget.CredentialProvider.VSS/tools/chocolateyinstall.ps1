$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName   = 'Nuget.CredentialProvider.VSS'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url           = 'https://www.nuget.org/api/v2/package/Microsoft.VisualStudio.Services.NuGet.CredentialProvider/0.37.0'
$installDir    = Join-Path $env:LOCALAPPDATA "Nuget\CredentialProviders"

## Download and unpack the zip file:
$downloadedZip = Join-Path $toolsDir 'Nuget.CredentialProvider.VSS.0.37.0.zip'
Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$downloadedZip" -Url "$url" -Checksum "68527B1546ACB2C89865276F8A88D57982D7FC9F3ECDEBEFBA26C1A5C71822B5" -ChecksumType "sha256"
Get-ChocolateyUnzip "$downloadedZip" "$toolsDir"

if (!(Test-Path -Path "$installDir"))
{
   New-Item -ItemType directory -Path "$installDir"
}

Copy-Item "$toolsDir\tools\CredentialProvider.VSS.exe" "$installDir" -Force
