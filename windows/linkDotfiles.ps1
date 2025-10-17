#linkDotfiles.ps1

# some convenient globals
$dotfilesPath = Split-Path $PSScriptRoot -Parent
$homesickHomeDir = Join-Path $dotfilesPath "home"
$homesickWindowsDir = $PSScriptRoot

function Test-GSudo {
    if (!(Get-Command gsudo -ErrorAction SilentlyContinue)) {
        Write-Error "gsudo is required but not installed. Run: scoop install gsudo"
        return $false
    }
    return $true
}

function Link-With-Confirm {
   param(
       [Parameter(Mandatory)]
       [string]$Path,

       [Parameter(Mandatory)]
       [string]$Target
   )

   if (Test-Path $Path) {
       $response = Read-Host "File already exists at $Path. Overwrite? (y/N)"
       if ($response -notmatch '^y(es)?$') {
           Write-Host "Skipping $Path" -ForegroundColor Yellow
           return
       }
       Remove-Item $Path -Force
   }

   # Create parent directory if it doesn't exist
   $parentDir = Split-Path $Path -Parent
   if ($parentDir -and !(Test-Path $parentDir)) {
       New-Item -ItemType Directory -Path $parentDir -Force | Out-Null
   }

   gsudo New-Item -ItemType SymbolicLink -Path $Path -Target $Target -Force
   Write-Host "Linked: $Path -> $Target" -ForegroundColor Green
}

function Windowsify-Gitconfig {

    # Read the source file and replace Unix vim path with Windows
    $content = Get-Content (Join-Path $homesickHomeDir ".gitconfig") -Raw
    $windowsContent = $content -replace '/usr/bin/vim', 'vim.exe'

    # Write the windowsified version
    Set-Content -Path (Join-Path $homesickWindowsDir ".gitconfig") -Value $windowsContent -Encoding UTF8
}

function Windowsify-Dotfiles {
    Windowsify-Gitconfig
}

function Main {

    if (!(Test-GSudo)) { exit 1 }


    # Note to self: remember, when doing these links, that we need special windows-ified versions of
    # certain files, and that those files don't live in the typical homesick home dir, but rather right here
    # in the windows specific dir.

    # We run this to process various tweaks to files for Windows life:
    Windowsify-Dotfiles

    # tricky one here, because apparently the powershell equivalent of bashrc goes in ... Documents
    $pwshProfileCastlePath = (Join-Path $PSScriptRoot "Microsoft.PowerShell_profile.ps1")
    $pwshProfileDocumentsPathYesReallyDocuments = (Join-Path $HOME "Documents\PowerShell\Microsoft.PowerShell_profile.ps1")
    Link-With-Confirm -Path $pwshProfileDocumentsPathYesReallyDocuments -Target $pwshProfileCastlePath


    # files that needed to be windowsified and therefore live in the windows dir
    Link-With-Confirm -Path "$HOME\.gitconfig" -Target "$homesickWindowsDir\.gitconfig"

    # files that work across platforms without modifications come from the regular home dir
    Link-With-Confirm -Path "$HOME\.vimrc" -Target "$homesickHomeDir\.vimrc"
}

Main
