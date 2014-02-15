#example 1:

New-ReceiveConnector -Name Relay `
-Usage Custom `
-Bindings ‘192.168.1.245:25’ `
-Fqdn mail.contoso.com `
-RemoteIPRanges 192.168.1.110 `
-Server HUB1 `
-PermissionGroups ExchangeServers `
-AuthMechanism TLS, ExternalAuthoritative

#example 2:

New-ReceiveConnector -Name Relay `
-Usage Custom `
-Bindings ‘192.168.1.245:25’ `
-Fqdn mail.contoso.com `
-RemoteIPRanges 192.168.1.110 `
-Server HUB1 `
-PermissionGroups AnonymousUsers

#example 3:

Get-ReceiveConnector HUB1\Relay | 
  Add-ADPermission -User "NT AUTHORITY\ANONYMOUS LOGON" `
  -ExtendedRights ms-Exch-SMTP-Accept-Any-Recipient
