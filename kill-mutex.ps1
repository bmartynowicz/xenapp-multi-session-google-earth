#
# Close-GoogleEarthMutex.ps1
#
# pass an application name in and close the google earth mutex
# You will need to download sysinternal tool Process Handler credit to Mark Russinovich of Sys Internals fame 
# https://docs.microsoft.com/en-us/sysinternals/downloads/handle
#
# 

$scriptPath = Split-Path $script:MyInvocation.MyCommand.Path
$handleExePath = "$scriptPath\handle.exe"

if(-not (Test-Path $handleExePath))
{
	throw "Handle.exe not found, please run script from handle.exe location"
}


Write-Host "Finding Mutex Id and Process ID for Google Earth"
$handleOutput = &$handleExePath -a "\BaseNamedObjects\Google Earth Google Mountain View" -nobanner

if([string]$handleOutput -match "googleearth.exe\s+pid: (\d+)\s+type: Mutant\s+(.+):.+")
{
	$processid = $Matches[1]
	$mutexid = $Matches[2]
	Write-Host "Found Process id: $processid and Mutex Id: $mutexid for google earth"
}
else
{
	Write-Host "No pid or mutex not found...hopefully you never hit this line but output is below:"
	$handleOutput
	throw "Mutex or process Id not found"
}

Write-Host "Closing mutex"
&$handleExePath -c $mutexid -p $processid -y
