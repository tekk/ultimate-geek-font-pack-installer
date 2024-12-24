# Complete Google & Nerd Fonts Collection — PowerShell Scripts for the True Font Geek

> Because why settle for boring system fonts when you can have an armada of glyph-laden, code-friendly typefaces at your disposal?

## Table of Contents

1. [Overview](#overview)
2. [Features](#features)
3. [Requirements](#requirements)
4. [Installation](#installation)
5. [Usage](#usage)
6. [Uninstallation](#uninstallation)
7. [Verification & Testing](#verification--testing)
8. [Folder Structure](#folder-structure)
9. [Troubleshooting](#troubleshooting)
10. [Contributing](#contributing)
11. [License](#license)

---

## Overview

This repository is your one-stop shop for a colossal collection of **Google Fonts** (the free, ubiquitous web typography classics) and **Nerd Fonts** (the icon-packed developer dream fonts). Because, let’s face it, once you’ve tasted a command line brimming with powerline symbols and codepoint icons, you’ll never go back.

Included are two PowerShell scripts:

- **`installer.ps1`** for one-click (or one-command) batch-installing everything into `C:\Windows\Fonts`.
- **`uninstaller.ps1`** for systematically ripping them out if you ever want a font palette cleanse.

No half-measures here. With this, you can transform your coding environment, terminal sessions, and even your grandma's 10-year-old Word doc into a typographic paradise.

---

## Features

- **Bulk Font Deploy**  
  You already have all the `.ttf` goodies in the designated folders, fire off `installer.ps1`, and watch them swarm into `C:\Windows\Fonts`.

- **Nerd Fonts Galore**  
  Blow up your CLI or editor with extra glyphs, icons, and fancy ornaments. Perfect for those who love powerlines and icons in their prompt.

- **Registry Integration**  
  For that oh-so-important system-wide recognition. Let every user on your machine revel in your well-curated fonts.

- **Selective Uninstallation**  
  If you ever tire of having 372 variants of “Fira Code,” just nuke them with `uninstaller.ps1`.

---

## Requirements

- **Windows 10+ / Windows 11** 
  Because we’re dealing with `C:\Windows\Fonts` and the OS's registry.  
- **Administrator Privileges**  
  Font management at the system level demands the keys to the kingdom.  
- **PowerShell v5+**  
  Comes pre-loaded on modern Windows. If you’re rocking something archaic, it’s time to upgrade.  
- **The Actual Fonts**  
  You bring the `.ttf` files. (They're already there).

---

## Installation

1. **Grab the Repo**  
   ```bash
   git clone https://github.com/tekk/ultimate-geek-font-pack-installer.git
   ```

2. **Populate the Folders**  
   - `./google-fonts` → Stuff it with all your `.ttf` Google Fonts.  
   - `./nerdfonts` → Dump your Nerd Fonts collection here.  
   - If you’re feeling extra, add more folders and update `$FontDirs` in the scripts.

3. **Run PowerShell as Admin**  
   Because without admin rights, you’re just politely asking Windows to don't give a font.

---

## Usage

1. **Open a PowerShell Window**  
   Make sure you `cd` into the repository’s root folder.

2. **Fire the Installer**  
   ```powershell
   .\installer.ps1
   ```
   If Windows complains about an execution policy, override it (in a responsible, adult manner):
   ```powershell
   powershell -ExecutionPolicy Bypass -File ".\installer.ps1"
   ```
   Let the script do its thing. Each font will either be newly installed or skipped if already present.

3. **Admire Your New Fonts**  
   Check out your word processors, text editors, or code IDEs. You should see your fonts in the drop-down.

---

## Uninstallation

So, you’ve discovered you don’t actually need 47 variations of “Roboto”? Just do this:

1. **Open a PowerShell Window** (Admin mode, of course).
2. **Execute the Uninstaller**:
   ```powershell
   .\uninstaller.ps1
   ```
3. **Watch the Script**  
   It will yank registry entries and delete matching `.ttf` files from `C:\Windows\Fonts`.  
   *Use with caution.* This is total annihilation for matching fonts.

---

## Verification & Testing

- **Manual Check**  
  Head to `C:\Windows\Fonts` in Explorer. If you see your fonts, success!
- **App Check**  
  Launch your editor or terminal (e.g., Windows Terminal, Visual Studio Code, or your favorite geeky CLI environment) and ensure the new fonts appear in the selection menu.
- **Nerd Fonts Icons**  
  Fire up a fancy prompt (like oh-my-posh or a WSL environment with a powerline prompt) and confirm the glorious icons are rendering as intended.

---

## Folder Structure

```
complete-google-nerdfonts-collection/
├── google-fonts/
│   ├── <YourGoogleFonts>.ttf
│   └── ...
├── nerdfonts/
│   ├── <YourNerdFonts>.ttf
│   └── ...
├── installer.ps1
├── uninstaller.ps1
└── README.md
```

- **google-fonts/**: Dumped your sweet Google `.ttf`s here.
- **nerdfonts/**: Your Nerd Fonts stash.
- **installer.ps1**: The magic wand for bulk installing.
- **uninstaller.ps1**: The eject button for removing installed fonts.

---

## Troubleshooting

- **Execution Policy Errors**  
  Allow local scripts to run by adjusting the policy:
  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```
- **Admin Permissions**  
  If Windows says "No," you probably forgot to run as Administrator.
- **File Paths**
  Make sure your fonts are truly `.ttf` and that `$FontDirs` in the scripts point to the correct folders.
- **Registry Conflicts**  
  If you forcibly close the script, you may have partial installs. Just run it again to clean up or revert with the uninstaller.

---

## Contributing

Want to add more directories for your ASCII art fonts or your specialized Klingon calligraphy set? Fork the repo, create a branch, commit your changes, and shoot a pull request. Or just open an issue if you find a bug or have a rad idea.

---

## License

- **Google Fonts**: [Open Font License](https://fonts.google.com/attribution).
- **Nerd Fonts**: Check out the individual font licenses in their respective repos.
- **Scripts (installer/uninstaller)**: MIT License.

By installing these fonts, you confirm you’re abiding by the licensing for each font. **Use responsibly, be a good netizen.**

--- 

### Enjoy your new souped-up typographic wonderland!


## My sites

- [https://tekk.eu](https://tekk.eu)
- [https://www.om7tek.com](https://www.om7tek.com)


Made with ❤️ by Peter "Tekk" OM7TEK

Please donate: [PayPal](https://paypal.me/tekkoooo)
