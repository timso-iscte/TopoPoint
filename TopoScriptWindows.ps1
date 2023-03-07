$FilePath = Join-Path -Path $pwd -ChildPath "dados.txt"
$FILE = Get-Content $FilePath
foreach ($LINE in $FILE){
	$Response = Invoke-WebRequest -URI $LINE.Split(' ')[1]
	$ParseResponse = $Response.Content | Out-String | ConvertFrom-Json
	
	Write-Output ($LINE.Split(' ')[0] + " " + $ParseResponse.results.elevation)

}