#example 1:

Add-Type -Path C:\EWS\Microsoft.Exchange.WebServices.dll
$svc = New-Object Microsoft.Exchange.WebServices.Data.ExchangeService
$svc.AutoDiscoverUrl(“administrator@contoso.com”)

#example 2:

[System.Reflection.Assembly]::LoadFile(
  "C:\ews\Microsoft.Exchange.WebServices.dll"
)


#example 3:

$svc=New-Object Microsoft.Exchange.WebServices.Data.ExchangeService `
-ArgumentList "Exchange2010_SP1"


#example 4:

$svc = New-Object Microsoft.Exchange.WebServices.Data.ExchangeService
$svc.Credentials = New-Object `
Microsoft.Exchange.WebServices.Data.WebCredentials `
-ArgumentList "administrator","P@ssw0rd01","contoso.com"


#example 5:

$url = “https://ex1.contoso.com/EWS/Exchange.asmx”
$svc.Url = New-Object System.Uri -ArgumentList $url


#example 6:

$svc = New-Object Microsoft.Exchange.WebServices.Data.ExchangeService

$spm = [System.Net.ServicePointManager]
$spm::ServerCertificateValidationCallback = {$true}

$svc.AutoDiscoverUrl(“administrator@contoso.com”)
