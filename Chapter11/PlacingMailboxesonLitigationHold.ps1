#example 1:

Set-Mailbox -Identity dsmith -LitigationHoldEnabled $true

Set-Mailbox -Identity dsmith -LitigationHoldEnabled $false

#example 2:

Set-Mailbox -Identity dsmith `
-LitigationHoldEnabled $true `
–RetentionComment “You are currently on litigation hold”


#example 3:

Get-Mailbox -ResultSize Unlimited `
  -Filter {LitigationHoldEnabled -eq $true}

