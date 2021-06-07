<#
Open a PowerShell window, type this:
. ".\sctdraft.ps1"
...then type "SCT" and press enter.
#>

function SCT 
{
$scttable = (Get-Content C:\SCTTableTXT-JSON.txt | ConvertFrom-JSON -AsHashtable)

[string]$sctinputStr = Read-Host "Type shorthand, press enter." 

$sctinput = $sctinputStr.Split(" ")

$outStr ="";


#iterate thru table and look up tokens.
foreach($token in $sctinput)
{

    $outstr+= $Scttable[$token] 

}

$outStr | 
    Set-Clipboard
sct #this reloads the function, but is probably a suboptimal way to do so.
}
