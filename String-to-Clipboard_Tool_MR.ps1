<#
Figure out how to:
1.) (Done) Turn it into a function or script that will 'reload itself' after being run...
1.5) ...and which you would have to exit out of...
2.) (Done) Read from an external table instead of a hashtable...
3.) When the user enters something not on the value table, present them with the prompt (and maybe tell them "shorthand not found") instead of the error.
#>

function SCT 
{
{
$scttable = (Get-Content .\SCTTableTXT-JSON.txt | ConvertFrom-JSON -AsHashtable)
}

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
sct #this reloads the function, however I am sure there is a better way.
}
