#example 1:

Get-DatabaseAvailabilityGroupNetwork 

#example 2:

Set-DatabaseAvailabilityGroup -Identity DAG –DiscoverNetworks

#example 3:

Set-DatabaseAvailabilityGroupNetwork -Identity DAG\DAGNetwork02 `
-ReplicationEnabled $false

#example 4:

Set-DatabaseAvailabilityGroupNetwork -Identity DAG\DAGNetwork04 `
-IgnoreNetwork $true

#example 5:

Get-DatabaseAvailabilityGroupNetwork 

Remove-DatabaseAvailabilityGroupNetwork -Identity DAG\DAGNetwork02 `
-Confirm:$false

Set-DatabaseAvailabilityGroupNetwork -Identity DAG\DAGNetwork03 `
-Name DAGNetwork02
