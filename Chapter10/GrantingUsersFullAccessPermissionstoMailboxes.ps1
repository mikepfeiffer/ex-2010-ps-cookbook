#example 1:

Add-MailboxPermission -Identity dsmith `
-User hlawson `
-AccessRights FullAccess

Remove-MailboxPermission -Identity dsmith `
-User hlawson `
-AccessRights FullAccess `
-Confirm:$false


#example 2:

Add-MailboxPermission -Identity dsmith `
-User "IT Help Desk" `
-AccessRights FullAccess

#example 3:

Get-Mailbox -ResultSize Unlimited -RecipientTypeDetails UserMailbox | 
  Add-MailboxPermission -User "IT Help Desk" `
  -AccessRights FullAccess

#example 4:

Add-ADPermission -Identity DB01 `
-User support `
-ExtendedRights Receive-As


#example 5:

Get-MailboxDatabase | 
  Add-ADPermission –User support `
  -ExtendedRights Receive-As
