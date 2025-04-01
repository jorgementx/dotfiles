# oh-my-posh init pwsh | Invoke-Expression
Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons
Set-PSReadLineOption -PredictionViewStyle ListView

# Alias
Set-Alias vim nvim
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
function la {
    param (
        [string]$directory = "."
    )
    Get-ChildItem -Force -Path $directory
}
function l {
    param (
        [string]$directory = "."
    )
    Get-ChildItem -Path $directory | Format-Wide -AutoSize
}
Set-Alias ll Get-ChildItem
Set-Alias ls l