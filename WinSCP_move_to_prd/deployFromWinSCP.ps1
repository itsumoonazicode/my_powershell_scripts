﻿try
{
	$env = ConvertFrom-Json -InputObject (Get-Content .\env.json -Raw)
	
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

		foreach($fileInfo in $directory.Files) {
			Write-Host ("$($fileInfo.Name) with size $($fileInfo.Length), " +
			"permissions $($fileInfo.FilePermissions) and " +
			"last modification at $($fileInfo.LastWriteTime)")
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
