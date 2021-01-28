#!/usr/bin/env pwsh

function Invoke-ShellgeiBot
{

    Param
    (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$false Position=0)]
        [String] $Code,

        [Parameter(Mandatory=$false, ValueFromPipeline=$false, ValueFromPipelineByPropertyName=$false, Position=1)]
        [String[]] $ImagePath,

        [Parameter(Mandatory=$false, ValueFromPipeline=$false, ValueFromPipelineByPropertyName=$false)]
        [Switch] $ShowImage
    )

    Set-Variable -Option Constant -Name URI -Value "https://websh.jiro4989.com/api/shellgei"

    # Check parameters
    if ($ImagePath.Length -gt 4)
    {
        Write-Error "Too many image path arguments. You can specify up to 4 image paths."
        return
    }

    $encodedImages = @()
    foreach ($path in $ImagePath)
    {
        # Convert image file to Base64 string
        $encodedImages += [Convert]::ToBase64String([IO.File]::ReadAllBytes($path))
    }

    $body = @{
        code = $Code
        images = $encodedImages
    } | ConvertTo-Json

    Write-Information $request

    # Send a request to the API
    $result = Invoke-RestMethod -Method POST -Uri $URI -Body $body

    # Print stdout of result
    Write-Output $result.stdout

    # Print stderr of result
    if ($result.stderr -ne "") 
    {
        Write-Error "$($result.stderr)"
    }

    # Save image to file
    foreach ($resultImg in $result.images)
    {
        $outImageFileName = "{0}.{1}" -f "ShellgeiBot_$(Get-Random)", $resultImg.format
        $outImagePath = Join-Path -Path ([IO.Path]::GetTempPath()) -ChildPath $outImageFileName

        $binaryImage = [Convert]::FromBase64String($resultImg.image)

        # Write binary image to file
        [IO.File]::WriteAllBytes($outImagePath, $binaryImage)

        # Open image file via default viewer
        if ($ShowImage)
        {
            Invoke-Item $outImagePath
        }
    }
}
