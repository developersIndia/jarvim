<#
TODO: Add documentations
TODO: Make the first release & configure the script to download from there
TODO: Refactor & simplify the execution flow, if possible get rid of using Git
#>

$JarvimDir = Resolve-Path -Path "$ENV:USERPROFILE\Downloads\Jarvim"

try {
  git | Out-Null
}
catch [System.Management.Automation.CommandNotFoundException] {
  Write-Error "Git is either not installed or not available at $PATH. Please ensure it's installed & configured"
}

if ( Test-Path -Path $JarvimDir ) {
  Write-Host "Updating Jarvim with the latest changes & commits"
  Set-Location -Path $JarvimDir
  Invoke-Expression -Command "git pull --quiet"
}
else {
  New-Item -Path "$ENV:USERPROFILE\Downloads" -Name "Jarvim" -ItemType "directory" -Force | Out-Null
  Invoke-Expression -Command "git clone --quiet https://github.com/Jarmos-san/jarvim.git $JarvimDir"
  Write-Host "Downloading the necessary files to $JarvimDir"
}
