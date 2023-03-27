#PowerShell -ExecutionPolicy Bypass

$ImportPath = Join-Path -Path $pwd -ChildPath "data.txt"
$ExportPath = Join-Path -Path $pwd -ChildPath "elevation.txt"
$FILE = Get-Content $ImportPath

If (Test-Path $ExportPath) {
    Remove-Item $ExportPath
}

foreach ($LINE in $FILE){
	$Response = Invoke-WebRequest -URI $LINE.Split(' ')[1]
	$ParseResponse = $Response.Content | Out-String | ConvertFrom-Json
	if($ParseResponse.results.elevation -eq $null){
		($LINE.Split(' ')[0] + " 0") >> $pwd\elevation.txt
	}else{
	($LINE.Split(' ')[0] + " " + $ParseResponse.results.elevation) >> $pwd\elevation.txt
	Start-Sleep -Seconds 1
	}
}