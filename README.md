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
- [Personal installation (ArcoLinux Xmonad) 🤵‍](#inst)
  - [Official repositories 🌇](#arch)
  - [AUR 🚂](#aur)
- [Disclaimer ⚠️ ](#disclaimer)


<a id="about"></a>

## About:


- **[xmonad](https://github.com/FuzzyGrim/dotfiles/blob/master/.xmonad/xmonad.hs)**
- **[xmobar](https://github.com/FuzzyGrim/dotfiles/tree/master/.config/xmobar/xmobarrc0)**
- **[firefox](https://github.com/FuzzyGrim/dotfiles/blob/master/.mozilla/firefox/r056xtue.default-release/chrome/userChrome.css)**
- **[zathura](https://github.com/FuzzyGrim/dotfiles/tree/master/.config/zathura/zathurarc)**
- **[dunst](https://github.com/FuzzyGrim/dotfiles/blob/master/.config/dunst/dunstrc)**
- *Insert more stuff here*


Hello! Thank you for dropping by! 👋

These are my xmonad configurations.

If you're here, I suppose you want to be cloning this configuration. 

Even if you're not, just look through the gallery 📷:



<a id="gal"></a>
<img src='https://github.com/FuzzyGrim/dotfiles/blob/master/screenshots/default.png'>
<img src='https://github.com/FuzzyGrim/dotfiles/blob/master/screenshots/main.png'>
<img src='https://github.com/FuzzyGrim/dotfiles/blob/master/screenshots/firefox_zathura.png'>


<a id="workflow"></a>

## Workflow 🖨️

<p align="center">
  <img src="https://github.com/FuzzyGrim/dotfiles/blob/master/screenshots/workflow.gif">
</p>


<a id="keybinds"></a>
## Keybinds ✍️

These are the basic keybinds. Read through the `.xmonad/xmonad.hs` file for more keybinds like increasing gaps and restoring gaps.

| Keybind                |                  Function                   |
| ---------------------- |  ----------------------------------------   |
| `Win + Enter`          |           launch terminal (kitty)           |
| `Win + Shift + Enter`  | opens run launcher (XMonad’s shell xprompt) |
| `Win + Shift + q`      |                Close window                 |
| `Win + SPACE`          |          toggles fullscreen on/off          |
| `Win + 1-9`            |       switch focus to workspace (1-9)       |
| `Win + SHIFT + 1-9`    |   send focused window to workspace (1-9)    |
| `Win + Shift + r`      |               restarts xmonad               |
| `Win + j`              |          Navigate through windows           |
| `Win + k`              |          Navigate through windows           |
| `Win + SHIFT + j`      |              windows swap down              |
| `Win + SHIFT + k`      |               windows swap up               |
| `MODKEY + h`           |                shrink window                |
| `MODKEY + l`           |                expand window                |
| `Win + TAB`            |           Switch through layouts            |
| `Win + T`              |        Make a floating window tiled         |

Note: `Toggling` means to enable if inactive or to disable if active.


Note: `Win` refers to the `Super` key.


<a id="inst"></a>
## Installation 🤵‍

### Introduction of Linux Rice

<details>
<summary>Please read <a target="_blank" href="https://crispgm.com/page/the-fascinating-arch-linux-rice.html">this</a> and <a target="_blank" href="https://jie-fang.github.io/blog/basics-of-ricing">this</a>.</summary>
  
<br>

<p align="center"><a href="#introduction-of-linux-rice"><img src="https://i.redd.it/yu0auhxk5nyz.png" alt="unixporn"/></a></p>

</details>


<a id="inst"></a>

##

Alright, let's get to the main stuff. These are the dependencies needed after installing ArcoLinux Xmonad edition.

<a id="arch"></a>
### From Arch Linux's official repositories:

```bash
sudo pacman -S cmus dunst exa firefox fish fzf interl-undervolt kitty kvantum-qt5 libreoffice-still lxapperance lxsession maim mpv ncdu nitrogen pcmanfm picom redshift stacer steam syncthing thefuck timeshift tpl ttf-font-awesome ttf-ubuntu-font-family vifm vlc xdotool xorg-xbacklight youtube-dl zathura zathura-pdf-mupdf 
```
-    cmus (:bind -f common u shell ~/bin/update-library.sh)
-    dunst
-    exa
-    firefox
-    fish
-    fzf
-    interl-undervolt
-    kitty
-    kvantum-qt5
-    libreoffice-still
-    lxapperance
-    lxsession
-    maim
-    mpv
-    newboat
-    ncdu
-    nitrogen
-    pcmanfm
-    picom
-    redshift (/etc/geoclue/geoclue.conf --> url=https://location.services.mozilla.com/v1/geolocate?key=geoclue)
-    stacer
-    steam
-    syncthing
-    thefuck
-    timeshift
-    tpl (systemctl enable/start tlp.service)
-    ttf-font-awesome
-    ttf-ubuntu-font-family
-    vifm
-    vlc
-    xdotool
-    xorg-xbacklight
-    youtube-dl
-    zathura
-    zathura-pdf-mupdf

<a id="aur"></a>
### From Arch Linux's AUR:

```bash
paru -S ant-dracula-kvantum-theme-git clipit cryptomator nerd-fonts-mononoki megasync powerline-shell qimgv-git standardnotes-bin teams ttf-ms-fonts ttf-vista-fonts vscodium-bin 
```
-    ant-dracula-kvantum-theme-git
-    clipit
-    cryptomator
-    megasync
-    nerd-fonts-mononoki
-    powerline-shell
-    qimgv-git
-    stacer
-    standardnotes-bin
-    vscodium-bin


<a id="disclaimer"></a>
## Disclaimer ⚠️

All of the configs and scripts in this repo belong to my personal setup. None of them is guaranteed to work properly on your machine, so use them carefully and responsibly, and as always remember to make backups. Other than that, feel free to take inspiration or include them in your setup.


<h1 align="center">🌟 Good Luck and Cheers! 🌟</h1>
