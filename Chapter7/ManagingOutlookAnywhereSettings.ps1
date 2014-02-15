#example 1:

Enable-OutlookAnywhere -Server cas1 `
-ExternalHostname mail.contoso.com `
-ClientAuthenticationMethod Basic `
-SSLOffloading $false

#example 2:

Set-OutlookAnywhere -Identity 'CAS1\Rpc (Default Web Site)' `
-ExternalHostname 'outlook.contoso.com'

#example 3:

Disable-OutlookAnywhere -Server cas1 -Confirm:$false
