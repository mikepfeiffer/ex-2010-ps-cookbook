#example 1:

$pass = ConvertTo-SecureString -AsPlainText P@ssw0rd01 -Force

Import-CSV C:\Mailboxes.CSV | % {
  New-Mailbox -Name $_.Name `
  -Alias $_.Alias `
  -UserPrincipalName $_.UserPrincipalName `
  -OrganizationalUnit $_.OrganizationalUnit `
  -Password $pass `
  -ResetPasswordOnNextLogon $true
}

#example 2:

Import-CSV C:\Mailboxes.CSV | % {
  $pass = ConvertTo-SecureString -AsPlainText $_.Password -Force
  
  New-Mailbox -Name $_.Name `
  -Alias $_.Alias `
  -UserPrincipalName $_.UserPrincipalName `
  -Password $pass
}


#example 3:

Import-CSV C:\NewMailboxes.CSV | % {
  New-Mailbox -Name $_.Name `
  -FirstName $_.FirstName `
  -LastName $_.LastName `
  -Alias $_.Alias `
  -UserPrincipalName $_.UserPrincipalName `
  -Password $pass
  -OrganizationalUnit $_.OrganiationalUnit
  -Database DB1 `
  -Password (ConvertTo-SecureString -AsPlainText P@ssw0rd -Force)

  Set-User -Identity $_.Name `
  -City $_.City `
  -StateOrProvince $_.State `
  -Title $_.Title `
  -Department $_.Department

  Add-DistributionGroupMember -Identity DL_Sales `
  -Member $_.Name

  Add-DistributionGroupMember -Identity DL_Marketing `
  -Member $_.Name
}
