# @: Run AntiVirus Scan in the background as a job.
try {
    #CHANGE THIS TO EITHER: QuickScan or FullScan, depending on what type of scan you want 
    $scanType = "FullScan"

    $scanJob = Start-Job -ScriptBlock { Start-MpScan -ScanType $scanType }

    Receive-Job -Job $scanJob -Wait -AutoRemoveJob

    Write-Host "Scan finished."
}
catch {
    $_
}