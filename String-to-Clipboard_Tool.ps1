<#
String-to-Clipboard Tool (SCT)
#>

<#
Sequence of how it works:
Invoke sct.ps1?
Enter <hl,how> or any other abbreviated statement
Entry is made into a variable
Variable passed to -split operator by comma
    '$_.' -split ','
Each variable is keyed into $scttable[] 
Save outputted values to an array?
-join operator
    -$sctoutput = $sctarray -join ' '
Set-Clipboard
#>

<#
Taken from the internet:
$hashtable1 = @{Name1="Value1";Name2="Value2"}

function hashfunction {
    Param($hash)
    foreach ($key in $hash.Keys){
         Write-Host $hash[$key]
     }
}

hashfunction -hash $hashtable1

This is appended down the chat with:
When calling the function, you must use @hashtable1 and not $hashtable1. Using the variable name passes the variable as a HashTable object type instead of passing the keys and values.

Example: hashfunction -hash @hashtable1
#>

Set-Variable -Name "01" -Value "hl" #make sure to load $scttable
Set-Variable -Name "02" -Value "hd"
$scttable.$02
$scttable['$01','02'] #Does not print the way .$01 does...

-join ($scttable['hl','how']) #outputs >Hello, how can I help you today?, so that at least works--but how to pipe hashtable values to the -join operator?..
-join ($scttable['hl','how']) | Set-Clipboard #Works as intended--execute this, and you can Ctrl-P Paste "Hello, how can I help you today?"

$hashtable1 = @{Name1="Value1";Name2="Value2"}


$Scttable = @{
hl = "Hello, "
gm = "Good morning,"
ga = "Good afternoon,"
hd = "Howdy,"
bg = "Buongiorno,"
how = "how can I help you today?"
what = "what brings you to our support chat?"
}

function hashfunction {
    Param($hash)
    foreach ($key in $hash.Keys){
         Write-Host $hash[$key]
     }
}

hashfunction -hash $scttable

function sct {$Scttable["$args"]}
sct hl
