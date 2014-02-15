#example 1:

param($Path)

if(Test-Path $Path) {
  switch -wildcard ($env:computername) {
    "*-HCM-*" {$role = "HT,CA,MB"}
    "*-MB-*"  {$role = "MB"}
    "*-CA-*"  {$role = "CA"}
    "*-HT-*"  {$role = "HT"}
    "*-ET-*"  {$role = "ET"}
    "*-UM-*"  {$role = "UM"}
  }
  $setup = Join-Path $Path "setup.com"
  Invoke-Expression "$setup /InstallWindowsComponents /r:$role"
}
else {
  Write-Host "Invalid Media Path!"
}

#example 2:

param($Path)
$site = [DirectoryServices.ActiveDirectory.ActiveDirectorySite]

if(Test-Path $Path) {
  switch ($site::GetComputerSite().Name) {
    "Headquarters" {$role = "MB"}
    Default {$role = "HT,CA,MB"}
  }
  $setup = Join-Path $Path "setup.com"
  Invoke-Expression "$setup /InstallWindowsComponents /r:$role"
}
else {
  Write-Host "Invalid Media Path!"
}
