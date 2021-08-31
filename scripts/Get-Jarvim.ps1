try {
    git | Out-Null
}
catch [System.Management.Automation.CommandNotFoundException] {
    Write-Error "Git is either not installed or not available at $PATH. Please ensure it's installed & configured"
}

if ( Test-Path -Path $ENV:USERPROFILE\Downloads\Jarvim ) {
    Write-Host "It appears a folder named Jarvim already exists, not downloading it again"
} else {
    New-Item -Path "$ENV:USERPROFILE\Downloads" -Name "Jarvim" -ItemType "directory" -Force | Out-Null
    Invoke-Expression "git clone --quiet https://github.com/Jarmos-san/jarvim.git $ENV:USERPROFILE\Downloads\Jarvim"
    Write-Host "Downloading the necessary files to $ENV:USERPROFILE\Downloads\Jarvim"
}
