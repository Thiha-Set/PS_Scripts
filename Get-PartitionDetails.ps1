# @: Retrieve partition (volume) details of a host 
# Outputs can be found in "./partition_info_queries"
if(-not (Test-Path "./partition_info_queries")){
    mkdir "./partition_info_queries"
}

$info = Get-Volume | Where-Object{$_.DriveLetter -ne $null} | Select-Object @{e={$_.DriveLetter};l="Drive Letter"}, @{e={$_.FileSystemLabel};l="Name"}, @{e={$_.DriveType};l="Drive Type"}, @{e={$_.HealthStatus};l="Health"}, @{e={$_.OperationalStatus};l="Status"}, @{e={"$([math]::Round($_.SizeRemaining/1GB, 2)) GB / $([math]::Round($_.Size/1GB, 2)) GB"};l="Size"} | Export-Csv -Path "./partition_info_queries/partitionQuery_$(Get-Date -Format "MM_dd_yyyy hh-mm-ss tt").csv" -NoTypeInformation
