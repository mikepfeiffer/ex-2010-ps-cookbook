#example 1:

New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType SearchFolder, ProvisionedFolder,FolderView `
-DetectOnly

#example 2:

New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType SearchFolder, ProvisionedFolder,FolderView

#example 3:

Get-Mailbox -OrganizationalUnit uss.local/sales | 
  New-MailboxRepairRequest `
  -CorruptionType SearchFolder,ProvisionedFolder,FolderView `
  –DetectOnly

#example 4:

$repair = New-MailboxRepairRequest -Mailbox testuser `
-CorruptionType SearchFolder

Get-EventLog -LogName Application -ComputerName ex01 | ?{
  ('10047','10048','10049' -contains $_.EventID) -and `
  ($_.Message -match $repair.RequestID)
}
