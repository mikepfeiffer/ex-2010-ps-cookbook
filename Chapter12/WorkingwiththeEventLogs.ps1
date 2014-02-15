#example 1:

Get-Content C:\servers.txt |
Where-Object {Test-Connection $_ -Quiet -Count 1} |
Foreach-Object {
Get-Service *exch* -ComputerName $_
}

#example 2:

Get-EventLog -LogName Application -Source *exch* -EntryType Error

#example 3:

Get-EventLog -LogName Application -Source *exch* -EntryType Error

#example 4:

[string]$report = ""
Get-MailboxServer | select -expand Name | Foreach-Object{
$date = (Get-Date).AddDays(-7)
$report += Get-WinEvent `
-LogName Microsoft-Exchange-HighAvailability/Operational `
-ComputerName $_ |
Where-Object {($_.LevelDisplayName -eq 'Error') -and `
($_.TimeCreated -gt $date)} |
select MachineName,TimeCreated,Id,ProviderName,Message |
ConvertTo-Html
}
Send-MailMessage -To administrator@contoso.com `
-From powershell@contoso.com `
-Subject "Event Log Errors" `
-Body $report `
-BodyAsHtml `
-SmtpServer cas1

