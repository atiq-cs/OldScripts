# Date  : 2011-11-15
# Author: Atiq Rahman
# Date  : 2018-05-09
# Note  : Take care of errors returned by mdelay.ps1 later
# Example usage,
#  Sleep.ps1 5 "Routine human sleep; syncing.."

Param(
  [Parameter(Mandatory=$true)] [alias("a")] [string]$Time,
  [Parameter(Mandatory=$false)] [alias("s")] [string]$Message)

# Verify Action empty
if ([string]::IsNullOrEmpty($Message)) {
  $Message = "going to sleep state"
}

# previous message "Routine human sleep syncing.."
. $Env:PS_SC_DIR\mdelay.ps1 $Time $Message

Write-Host -NoNewline "Message before going to sleep: "
Write-Host -ForegroundColor Green $Message
# ref: https://superuser.com/q/42124
rundll32.exe powrprof.dll,SetSuspendState 0,1,0
