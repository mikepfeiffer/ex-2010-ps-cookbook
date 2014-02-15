#example 1:

Set-PublicFolder \Marketing -Replicas PFDB1,PFDB2

#example 2:

Set-PublicFolder \Marketing `
-ReplicationSchedule "Friday.06:00 PM-Monday.05:00 AM"


#example 3:

Set-PublicFolder \Marketing -ReplicationSchedule Always

#example 4:

Set-PublicFolder \Marketing -UseDatabaseReplicationSchedule $true

#example 5:

Set-Location $exscripts

.\AddReplicaToPFRecursive.ps1 -TopPublicFolder \ -ServerToAdd MBX2

.\AddReplicaToPFRecursive.ps1 -TopPublicFolder \Non_IPM_Subtree `
-ServerToAdd MBX2

.\MoveAllReplicas.ps1 -Server MBX1 –NewServer MBX2
