#@: apply all possible updates for all modules
$update_results = Start-Job{
    Update-Module
} | Receive-Job -Wait -AutoRemoveJob