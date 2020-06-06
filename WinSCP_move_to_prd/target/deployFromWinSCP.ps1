try
{
	$env = ConvertFrom-Json -InputObject (Get-Content ..\env.json -Raw)
	# スクリプト自身のパスまでのディレクトリ
	$scriptPath = Split-Path -Parent ($MyInvocation.Mycommand.Path)
	# リモート接続先のアップロード先フォルダ
	$remotePath = "/test/"
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
		
		foreach($target in $fileLists) {
			$targetPath = $scriptPath + "\" + $target
			$localFilePath = $targetPath -replace "/", "\"
			$parentLocalPath = $scriptPath
			$remoteFilePath = [WinSCP.RemotePath]::TranslateLocalPathToRemote($localFilePath, $parentLocalPath, $remotePath)

			$session.PutFiles($localFilePath, $remoteFilePath).Check()
			Write-Host $localFilePath
			Write-Host $parentLocalPath
			Write-Host $remoteFilePath
		}

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
