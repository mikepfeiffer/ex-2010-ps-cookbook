#example 1:

$user = "contoso\administrator"
$pass = ConvertTo-SecureString -AsPlainText "P@ssw0rd01" -Force
$creds = New-Object System.Management.Automation.PSCredential `
-ArgumentList $user,$pass

Test-OutlookConnectivity -Identity administrator `
-Protocol:TCP `
-MailboxCredential $creds

Test-OutlookConnectivity -Identity administrator `
-Protocol:HTTP `
-MailboxCredential $creds



#example 2:

Test-MRSHealth -Identity CAS1

#example 3:

Get-ClientAccessServer | Test-MRSHealth

