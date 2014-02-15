#example 1:

Get-Counter –Counter '\\cas1\MSExchange OWA\Current Users'

Get-Counter '\\cas1\MSExchange RpcClientAccess\User Count'

#example 2:

Get-Counter 'MSExchange OWA\Current Unique Users' `
-ComputerName cas1,cas2

#example 3:

Get-Counter -ListSet *owa* -ComputerName cas1 | 
  Select-Object -expand paths

#example 4:

function Get-CASActiveUsers {
  [CmdletBinding()]
  param(
    [Parameter(Position=0, 
      ValueFromPipelineByPropertyName=$true, 
      Mandatory=$true)]
    [string[]]
    $Name
  )

  process {
    $Name | %{
      $RPC = Get-Counter "\MSExchange RpcClientAccess\User Count" `
      -ComputerName $_
      
      $OWA = Get-Counter "\MSExchange OWA\Current Unique Users" `
      -ComputerName $_
      
      New-Object PSObject -Property @{
        Server = $_
        'RPC Client Access' = $RPC.CounterSamples[0].CookedValue
        'Outlook Web App' = $OWA.CounterSamples[0].CookedValue
      }
    }
  }
}
