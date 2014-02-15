#example 1:

New-TransportRule -Name Confidential `
-Enabled $true `
-SubjectContainsWords Confidential `
-BlindCopyTo Administrator@contoso.com

#example 2:

New-TransportRule -Name ITSupport `
-Enabled $true `
-HeaderMatchesMessageHeader X-Department `
-HeaderMatchesPatterns ITSupport `
-AddToRecipients administrator@contoso.com

#example 3:

New-TransportRule -Name ITSupport `
-Enabled $true `
-HeaderMatchesMessageHeader X-Department `
-HeaderMatchesPatterns ITSupport `
-ExceptIfFrom administrator@contoso.com `
-AddToRecipients administrator@contoso.com

#example 4:

Get-TransportRule Confidential | Format-List

#example 5:

Get-TransportRule | Where-Object {$_.SubjectContainsWords}

#example 6:

Set-TransportRule –Identity Confidential `
  -BlindCopyTo sysadmin@contoso.com

Set-TransportRule –Identity Confidential `
  -BlindCopyTo $null `
  -RedirectMessageTo sysadmin@contoso.com 

Set-TransportRule -Identity ITSupport -Priority 0

#example 7:

Disable-TransportRule -Identity Confidential -Confirm:$false

Enable-TransportRule -Identity Confidential

Remove-TransportRule -Identity Confidential -Confirm:$false

#example 8:

New-TransportRule -Name "Block Credit Card Numbers" `
-SubjectOrBodyMatchesPatterns '\d\d\d\d-\d\d\d\d-\d\d\d\d-\d\d\d\d' `
-RejectMessageEnhancedStatusCode "5.7.1" `
-RejectMessageReasonText "Don't send credit card numbers via e-mail!"
