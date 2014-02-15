#example 1:

Set-MailboxDatabase -Identity DB1 `
-RpcClientAccessServer outlook.contoso.com

#example 2:

Get-ExchangeServer | 
  Where-Object {$_.Site.Name -eq 'Default-First-Site-Name' `
    -and $_.ServerRole -match 'Mailbox'
  } | 
Get-MailboxDatabase | 
  Set-MailboxDatabase -RpcClientAccessServer outlook.contoso.com
