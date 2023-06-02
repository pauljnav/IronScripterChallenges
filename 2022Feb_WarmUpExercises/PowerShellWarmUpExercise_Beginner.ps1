# A PowerShell Warm-Up Exercise
<#
Beginner
Write PowerShell code to take a string like ‘PowerShell’ and display it in reverse. Your solution can be a simple script or function.
Comment edited as an SC test
#>

filter Invoke-ReverseString ([string]$str)
{
    $len = $str.Length
    Write-Output ($str[-1..-$len] -join '')
}

Invoke-ReverseString "ABcd"
