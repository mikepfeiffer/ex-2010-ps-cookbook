#example 1:

New-MailboxDatabase -Name RecoveryDB `
-EdbFilePath E:\Recovery\DB1\DB1.edb `
-LogFolderPath E:\Recovery\DB01 `
-Recovery `
-Server MBX1

#example 2:

Mount-Database -Identity RecoveryDB

#example 3:

New-MailboxRestoreRequest -SourceDatabase RecoveryDB `
-SourceStoreMailbox "Joe Smith" `
-TargetMailbox joe.smith

#example 4:

Get-MailboxStatistics -Database RecoveryDB | 
fl DisplayName,MailboxGUID,LegacyDN

#example 5:

$mailboxes = Get-MailboxStatistics -Database RecoveryDB
foreach($mailbox in $mailboxes) {
	New-MailboxRestoreRequest -SourceDatabase RecoveryDB `
	-SourceStoreMailbox $mailbox.DisplayName `
	-TargetMailbox $mailbox.DisplayName  
}
