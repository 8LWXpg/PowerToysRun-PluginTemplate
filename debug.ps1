# this script uses [gsudo](https://github.com/gerardog/gsudo)

Push-Location
Set-Location $PSScriptRoot

sudo {
	Start-Job { Stop-Process -Name PowerToys* } | Wait-Job > $null

	# change this to your PowerToys installation path
	$ptPath = 'C:\Program Files\PowerToys'
	$projectName = '$projectname$'
	$safeProjectName = '$safeprojectname$'
	$debug = '.\bin\x64\Debug\net8.0-windows'
	$dest = "$env:LOCALAPPDATA\Microsoft\PowerToys\PowerToys Run\Plugins\$projectName"
	$files = @(
		"Community.PowerToys.Run.Plugin.$safeProjectName.deps.json",
		"Community.PowerToys.Run.Plugin.$safeProjectName.dll",
		'plugin.json',
		'Images'
	)

	Set-Location $debug
	mkdir $dest -Force -ErrorAction Ignore | Out-Null
	Copy-Item $files $dest -Force -Recurse

	& "$ptPath\PowerToys.exe"
}

Pop-Location
