$hostPath = Read-Host "Enter a path to a list of hostnames"

$hosts = Import-Csv -Path $hostPath | Select-Object -ExpandProperty *
try{
    $adapterResults = foreach($hostName in $hosts){
        $timeToLive = 20
        $connection = Test-Connection -ComputerName $hostName -Count 2 -Quiet -TimeToLive $timeToLive -ErrorAction SilentlyContinue

        if($connection){
            try{
                Invoke-Command -ComputerName $hostName -ScriptBlock{
                    Get-NetAdapter
                } -AsJob | Receive-Job -AutoRemoveJob -Wait -ErrorAction Stop| Select-Object @{e={$_.MacAddress};l="Mac Address"},@{e={$_.ifDesc};l="Adapter"},@{e={$_.DriverInformation};l="Driver Information"},@{e={$null};l="Comments"}
            }
            catch{
                Write-Host "Unable to retrieve network adapter information for $($hostName)" -ForegroundColor Yellow
                "" | Select-Object @{e={$null};l="Mac Address"},@{e={$null};l="Adapter"},@{e={$null};l="Driver Information"},@{e={"Error occurred in retrieving network adapter information for host $($hostName)"};l="Comments"}
            }
        }
        else{
            Write-Host "Error connecting to host $($hostName)" -ForegroundColor 
            "" | Select-Object @{e={$null};l="Mac Address"},@{e={$null};l="Adapter"},@{e={$null};l="Driver Information"},@{e={"Error occurred in connecting to host $($hostName)"};l="Comments"}
        }
    }
}
catch{
    Write-Host "Error importing csv from path $($hostPath)" -ForegroundColor Red
}

