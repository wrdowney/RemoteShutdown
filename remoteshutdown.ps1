param(
    [Parameter()]
    [String]$cmdType,
    [String]$idFile
)

Import-Csv $idFile | ForEach-Object {
    $idName = $($_.ID)
    $delay = $($_.Delay)
    $comment = $($_.Comment)
    Write-Host "Attempting to run ", $cmdType," on: ", $idName
    shutdown /$cmdType /m $idName /t $delay /c $comment
}
