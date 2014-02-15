#example 1:

Set-RpcClientAccess -Server cas1 -EncryptionRequired $true

#example 2:

Get-ClientAccessServer | 
  Set-RpcClientAccess -EncryptionRequired $false

#example 3:

$servers = (Get-ClientAccessArray -Identity CASArray01).Members
$servers | %{
  Set-RpcClientAccess -Server $_.name -EncryptionRequired $true
}

#example 4:

Set-MailboxServer -Identity mbx1 -MAPIEncryptionRequired $true
