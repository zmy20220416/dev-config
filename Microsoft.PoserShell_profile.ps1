# oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\uew.omp.json | Invoke-Expression
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile))
{
  Import-Module "$ChocolateyProfile"
}
# Import-Module -Name Terminal-Icons
$Env:http_proxy="http://127.0.0.1:11223";
$Env:https_proxy="http://127.0.0.1:11223";
$Env:OPENAI_API_KEY="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"
$Env:GITHUB_HOME="D:\github\"
$Env:CODE_HOME="D:\www\"
# $Env:OPENAI_API_KEY2="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"
# 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
# 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
# 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
# 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
# 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
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
  Set-Location "$Env:NGINX_HOME"
}
function github
{
  Set-Location "$Env:GITHUB_HOME"
}
function stopn
{
  taskkill /f /im nginx.exe
}
function work
{
  Set-Location D:\张衡\每周工作汇总
}
function pw
{Set-Location ~/Documents/PowerShell
}
function pg
{Set-Location ~\AppData\Roaming\lunarvim\site\pack\lazy\opt
}
function www
{
  Set-Location "$Env:CODE_HOME"
}
function bs
{
  browser-sync start --server --watch --files .
}
function app
{
  Set-Location "$Env:CODE_HOME\mmt-pes-app"
}
function dev
{
  Set-Location d:/development
}
function transform
{
  Set-Location "$Env:CODE_HOME\mes-transform-management-web"
}
function plan
{
  Set-Location "$Env:CODE_HOME\mes-production-planning-web"
}
function track
{
  Set-Location "$Env:CODE_HOME\mes-production-process-web"
}
function schedule
{
  Set-Location "$Env:CODE_HOME\mmt-schedule-web"
}
function tech
{
  Set-Location d:/tech-preview
}
function proc
{
  Set-Location "$Env:CODE_HOME\mes-process-management-web"
}
function base
{
  Set-Location "$Env:CODE_HOME\mmt-base-web"
}
function auth
{
  Set-Location "$Env:CODE_HOME\mmt-auth-web"
}
function zmy
{
  Set-Location "$Env:CODE_HOME\personal"
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
{
  taskkill /f /im clash.exe
}
function spa
{
  yarn start:spa
}
function gs
{
  git status
}
function gpd
{
  git pull origin dev
}
function gpa
{
  git pull origin dev-mes
}
function gb 
{
  git branch
}
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# $curUser    = (Get-ChildItem Env:\USERNAME).Value
# $curComp    = (Get-ChildItem Env:\COMPUTERNAME).Value
# $pvmaj      = $Host.Version.Major
# $pvmin      = $Host.Version.Minor
# $psversion  = "$pvmaj.$pvmin"
# $identity   = "$curUser@$curComp"

#-----------------------------------------------------
# WINDOW TITLE
#-----------------------------------------------------
# $Host.UI.RawUI.WindowTitle = "PowerShell"
#-----------------------------------------------------


#-----------------------------------------------------
# CONFIG
# Edit following to your convenience
#-----------------------------------------------------
# $line1      = "💻 Windows PowerShell"    # First line
# $line2      = "📦 Version $psversion"    # Second line
# $line3      = "👨 $identity"             # Third line
# $line4      = "🎉 Happy coding!"         # Fourth line

# # $line1color = "Cyan"                     # First line color
# $line1color = "White"                     # First line color
# $line2color = "White"                    # Second line color
# # $line3color = "Yellow"                   # Third line color
# $line3color = "White"                   # Third line color
# # $line4color = "Green"                    # Fourth line color
# $line4color = "White"                    # Fourth line color

# $bgColor    = 'Magenta'                  # Background Color
# $padding    = 2                          # Padding
# #-----------------------------------------------------


# # Calculate max length based on four lines above
# $lengths    = [array] $line1.tostring().Length, $line2.tostring().Length, $line3.tostring().Length, $line4.tostring().Length
# $size       = $lengths | measure -Maximum
# $max        = $size.Maximum


# #-----------------------------------------------------
# # WELCOME MESSAGE
# #-----------------------------------------------------
# Write-Host " "
# Write-Host ((" " * $padding), (" " * ($max[0]+1)), (" " * $padding)) -BackgroundColor $bgColor;
# Write-Host ((" " * $padding), (" " * ($max[0]+1)), (" " * $padding)) -BackgroundColor $bgColor;
# Write-Host ((" " * $padding), ("$line1"), (" " * ($max[0]-($line1.Length))), (" " * $padding)) -BackgroundColor $bgColor -ForegroundColor $line1color;
# Write-Host ((" " * $padding), ("$line2"), (" " * ($max[0]-($line2.Length))), (" " * $padding)) -BackgroundColor $bgColor -ForegroundColor $line2color;
# Write-Host ((" " * $padding), ("$line3"), (" " * ($max[0]-($line3.Length))), (" " * $padding)) -BackgroundColor $bgColor -ForegroundColor $line3color;
# Write-Host ((" " * $padding), ("$line4"), (" " * ($max[0]-($line4.Length))), (" " * $padding)) -BackgroundColor $bgColor -ForegroundColor $line4color;
# Write-Host ((" " * $padding), (" " * ($max[0]+1)), (" " * $padding)) -BackgroundColor $bgColor;
# Write-Host ((" " * $padding), (" " * ($max[0]+1)), (" " * $padding)) -BackgroundColor $bgColor;
# Write-Host " "
# Write-Host " "
