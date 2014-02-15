#example 1:

Search-AdminAuditLog -Cmdlets Set-Mailbox `
-StartDate 01/1/2011 `
-EndDate 01/31/2011 `
-IsSuccess $true

New-AdminAuditLogSearch -Cmdlets Set-Mailbox `
-StartDate 01/1/2011 `
-EndDate 01/31/2011 `
-IsSuccess $true `
-StatusMailRecipients admin@contoso.com


#example 2:

Search-AdminAuditLog | ?{$_.ObjectModified -like '*sutton*'}

#example 3:

$logs = Search-AdminAuditLog | Select-Object -First 10

$logs[0]

$logs[0].ModifiedProperties | Format-List 


