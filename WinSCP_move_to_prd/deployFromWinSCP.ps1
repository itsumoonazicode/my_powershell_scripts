try
{
	$env = ConvertFrom-Json -InputObject (Get-Content ..\env.json -Raw)
	# スクリプト自身のパスまでのディレクトリ
	$scriptPath = Split-Path -Parent ($MyInvocation.Mycommand.Path)

	$fileLists = (Get-Content 'lists.txt') -as [string[]]
	
	# winscp.dll のパス
	Add-Type -Path 'C:\Program Files (x86)\WinSCP\WinSCPnet.dll'
	
	# 接続情報
	$sessionOptions = New-Object WinSCP.SessionOptions -Property @{
		Protocol = [WinSCP.Protocol]::Ftp
		HostName = $env.host
		UserName = $env.username
		Password = $env.password
	}

	$session = New-Object WinSCP.Session

	try
	{
    #connect
		$session.Open($sessionOptions)
		$directory = $session.ListDirectory(".")
		$remotePath = "/test/"

		
		
		foreach($target in $fileLists) {
			$targetPath = $scriptPath + "\" + $target
			$targetPath = $targetPath -replace "/", "\"
			# $files = Get-ChildItem .\target -Recurse | Select-Object -ExpandProperty FullName
			# $parentLocalPath = Split-Path -Parent (Resolve-Path $target)
			$parentLocalPath = $scriptPath
			# Write-Host $scriptPath
			Write-Host $targetPath
			Write-Host $parentLocalPath
			$remoteFilePath = 
				[WinSCP.RemotePath]::TranslateLocalPathToRemote(
					$targetPath, $parentLocalPath, $remotePath)
			# if(!($session.FileExists($remoteFilePath))) {
			# 	$session.CreateDirectory($remoteFilePath)
			# }
			# Write-Host $targetPath
			Write-Host $remoteFilePath
			$session.PutFiles($targetPath, $remoteFilePath).Check()
		}

		# foreach($fileInfo in $directory.Files) {
		# 	Write-Host ("$($fileInfo.Name) with size $($fileInfo.Length), " +
		# 	"permissions $($fileInfo.FilePermissions) and " +
		# 	"last modification at $($fileInfo.LastWriteTime)")
		# }
	}
	finally
	{
		# Disconnect, clean up
		$session.Dispose()
	}

	exit 0
}
catch
{
	Write-Host "Error: $($_.Exception.Message)"
	exit 1
}
