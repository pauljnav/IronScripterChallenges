# A PowerShell Warm-Up Exercise
<#
https://ironscripter.us/a-powershell-warm-up-exercise/

Intermediate
Your challenge is based on the Beginner exercise. Take a sentence like, “This is how you can
improve your PowerShell skills,” and write PowerShell code to display the entire sentence in
reverse with each word reversed. You should be able to encode and decode text. Ideally, your
functions should take pipeline input.
#>

<#
spec:
function to reverse word named ReverseWord
switch named ReverseWord triggers the function
function sends phrase to ReverseWord as whole sentense, or as an array or words.
#>

function Invoke-ReverseWord
{
    <#
    .SYNOPSIS
         This ReverseWord function takes a string like ‘PowerShell’ and display it in reverse.
    .EXAMPLE
        Invoke-ReverseWord -word "PowerShell"
        This example reverses a single word using named parameter
    .EXAMPLE
        "PowerShell","Beginner","function" | Invoke-ReverseWord
        This example reverses sends multiple words into the pipeline
    .EXAMPLE
        "PowerShell" | Invoke-ReverseWord
        This example reverses a single word using the pipeline
    #>
    param (
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$word
    )
    begin {}
    process {
        $len = $word.Length
        Write-Output ($word[-1.. -($len)] -join '')
    }
    end {}
}

function Invoke-TextReversal
{
    <#
    .SYNOPSIS
        This is the TextReversal function.
    .EXAMPLE
        Invoke-TextReversal "This is how you can improve your PowerShell skills"
        This example reverses an entire phrase - simplest usage.
    .EXAMPLE
        Invoke-TextReversal -phrase "This is how you can improve your PowerShell skills" -ReverseWord
        This example uses the ReverseWord parameter to reverse each word in the phrase.
    .EXAMPLE
        "This is how you can improve your PowerShell skills" | Invoke-TextReversal -ReverseWord
        This example reverses each word in the phrase passed via the pipeline.
    .EXAMPLE
        "This is how you can improve your", "PowerShell skills" | Invoke-TextReversal
        This example reverses two phrases passed via the pipeline.
    #>

    [CmdletBinding()]
    param (
        # The phrase
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('\s')]
        [string[]]$phrase,

        # The ReverseWord option results in reversal of individual words otherwise
        # the phrase itself gets reversed.
        [switch]$ReverseWords
    )

    begin {
    }

    process {
        if ($ReverseWords){
            "Reverse Words:"
            ($phrase.Split() | Invoke-ReverseWord) -join ' '
        }
        else {
            "Reverse Phrase:"
            ($phrase | Invoke-ReverseWord)
        }

    }

    end {}
}

