$vsPath = &"${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationpath

Write-Host "Microsoft Visual Studio path = '$vsPath'"

# Use module `Microsoft.VisualStudio.DevShell.dll`
Import-Module (Get-ChildItem $vsPath -Recurse -File -Filter Microsoft.VisualStudio.DevShell.dll).FullName

Enter-VsDevShell -VsInstallPath $vsPath -SkipAutomaticLocation -DevCmdArguments '-arch=x64'
clear

function Dotfiles { & (Get-Command git).Source --git-dir="${env:USERPROFILE}/src/dotfiles/" --work-tree="${env:USERPROFILE}" ${Args}}

Set-Alias -Name 'dotfile' -Value Dotfiles

# Set-Alias -Name 'cat' -Value Invoke-BatAsCat
# Set-Alias -Name 'doftiles' -value "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
