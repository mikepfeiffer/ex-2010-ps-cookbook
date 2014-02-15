#example 1:

$objDomain = [ADSI]''
$objOU = $objDomain.Create('organizationalUnit', 'ou=HAB')
$objOU.SetInfo()

New-DistributionGroup -Name ContosoRoot `
-DisplayName ContosoRoot `
-Alias ContosoRoot `
-OrganizationalUnit contoso.com/HAB `
-SamAccountName ContosoRoot `
-Type Distribution

Set-OrganizationConfig -HierarchicalAddressBookRoot ContosoRoot

Add-DistributionGroupMember -Identity ContosoRoot -Member Executives
Add-DistributionGroupMember -Identity ContosoRoot -Member Finance 
Add-DistributionGroupMember -Identity ContosoRoot -Member Sales

Set-Group -Identity ContosoRoot -IsHierarchicalGroup $true
Set-Group Executives -IsHierarchicalGroup $true -SeniorityIndex 100
Set-Group Finance -IsHierarchicalGroup $true -SeniorityIndex 50
Set-Group Sales -IsHierarchicalGroup $true -SeniorityIndex 75

#example 2:

Set-User cmunoz -SeniorityIndex 100
Set-User awood -SeniorityIndex 90
Set-User ahunter -SeniorityIndex 80
