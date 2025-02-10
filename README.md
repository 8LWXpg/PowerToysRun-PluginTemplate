![title image](https://github.com/8LWXpg/PowerToysRun-PluginTemplate/assets/105704427/0a6476f8-91b0-4245-be5b-9ec51f4a6a76)

# PowerToysRun Plugin Template

This is a template for Visual Studio to create a PowerToys Run plugin.

## How to customize

### Prerequisite

- `7z` (from 7zip or NanaZip) available in `PATH`.

### Steps

1. Clone or fork the repo.
1. Make your desired change (like changing `indent_style` and `end_of_line` in `.editorconfig`).
1. run `./scripts/build.ps1 compress -copy` in PowerShell.

## How to use

### Prerequisite

- [gsudo](https://github.com/gerardog/gsudo) \
  Or if you're using Windows later than Windows 11 24H2, change `sudo {...}` in `debug.ps1` to `sudo powershell {...}`.

### Usage

1. Download the latest release.
1. Move the zip to `~\Documents\Visual Studio 2022\Templates\ProjectTemplates`.
1. Change `$ptPath` in `debug.ps1` to your PowerToys install location, i.e. `$env:LOCALAPPDATA\PowerToys` for user scope install.
1. Open Visual Studio 2022 and select the template named `PowerToys Run Plugin Template`.
1. Follow TODOs in `Main.cs`.

### Scripts

- `debug.ps1` - move debug files to destination.
- `release.ps1` - create release on github with github cli.

## How to debug

1. Build the project.
1. Run `debug.ps1`.
1. Attach to the process `PowerToys.PowerLauncher`.

## Demo

Check [ProcessKiller](https://github.com/8LWXpg/PowerToysRun-ProcessKiller).

## Template structure

```plaintext
MyPlugin
│   MyPlugin.sln
└───MyPlugin
    │   copyLib.ps1
    │   debug.ps1
    │   .editorconfig
    │   MyPlugin.csproj
    │   Main.cs
    │   plugin.json
    │   README.md
    │   release.ps1
    ├───Images
    │       Icon.dark.png
    │       Icon.light.png
    ├───Lib
    └───Properties
            Resources.Designer.cs
            Resources.resx

```

## Update the template

Visual Studio 2022 caches the templates, so you can't simply replace the zip file.

1. Remove previous versions of the template.
1. Start Visual Studio 2022 then select `Create a new project`, this loads the templates.
1. Close Visual Studio 2022 or click `Back`.
1. Move the new zip to `~\Documents\Visual Studio 2022\Templates\ProjectTemplates`.

## Help improve this template

If you have any suggestions or improvements, feel free to open an issue or a pull request.

### Useful links

- [Template parameters](https://learn.microsoft.com/en-us/visualstudio/ide/template-parameters?view=vs-2022)
- [Template schema reference](https://learn.microsoft.com/en-us/visualstudio/extensibility/visual-studio-template-schema-reference?view=vs-2022)
- [Template tags](https://learn.microsoft.com/en-us/visualstudio/ide/template-tags?view=vs-2022)
