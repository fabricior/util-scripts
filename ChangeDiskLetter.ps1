# Assign a fixed letter to a drive. Useful for external USB drives.

# To find the Serial number of your device, just run get-disk

$serialNumber = "<your serial number here>"
$letter = "H"
$diskNumber = -1
try
{
    $diskNumber = (get-disk -SerialNumber $serialNumber -ErrorAction Stop).Number
    Write-Host "Drive with S/N " $serialNumber " was found " -ForegroundColor Cyan
}
catch
{
    Write-Host "Drive with S/N " $serialNumber " not found. Have you plugged in an unknown drive?" -ForegroundColor Yellow
}


if ($diskNumber -ne -1)
{
    Get-Partition -DiskNumber $diskNumber | Set-Partition -NewDriveLetter $letter
}

