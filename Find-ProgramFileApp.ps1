$ApplicationName = Read-Host "Enter name of Application"

try {
    if (-not(Test-Path "./scriptResults/")) {
        mkdir "./scriptResults"
    }
    
    $prodData = (Get-CimInstance -ClassName Win32_Product -Filter "Name LIKE '%$($ApplicationName)%'" | Select-Object Name, Version, InstallSource, InstallLocation | Sort-Object -Property Name)
    
    
    $date = Get-Date -Format "MM_dd_yyyy hh_mm_ss tt"
    
    $prodData | Export-Csv -Path "./scriptResults/applicationQueryResults_$($date).csv" -NoTypeInformation
    
    Write-Host "Results exported to ./scriptResults/applicationQueryResults_$($date).csv" -ForegroundColor Green
}
catch {
    Write-Host "An error occurred." -ForegroundColor Magenta
}


