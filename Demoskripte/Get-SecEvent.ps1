<#
.SYNOPSIS
 CommentBasedHelp Kurzbeschreibung
.DESCRIPTION
 Lange Beschreibung
.PARAMETER EventId
 4624 Anmeldeevent
 4625 fehlgeschlagene Anmeldung
 4634 Abmeldung
.EXAMPLE
 .\Get-SecEvent.ps1 -EventId 4624
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)]
[int]$EventId,

[ValidateRange(5,20)]
[int]$Newest = 10,

[string]$Computername = "localhost"
)

Write-Verbose -Message "Ermöglicht optionale Ausgaben zu tätigen"

Get-WinEvent -LogName Security -ComputerName $Computername | Where-Object -FilterScript {$PSItem.Id -eq $EventID} | Select-Object -First $Newest