#example 1:

Add-RoleGroupMember -Identity "Server Management" -Member bwelch

#example 2:

Get-ManagementRoleAssignment -RoleAssignee 'Server Management' | 
  Select-Object Role


#example 3:

New-ManagementRoleAssignment -Role ‘Mailbox Import Export’ `
-User administrator


#example 4:

Get-RoleAssignmentPolicy "Default Role Assignment Policy" | 
  Format-List AssignedRoles
