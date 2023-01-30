oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\capr4n.omp.json | Invoke-Expression
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
Set-PSReadLineOption -PredictionSource History
Import-Module -Name Terminal-Icons
$Env:http_proxy="http://127.0.0.1:11223";
$Env:https_proxy="http://127.0.0.1:11223";
Set-Alias code '~\.local\bin\lvim.ps1'
function vi {neovide -- -u ~\AppData\Roaming\lunarvim\lvim\init.lua}
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
