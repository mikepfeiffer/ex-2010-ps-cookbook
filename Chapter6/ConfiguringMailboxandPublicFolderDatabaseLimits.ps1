#example 1:

Set-MailboxDatabase -Identity DB1 `
-IssueWarningQuota 2gb `
-ProhibitSendQuota 2.5gb `
-ProhibitSendReceiveQuota 3gb

Set-PublicFolderDatabase -Identity PFDB1 `
-IssueWarningQuota 25mb `
-ProhibitPostQuota 30mb `
-MaxItemSize 5mb


#example 2:

Set-MailboxDatabase -Identity DB1 -DeletedItemRetention 30

#example 3:

Set-MailboxDatabase -Identity DB1 -MailboxRetention 90

#example 4:

Set-MailboxDatabase -Identity DB1 `
-RetainDeletedItemsUntilBackup $true

#example 5:

Get-MailboxDatabase | Set-MailboxDatabase `
-IssueWarningQuota 2gb `
-ProhibitSendQuota 2.5gb `
-ProhibitSendReceiveQuota 3gb `
-DeletedItemRetention 30 `
-MailboxRetention 90 `
-RetainDeletedItemsUntilBackup $true
