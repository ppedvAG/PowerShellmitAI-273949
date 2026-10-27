[cmdletBinding(DefaultparameterSetName="Parameter")]
param(
[Parameter(Mandatory=$true, ParameterSetName="CSV")]
[ValidateScript({TEst-Path -Path $PSItem -Pathtype Leaf -Filter "*.csv"})]
[string]$CSVPath,

[Parameter(Mandatory=$true, ParameterSetName="Parameter", ValueFromPipeLineByPropertyName=$true)]
[string]$GivenName,

[Parameter(Mandatory=$true, ParameterSetName="Parameter", ValueFromPipeLineByPropertyName=$true)]
[string]$SurName,

[Parameter(Mandatory=$true, ParameterSetName="Parameter", ValueFromPipeLineByPropertyName=$true)]
[string]$Department

)

Begin
{
    Write-Verbose -Message "Der Beginn Block wird einmal zum start ausgeführt, zb. zum Laden von Modulen etc"
    Import-Module -Name ActiveDirectory

    if($PSCmdlet.ParameterSetName -eq "CSV")
    {
        Import-Csv
    }
}
Process
{
    # Der Process Block wird für jedes übergebene Objekt ausgeführt
    $SamAccountName = $GivenName[0] + $SurName[0] + (Get-Random -Maximum 99 -Minimum 1)
    $UPNName = "$GivenName.$Surname@ppedv.kurs"
    $Email = $UPNName

    New-ADUser -GivenName $GivenName -Surname $SurName -SamAccountName $SamAccountName -UserPrincipalName $UPNName -EmailAddress $Email
}
End
{
    Write-Verbose -Message "Wird einmal zum Schluss ausgeführt"
}