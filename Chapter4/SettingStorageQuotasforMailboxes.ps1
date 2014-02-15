#example 1:

Set-Mailbox -Identity testuser `
-IssueWarningQuota 1gb `
-ProhibitSendQuota 1.5gb `
-ProhibitSendReceiveQuota 2gb `
-UseDatabaseQuotaDefaults $false

#example 2:

Get-User -RecipientTypeDetails UserMailbox `
-Filter {Title -eq 'Manager'} | 
  Set-Mailbox -IssueWarningQuota 2gb `
  -ProhibitSendQuota 2.5gb `
  -ProhibitSendReceiveQuota 3gb `
  -UseDatabaseQuotaDefaults $false
