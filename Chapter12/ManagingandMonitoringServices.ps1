#example 1:

Get-Service *exch*

#example 2:

Get-Service *exch* | Where-Object {$_.Status -eq 'Running'}

#example 3:

Get-ExchangeServer | ForEach-Object {
  Get-Service *exch* -ComputerName $_.Name | 
    Where-Object {$_.Status -eq 'Running'}
}


#example 4:

$servers = Get-ExchangeServer | Select-Object -ExpandProperty Name

Get-WmiObject Win32_Service -ComputerName $servers `
-Filter "Name Like '%exch%' AND StartMode='Auto' AND State='Stopped'" | Foreach-Object {$_.StartService()}


#example 5:

Test-ServiceHealth -Server mbx1,mbx2

#example 6:

Get-ExchangeServer | Test-ServiceHealth

#example 7:

Test-ServiceHealth | 
  Select-Object -ExpandProperty ServicesNotRunning | Start-Service


#example 8:

$servers = "mbx1","mbx2","cas1","cas2"

while($true){
  $servers | Foreach-Object {
    $name = $_
    $s = Test-ServiceHealth -Server $name | 
           Select-Object -ExpandProperty ServicesNotRunning

    if($s) {
      $s | Foreach-Object {
        $date = Get-Date

        $wmi = Get-WmiObject Win32_Service -Filter "Name = '$_'" `
        -ComputerName $name
        
        $wmi.StartService()
      
        Send-MailMessage -To administrator@contoso.com `
        -From powershell@contoso.com `
        -Subject "Service Failure on $name" `
        -Body "Attempted to start the $_ service at $date" `
        -SmtpServer cas1      
      }    
    }
  }
  Start-Sleep –Seconds 300
}
