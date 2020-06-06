# スクリプト自身のパスまでのディレクトリ
$scriptPath = Split-Path -Parent ($MyInvocation.Mycommand.Path)
Write-Host $scriptPath
$lists = (Get-Content 'lists.txt') -as [string[]]

foreach($list in $lists) {
	if(Test-Path $list -PathType Container) {
		New-Item -ItemType Directory 
	}
}
# foreach ($target in $fileLists) {
# 	$targetPath = $scriptPath + "\" + $target
# 	$targetPath = $targetPath -replace "/", "\"
# 	Write-Host $targetPath
# 	$session.PutFiles($targetPath, $remotePath).Check()
# }
