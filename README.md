# `libgit2-redist`

Script for building libgit2 on Windows + redistributed binaries.

**Only available for Windows x86 64 bits.**

- 🍎 On macOS, use Homebrew
- 🐧 On Linux, use your system package manager for installation. For example:
  - 🟠 Ubuntu: `libgit2` and `libgit2-dev`
  - ❄️ Nix/NixOS: [`libgit2`](https://search.nixos.org/packages?channel=23.11&show=libgit2&from=0&size=50&sort=relevance&type=packages&query=libgit2)
  - 🌉 Arch: [`libgit2`](https://archlinux.org/packages/extra/x86_64/libgit2/)
- 🪟✨ On Windows ARM, you should be able to run this as-is, but no promises.

**Current version:** `v1.7.2`. Check the [release page](https://github.com/utybo/libgit2-redist/releases) for download links.

## Usage

- Install [VS Build Tools](https://aka.ms/vs/17/release/vs_BuildTools.exe) (or [here](https://visualstudio.microsoft.com/downloads/)) and [Nushell](https://www.nushell.sh/):

  ```pwsh
  winget install Microsoft.VisualStudio.2022.Community --silent --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
  winget install nushell
  ```

  _credit to robotdad for [this command](https://gist.github.com/robotdad/83041ccfe1bea895ffa0739192771732)_

- Open a "Developer Powershell", then run `nu win-build.nu`

- You'll find the results in `build/win-x64/out`
