# oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\uew.omp.json | Invoke-Expression
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile))
{
  Import-Module "$ChocolateyProfile"
}
# Import-Module -Name Terminal-Icons
$Env:http_proxy="http://127.0.0.1:11223";
$Env:https_proxy="http://127.0.0.1:11223";
Set-Alias z '~\.local\bin\lvim.ps1'
function vi
{neovide --multigrid --noidle -- -u ~\AppData\Roaming\lunarvim\lvim\init.lua
}
function java8()
{
  [System.Environment]::SetEnvironmentVariable('JAVA_HOME', 'D:\softs\Java\jdk1.8.0_271' , 'Machine')
  [System.Environment]::GetEnvironmentVariable('JAVA_HOME', 'Machine')
}
function java11()
{
  [System.Environment]::SetEnvironmentVariable('JAVA_HOME', 'D:\softs\Java\jdk-11.0.16.1' , 'Machine')
  [System.Environment]::GetEnvironmentVariable('JAVA_HOME', 'Machine')
}
function java17()
{
  [System.Environment]::SetEnvironmentVariable('JAVA_HOME', 'D:\softs\Java\jdk-17' , 'Machine')
  [System.Environment]::GetEnvironmentVariable('JAVA_HOME', 'Machine')
}
function java18()
{
  [System.Environment]::SetEnvironmentVariable('JAVA_HOME', 'D:\development\Java\jdk-18.0.2.1' , 'Machine')
  [System.Environment]::GetEnvironmentVariable('JAVA_HOME', 'Machine')
}
function ngx
{
  cd "$Env:NGINX_HOME"
}
function stopn
{
  taskkill /f /im nginx.exe
}
function pw
{Set-Location ~/Documents/PowerShell
}
function pg
{Set-Location ~\AppData\Roaming\lunarvim\site\pack\lazy\opt
}
function www
{
  Set-Location d:/www
}
function bs
{
  browser-sync start --server --watch --files .
}
function app
{
  Set-Location d:/www/mmt-pes-app
}
function dev
{
  Set-Location d:/development
}
function transform
{
  Set-Location d:/www/mes-transform-management-web
}
function plan
{
  Set-Location d:/www/mes-production-planning-web
}
function schedule
{
  Set-Location d:/www/mmt-schedule-web
}
function tech
{
  Set-Location d:/tech-preview
}
function proc
{
  Set-Location d:/www/mes-process-management-web
}
function base
{
  Set-Location d:/www/mmt-base-web
}
function auth
{
  Set-Location d:/www/mmt-auth-web
}
function zmy
{
  Set-Location d:/www/personal
}
function cfg
{
  Set-Location ~/AppData/Local/lvim/
}
function arch
{
  wsl -d Arch
}
function tc
{taskkill /f /im clash.exe
}
function spa
{yarn start:spa
}
function gs
{git status
}
function gpd
{git pull origin dev
}
function gpa
{git pull origin dev-mes
}
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

$curUser    = (Get-ChildItem Env:\USERNAME).Value
$curComp    = (Get-ChildItem Env:\COMPUTERNAME).Value
$pvmaj      = $Host.Version.Major
$pvmin      = $Host.Version.Minor
$psversion  = "$pvmaj.$pvmin"
$identity   = "$curUser@$curComp"

#-----------------------------------------------------
# WINDOW TITLE
#-----------------------------------------------------
$Host.UI.RawUI.WindowTitle = "PowerShell"
#-----------------------------------------------------


#-----------------------------------------------------
# CONFIG
# Edit following to your convenience
#-----------------------------------------------------
$line1      = "💻 Windows PowerShell"    # First line
$line2      = "📦 Version $psversion"    # Second line
$line3      = "👨 $identity"             # Third line
$line4      = "🎉 Happy coding!"         # Fourth line

# $line1color = "Cyan"                     # First line color
$line1color = "White"                     # First line color
$line2color = "White"                    # Second line color
# $line3color = "Yellow"                   # Third line color
$line3color = "White"                   # Third line color
# $line4color = "Green"                    # Fourth line color
$line4color = "White"                    # Fourth line color

$bgColor    = 'Magenta'                  # Background Color
$padding    = 2                          # Padding
#-----------------------------------------------------


# Calculate max length based on four lines above
$lengths    = [array] $line1.tostring().Length, $line2.tostring().Length, $line3.tostring().Length, $line4.tostring().Length
$size       = $lengths | measure -Maximum
$max        = $size.Maximum


#-----------------------------------------------------
# WELCOME MESSAGE
#-----------------------------------------------------
Write-Host " "
Write-Host ((" " * $padding), (" " * ($max[0]+1)), (" " * $padding)) -BackgroundColor $bgColor;
Write-Host ((" " * $padding), (" " * ($max[0]+1)), (" " * $padding)) -BackgroundColor $bgColor;
Write-Host ((" " * $padding), ("$line1"), (" " * ($max[0]-($line1.Length))), (" " * $padding)) -BackgroundColor $bgColor -ForegroundColor $line1color;
Write-Host ((" " * $padding), ("$line2"), (" " * ($max[0]-($line2.Length))), (" " * $padding)) -BackgroundColor $bgColor -ForegroundColor $line2color;
Write-Host ((" " * $padding), ("$line3"), (" " * ($max[0]-($line3.Length))), (" " * $padding)) -BackgroundColor $bgColor -ForegroundColor $line3color;
Write-Host ((" " * $padding), ("$line4"), (" " * ($max[0]-($line4.Length))), (" " * $padding)) -BackgroundColor $bgColor -ForegroundColor $line4color;
Write-Host ((" " * $padding), (" " * ($max[0]+1)), (" " * $padding)) -BackgroundColor $bgColor;
Write-Host ((" " * $padding), (" " * ($max[0]+1)), (" " * $padding)) -BackgroundColor $bgColor;
Write-Host " "
Write-Host " "
