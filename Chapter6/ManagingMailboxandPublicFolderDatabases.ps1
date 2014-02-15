#example 1:

New-MailboxDatabase -Name DB4 `
-EdbFilePath E:\Databases\DB4\DB4.edb `
-LogFolderPath E:\Databases\DB4 `
-Server EX01

Mount-Database -Identity DB4

Set-MailboxDatabase -Identity DB4 -Name Database4

Remove-MailboxDatabase -Identity Database4 -Confirm:$false

#example 2:

New-MailboxDatabase -Name DB10 -Server EX01 | Mount-Database

#example 3:

New-PublicFolderDatabase -Name PFDB1 `
-EdbFilePath E:\Databases\PFDB1\PFDB1.edb `
-LogFolderPath E:\Databases\PFDB1 `
-Server EX01

#example 4:

Set-MailboxDatabase -Identity DB1 -IsExcludedFromProvisioning $true
