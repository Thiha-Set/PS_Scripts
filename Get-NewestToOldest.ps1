# @: Get the most recent to oldest files/folders in a directory
$dir = Read-Host "Enter absolute path to dir you want sorted from most recent to oldest"
try {
    
    cd $dir

    ls | Select-Object Name, CreationTime, Extension, Attributes | Sort-Object -Property CreationTime -Descending
}
catch {
    Write-Error -Message "Invalid directory or directory not found."
}