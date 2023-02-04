$tasksToKill = @(
    "Common Files\Acronis\CDP\afcdpsrv.exe", 
    "Common Files\Acronis\SyncAgent\syncagentsrv.exe",
    "Common Files\Acronis\ActiveProtection\anti_ransomware_service.exe", 
    "Acronis\Agent\aakore.exe", 
    "Acronis\Agent\bin\adp-agent.exe",
    "Acronis\Agent\bin\adp-rest-util.exe",
    "Acronis\Agent\bin\bckp_amgr.exe",
    "Acronis\Agent\bin\grpm-mini.exe",
    "Acronis\Agent\bin\monitoring-mini.exe",
    "Acronis\Agent\bin\task-manager.exe",
    "Acronis\Agent\bin\updater.exe"
);

foreach ($task in $tasksToKill)
{
    $fileName = (Split-Path $task -Leaf);
    $fullPath = "${Env:ProgramFiles(x86)}\$($task)";

    # Killing processes
    $task = Get-Process -Name $fileName -ErrorAction SilentlyContinue
    if ($task) {
        Write-Host "Killing process '$($fileName)..."
        $task |Stop-Process -Force;
        Write-Host "Process '$($fileName) killed successfully !"
    } else {
        Write-Host "The process '$fileName' was not found.";
    }

    # Renaming executables
    if(Test-Path -Path $fullPath -PathType Leaf) {
        Write-Host "Renaming file '$($fullPath)'...";
        Rename-Item -Path $fullPath -NewName "$($fileName)_RENAME";
        Write-Host "The file '$($fullPath)' was renamed successfully !";
    } else {
        Write-Host "The file '$($fullPath)' was not found. Skipping rename...";
    }

    Write-Host "`n";
}