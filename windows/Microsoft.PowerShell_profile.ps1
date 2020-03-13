# dir = ~\Documents\WindowsPowerShell
# Proper history etc
Import-Module PSReadLine

# Produce UTF-8 by default
# https://news.ycombinator.com/item?id=12991690
$PSDefaultParameterValues["Out-File:Encoding"] = "utf8"

# https://technet.microsoft.com/en-us/magazine/hh241048.aspx
$MaximumHistoryCount = 10000;



function which($name) {
    Get-Command $name | Select-Object -ExpandProperty definition
}

Set-Alias py python

Set-Alias ipy ipython




#function wget ($url) { (new-object Net.WebClient).DownloadString("$url") }

function explorer {
    explorer.exe .
}

function pkill($name) {
    get-process $name -ErrorAction SilentlyContinue | stop-process
}

function pgrep($name) {
    get-process $name
}

<# not good
#function touch ($file) { echo "" >> $file; }
function touch ($file) { Write-Output "" >> $file; }
#>

# better 
# Like Unix touch, creates new files and updates time on old ones
# PSCX has a touch, but it doesn't make empty files

function touch($file) {
    if ( Test-Path $file ) {
        Set-FileTime $file
    }
    else {
        New-Item $file -type file
    }
}

function df {
    get-volume
}


<#
function grep($regex, $dir) {
	if ( $dir ) {
		get-childitem $dir | select-string $regex
		return
	}
	$input | select-string $regex
}
#>

Set-Alias grep findstr.exe

function reboot {
    shutdown /r /t 0
}

function open($file) {
    invoke-item $file
}