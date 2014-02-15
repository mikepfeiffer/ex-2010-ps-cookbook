#example 1:

[byte[]]$data = Get-Content -Path "C:\Edge.xml" `
-Encoding Byte `
-ReadCount 0

New-EdgeSubscription -FileData $data -Site Default-First-Site

#example 2:

Export-RecipientDataProperty -Identity dsmith -Picture | %{ 
  $_.FileData | Add-Content C:\pics\dsmith.jpg -Encoding Byte
}
