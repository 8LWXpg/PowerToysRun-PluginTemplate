param (
    [Parameter(Mandatory)]
    [ValidateSet('compress', 'tag', 'release')]
    [string]$task,

    [switch]$copy
)

try {
    Push-Location
    Set-Location $PSScriptRoot/..

    7z a '-xr@.vstemplate_ignore' PowerToysRun-PluginTemplate.zip *
    if ($copy) {
        Copy-Item PowerToysRun-PluginTemplate.zip '~\Documents\Visual Studio 2022\Templates\ProjectTemplates' -Force
    }
    if ($task -eq 'compress') {
        return
    }
    git tag (Read-Host 'New tag')
    git push --tags
    if ($task -eq 'tag') {
        return
    }
    gh release create (git describe --tags --abbrev=0) PowerToysRun-PluginTemplate.zip
} finally {
    Pop-Location
}