
$profileList = @()

foreach ($user in (Get-ChildItem C:\Users)) {
	
	#Purpose: Get difference between user profile last modified time and current time.
	#[https://stackoverflow.com/questions/21052812/difference-between-dates-using-powershell]
	
	$timeDiffDays = ([math]::floor(([DateTime](Get-Date) - [DateTime](Get-ItemPropertyValue -Path C:\Users\$user -Name LastWriteTime)).TotalDays))

	$profileList += New-Object psobject -Property @{
		User = $user
		LastLoggedIn = $timeDiffDays
	}
	
}

foreach ($item in $profileList) {
	Write-Host $item.User
	Write-Host $item.LastLoggedIn
}


#pause
#Read-Host