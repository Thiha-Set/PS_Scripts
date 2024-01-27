$interval = Read-Host "Enter the interval (in seconds) for which the list of processes will be generated"
do{ 
    $date = Get-Date -Format "MM_dd_yyyy"

    $processDetails = Get-Process * | Sort-Object -Descending -Property CPU* | Select-Object -Property CPU*, Id, ProcessName | Select-Object -Property @{e={$_.CPU};l="CPU Time"},@{e={$_.Id};l="PID"},@{e={$_.ProcessName};l="Process Name"}, @{e={(Get-Date -Format "MM/dd/yyyy")};l="Scan Date"}, @{e={(Get-Date -Format "hh:mm:ss")};l="Scan Time"}

    if(-not(Test-Path "./process_scans/")){
        mkdir "./process_scans";
    }
    
    $processDetails | Export-Csv "./process_scans/process_scan_$($date).csv" -NoTypeInformation -Append

    Start-Sleep -Seconds $interval
}
while($true)