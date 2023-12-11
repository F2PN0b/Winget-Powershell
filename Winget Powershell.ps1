$close = $true #Asked chatGPT to convert this code from C to powershell, It does work.
$subclose = $true
$appid = "hello"

while ($close -eq $true) {
    Clear-Host
    Write-Host "1. Install app"
    Write-Host "2. Upgrade all"
    Write-Host "3. Show installed"
    Write-Host "0. Leave"
    $input = Read-Host "Type a number & press enter"

    switch ($input) {
        3 {
            winget list
            pause
            break
        }
        2 {
            winget upgrade --all
            break
        }
        1 {
            Clear-Host
            while ($subclose -eq $true) {
                $appid = Read-Host "Type name of an app or type 'exit' to leave"
                Write-Host $appid
                if ($appid -eq "exit") {
                    $subclose = $false
                    break
                }
                Start-Process "winget" -ArgumentList "install", $appid -Wait
            }
            break
        }
        0 {
            $close = $false
            Write-Host "Have a nice day!"
            break
        }
    }
}
