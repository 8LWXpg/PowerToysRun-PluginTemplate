[CmdletBinding()]
param ()

# Find the source path for the PowerToys installation.
$PowerToysUser = Join-Path -Path $env:LOCALAPPDATA -ChildPath 'PowerToys'
$PowerToysMachine = 'C:\Program Files\PowerToys'

$SourcePath = if (Test-Path -Path $PowerToysUser) {
    $PowerToysUser
} elseif (Test-Path -Path $PowerToysMachine) {
    $PowerToysMachine
} else {
    throw 'PowerToys installation not found.'
}
Write-Verbose "PowerToys installation found at $SourcePath."

$DestinationPath = Join-Path -Path $PSScriptRoot -ChildPath 'Lib'
# Create the Lib folder if it does not already exist.
if (-not (Test-Path -Path $DestinationPath)) {
    try {
        New-Item -ItemType Directory -Path $PSScriptRoot -Name 'Lib' | Out-Null
        Write-Verbose "Created the 'Lib' directory in $PWD."
    } catch {
        throw 'Failed to create the ''Lib'' directory.'
    }
}

$Libraries = @(
    'PowerToys.Common.UI.dll'
    'PowerToys.ManagedCommon.dll'
    'PowerToys.Settings.UI.Lib.dll'
    'Wox.Infrastructure.dll'
    'Wox.Plugin.dll'
)

foreach ($dll in $Libraries) {
    $Source = Join-Path -Path $SourcePath -ChildPath $dll
    $Destination = Join-Path -Path $DestinationPath -ChildPath $dll

    if (-not (Test-Path -Path $Destination)) {
        Copy-Item -Path $Source -Destination $Destination
        Write-Verbose "Copied $dll to $DestinationPath."
    } else {
        Write-Verbose "$dll already exists in $DestinationPath."
    }
}
