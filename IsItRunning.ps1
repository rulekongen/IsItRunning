if (Test-Path config.cfg) {
    $vProgramlist = Get-Content config.cfg
    Write-Output "Loaded config.cfg"
    [System.Collections.ArrayList]$vProcessStatus = @()

    foreach($tProgram in $vProgramlist) {
        Write-Output "Checking if $tProgram is running..."
        $vProcess = Get-Process $tProgram -ErrorAction SilentlyContinue

        if($vProcess)
        {
            Write-Output "$tProgram is running"
            $vProcessStatus.Add("$tProgram-running")
        } else {
            Write-Output "$tProgram is not running"
            $vProcessStatus.Add("$tProgram-stopped")
        }
    }
    
    Set-Content status.log -Value $vProcessStatus

} else {
    Write-Output "Could not find config.cfg"
    Write-Error "Could not find config.cfg"
}

