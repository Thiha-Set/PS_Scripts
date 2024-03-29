# @: Permanently clears everything in a certain directory (without removing the parent directory)
# WARNING: DANGEROUS. USE WITH CAUTION. ANY DELETED ITEMS WILL BE UN-RECOVERABLE. 
 do {
    $path = Read-Host "Enter an absolute path to a directory you want to clear (WARNING: ALL CONTENTS IN THE DIRECTORY WILL BE PERMANENTLY LOST, USE WITH CAUTION)"
        
    try {
        Start-Job {
            $path = $using:path
            cd $path

            rm * -Recurse 
        } | Receive-Job -Wait -AutoRemoveJob

        Write-Host "Contents in $($path) have been cleared. "

        $continueFlag = Read-Host "Would you like to specify another directory to clear? Type 1 For Yes and 0 for No"
        while ($continueFlag -ne 1 -and $continueFlag -ne 0) {
            $continueFlag = Read-Host "Invalid Entry. Please type 1 or 0 to end or continue execution."
        }
        if ($continueFlag -eq 1) { continue; } else { break; } 
    }
    catch {
        $_
    }
    finally {
        Write-Host "here."
    }
}
while ($true)
    

