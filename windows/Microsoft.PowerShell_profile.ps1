# idk, this doesn't work. who cares
# Import-Module gsudoModule
#

function sbrc { . $PROFILE }

function which {
    param(
        [string]$CommandName
    )

   try {
        $source = (Get-Command $CommandName -ErrorAction Stop).Source
        Write-Host "Found: $source"
    }
    catch {
        Write-Host "Command '$CommandName' not found!" -ForegroundColor Red
    }
}


function prompt {
    Write-Host "PS " -NoNewline -ForegroundColor Green
    $displayPath = (Get-Location).Path -replace [regex]::Escape($HOME), '~'
    Write-Host $displayPath -NoNewline -ForegroundColor Blue
    #Write-Host " ❯" -NoNewline -ForegroundColor White
    return "❯ " # return empty string, basically tells pwsh that i'm handling the whole prompt, so don't put a prompt char like >
}
