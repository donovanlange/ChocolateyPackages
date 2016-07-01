$ErrorActionPreference = 'Stop';

$installDir    = Join-Path $env:LOCALAPPDATA "Nuget\CredentialProviders"

if (Test-Path -Path "$installDir\CredentialProvider.VSS.exe")
{
   Remove-Item "$installDir\CredentialProvider.VSS.exe"
}