#example 1:

Get-ExchangeCertificate | 
  select Status,
         Thumbprint,
         IsSelfSigned,
         @{n="Expires";e={$_.NotAfter}},
         @{n="DaysLeft";e={($_.NotAfter - $_.NotBefore).Days}}


#example 2:

foreach($server in Get-ExchangeServer) {
  Get-ExchangeCertificate -Server $Server | 
    select @{n="Server";e={$Server}},
           Status,
           Thumbprint,
           IsSelfSigned,
           @{n="Expires";e={$_.NotAfter}},
           @{n="DaysLeft";e={($_.NotAfter - $_.NotBefore).Days}}
}


#example 3:

function Test-CertificateHealth {
  param(
    [Parameter(
      Position=0,
      ValueFromPipelineByPropertyName=$true,
      Mandatory=$true)]
    [String]$Name   
  )
  
  process {
    Get-ExchangeCertificate -Server $Name | 
      select @{n="Server";e={$Name}},
             Status,
             Thumbprint,
             IsSelfSigned,
             @{n="Expires";e={$_.NotAfter}},
             @{n="DaysLeft";e={($_.NotAfter - $_.NotBefore).Days}}
  } 
}


#example 4:

Get-ExchangeServer | Test-CertificateHealth | 
  Where-Object {$_.DaysLeft -le 90}


#example 5:

#example 6:

#example 7:

#example 8:

#example 9:

#example 10:
