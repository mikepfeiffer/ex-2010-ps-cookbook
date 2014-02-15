#example 1:

Get-PublicFolderStatistics | ft Name,ItemCount,TotalItemSize

#example 2:

Get-PublicFolderItemStatistics -Identity \Marketing

Get-PublicFolderItemStatistics -Identity \Marketing | 
  ?{$_.LastModificationTime -le "12/31/2008"}

#example 3:

Set-Location $exscripts

.\AggregatePFData.ps1 -Publicfolder \Marketing
