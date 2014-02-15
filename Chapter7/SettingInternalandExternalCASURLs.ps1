#example 1:

Set-OwaVirtualDirectory -Identity 'CAS1\owa (Default Web Site)' `
-ExternalUrl https://mail.contoso.com/owa

#example 2:

Set-EcpVirtualDirectory -Identity 'CAS1\ecp (Default Web Site)' `
-ExternalUrl https://mail.contoso.com/ecp

#example 3:

Get-EcpVirtualDirectory -Server cas1 | 
  Set-EcpVirtualDirectory -ExternalUrl https://mail.contoso.com/ecp

#example 4:

Set-ClientAccessServer -Identity cas1 `
-AutoDiscoverServiceInternalUri `
https://mail.contoso.com/Autodiscover/Autodiscover.xml

#example 5:

Set-OABVirtualDirectory -Identity "cas1\oab (Default Web Site)" `
-ExternalUrl https://mail.contoso.com/oab

#example 6:

Set-ActivesyncVirtualDirectory -Identity `
"cas1\Microsoft-Server-ActiveSync (Default Web Site)" `
-ExternalURL https://mail.contoso.com/Microsoft-Server-Activesync

#example 7:

Set-WebServicesVirtualDirectory -Identity `
"cas1\EWS (Default Web Site)" `
-ExternalUrl https://mail.contoso.com/ews/exchange.asmx
