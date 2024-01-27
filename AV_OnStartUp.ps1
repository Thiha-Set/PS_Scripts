$scanJob = Start-Job -ScriptBlock {    Start-MpScan -ScanType FullScan }

Get-Job

Receive-Job -Job $scanJob -Wait

Write-Host "Scan finished."