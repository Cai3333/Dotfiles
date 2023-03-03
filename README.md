<h1 align="center">🚀✨ My dotfiles! ✨🚀</h1>

<p align="center">
  <a href="https://github.com/FuzzyGrim/dotfiles/stargazers"><img src="https://img.shields.io/github/stars/FuzzyGrim/dotfiles?color=ffd5cd&style=for-the-badge&logo=starship"></a>
  <a href="https://github.com/FuzzyGrim/dotfiles/issues"><img src="https://img.shields.io/github/issues/FuzzyGrim/dotfiles?color=d35d6e&style=for-the-badge&logo=codecov"></a>
  <a href="https://github.com/FuzzyGrim/dotfiles/network/members"><img src="https://img.shields.io/github/forks/FuzzyGrim/dotfiles?color=84afdb&style=for-the-badge&logo=jfrog-bintray"></a>
  <a href="https://github.com/Fuzzygrim/dotfiles/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-orange.svg?color=90c861&style=for-the-badge&logo=mitsubishi"></a>
</p>

## Table of Contents

- [About ⁉️](#about)
- [Gallery 📷](#gal)
- [Workflow 🖨️](#workflow)
- [Keybinds ✍️](#keybinds)
- [Installation (Arch Linux) 🤵‍](#inst)
  - [Official repositories 🌇](#arch)
  - [AUR 🚂](#aur)
- [Disclaimer ⚠️](#disclaimer)

<a id="about"></a>

## About

- Browser: **[Firefox](https://github.com/FuzzyGrim/dotfiles/blob/master/.mozilla/firefox/r056xtue.default-release/chrome/userChrome.css)**
- Fonts: Ubunto Mono
- WM: **[Xmonad](https://github.com/FuzzyGrim/dotfiles/blob/master/.xmonad/xmonad.hs)**
- Bar: **[Xmobar](https://github.com/FuzzyGrim/dotfiles/tree/master/.config/xmobar/xmobarrc0)**
- Terminal: **[Kitty](https://github.com/FuzzyGrim/dotfiles/tree/master/.config/kitty)**
- Editor: **[Neovim](https://github.com/FuzzyGrim/dotfiles/tree/master/.config/nvim)**
- Shell: **[Fish](https://github.com/FuzzyGrim/dotfiles/tree/master/.config/fish)**
- Prompt: **[Startship](https://github.com/FuzzyGrim/dotfiles/blob/master/.config/starship.toml)**
- Viewer: **[Zathura](https://github.com/FuzzyGrim/dotfiles/tree/master/.config/zathura/zathurarc)**
- Notification: **[Dunst](https://github.com/FuzzyGrim/dotfiles/blob/master/.config/dunst/dunstrc)**

Hello! Thank you for dropping by! 👋

These are my xmonad configurations.

If you're here, I suppose you want to be cloning this configuration.

Even if you're not, just look through the gallery 📷:

<a id="gal"></a>
<img src='https://github.com/FuzzyGrim/dotfiles/blob/master/screenshots/1.png'>
<img src='https://github.com/FuzzyGrim/dotfiles/blob/master/screenshots/2.png'>

<a id="workflow"></a>

## Workflow 🖨️

<p align="center">
  <img src="https://github.com/FuzzyGrim/dotfiles/blob/master/screenshots/workflow.gif">
</p>

<a id="keybinds"></a>

## Keybinds ✍️

These are the basic keybinds. Read through the `.xmonad/xmonad.hs` file for more keybinds like increasing gaps and restoring gaps.

| Keybind                  |                  Function                   |
| ----------------------   |  ----------------------------------------   |
| `Super + Enter`          |           launch terminal (kitty)           |
| `Super + Shift + Enter`  | opens run launcher (XMonad’s shell xprompt) |
| `Super + Shift + q`      |                Close window                 |
| `Super + SPACE`          |          toggles fullscreen on/off          |
| `Super + 1-9`            |       switch focus to workspace (1-9)       |
| `Super + SHIFT + 1-9`    |   send focused window to workspace (1-9)    |
| `Super + Shift + r`      |               restarts xmonad               |
| `Super + j`              |          Navigate through windows           |
| `Super + k`              |          Navigate through windows           |
| `Super + SHIFT + j`      |              windows swap down              |
| `Super + SHIFT + k`      |               windows swap up               |
| `Super + h`              |                shrink window                |
| `Super + l`              |                expand window                |
| `Super + TAB`            |           Switch through layouts            |
| `Super + T`              |        Make a floating window tiled         |

<a id="inst"></a>

## Installation 🤵‍

##

Alright, let's get to the main stuff. These are the dependencies needed after installing ArcoLinux Xmonad edition.

<a id="arch"></a>

### From Arch Linux's official repositories

```bash
sudo pacman -S cbatticon cmus discord dunst exa exfatprogs firefox fish fzf gvfs intel-undervolt kitty lxappearance lxsession maim mpv ncdu nitrogen neovim pacman-contrib papirus-icon-theme pcmanfm picom profile-sync-daemon ranger redshift starship steam thefuck tlp ttf-font-awesome ttf-ubuntu-font-family ueberzug unclutter upower vlc xclip xdotool xorg-xbacklight xorg-xinput youtube-dl zathura zathura-pdf-mupdf 
```

- cbatticon
- cmus (:bind -f common u shell ~/bin/update-library.sh)
- discord
- dunst
- exa (A modern replacement for ls)
- exfatprogs
- firefox
- fish
- fzf
- gvfs
- intel-undervolt
- kitty
- lxappearance
- lxsession
- maim
- mpv
- ncdu
- nitrogen
- neovim
- pacman-contrib
- papirus-icon-theme
- pcmanfm
- picom
- profile-sync-daemon
- ranger
- redshift (/etc/geoclue/geoclue.conf --> url=<https://location.services.mozilla.com/v1/geolocate?key=geoclue>)
- starship
- steam
- thefuck
- tlp (systemctl enable --now tlp.service)
- ttf-font-awesome
- ttf-ubuntu-font-family
- ueberzug
- unclutter
- upower
- vlc
- xclip
- xdotool
- xorg-xbacklight
- xorg-xinput
- youtube-dl
- zathura
- zathura-pdf-mupdf

<a id="aur"></a>

### From Arch Linux's AUR

```bash
paru -S auto-cpufreq clipit hamsket-bin nerd-fonts-mononoki timeshift timeshift-autosnap tlpui vscodium-bin 
```

- auto-cpufreq
- clipit
- hamsket-bin
- nerd-fonts-mononoki
- timeshift
- timeshift-autosnap
- tlpui
- vscodium-bin

<a id="disclaimer"></a>

## Disclaimer ⚠️

All of the configs and scripts in this repo belong to my personal setup. None of them is guaranteed to work properly on your machine, so use them carefully and responsibly, and as always remember to make backups. Other than that, feel free to take inspiration or include them in your setup.

<h1 align="center">🌟 Good Luck and Cheers! 🌟</h1>
