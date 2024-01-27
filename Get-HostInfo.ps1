#@: Retrieve pertinent information about a host
#Namely: OS (OsName), MacAddress (CsName), OS Version (OsVersion)
Get-ComputerInfo -Property "OsName","CsName","OsVersion" | Select-Object -Property @{e={$_.OsName};l="OS"}, @{e={$_.CsName};l="MAC Address"}, @{e={$_.OsVersion};l="OS Version"}