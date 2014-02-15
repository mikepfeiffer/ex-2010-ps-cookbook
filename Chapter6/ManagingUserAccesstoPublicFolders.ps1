#example 1:

Add-PublicFolderClientPermission -Identity \Marketing `
-User Mike `
-AccessRights Owner `
-Server MBX1

#example 2:

Get-PublicFolderClientPermission \Marketing

#example 3:

Get-PublicFolder -Recurse | 
  ?{$_.Name -ne 'IPM_SUBTREE'} | 
    Get-PublicFolderClientPermission

#example 4:

Remove-PublicFolderClientPermission \Marketing `
-User Mike `
-AccessRights Owner `
-Confirm:$false

#example 5:

Set-Location $exscripts

.\ReplaceUserWithUserOnPFRecursive.ps1 -TopPublicFolder \ `
-UserOld administrator `
-UserNew Mike

.\ReplaceUserPermissionOnPFRecursive.ps1 -TopPublicFolder \ `
-User administrator `
-Permissions Reviewer

.\RemoveUserFromPFRecursive.ps1 -TopPublicFolder \ -User sysadmin
