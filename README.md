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
  - [Other Installations :relaxed:](#other)
    - [KVM :computer:](#kvm)
    - [League of Legends](#league)
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
sudo pacman -S cmus dunst exa firefox fish fzf interl-undervolt kitty kvantum-qt5 libreoffice-still lxapperance lxsession maim mpv newboat nitrogen pcmanfm picom redshift stacer steam syncthing thefuck timeshift tpl ttf-font-awesome ttf-ubuntu-font-family vifm vlc xdotool xorg-xbacklight youtube-dl zathura zathura-pdf-mupdf 
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
paru -S ant-dracula-kvantum-theme-git clipit nerd-fonts-mononoki powerline-shell qimgv-git standardnotes-bin teams ttf-ms-fonts ttf-vista-fonts vscodium-bin 
```
-    ant-dracula-kvantum-theme-git
-    clipit
-    nerd-fonts-mononoki
-    powerline-shell
-    qimgv-git
-    stacer
-    standardnotes-bin
-    vscodium-bin


<a id="other"></a>
### Other things :art::

<a id="kvm"></a>
#### KVM:

Dependencies:

```bash
paru -S qemu virt-manager ebtables qemu-arch-extra ovmf dnsmasq bridge-utils openbsd-netcat
```

Configuration:

```bash
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo systemctl status libvirtd
sudo usermod -G libvirt -a USERNAME
```

<a id="league"></a>
#### League of Legends:

##### Install wine, lutris and dependencies:

```bash
sudo pacman -S wine-staging winetricks giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox lutris 
```
##### Drivers (Nvidia):

First, enable multilib.

To enable multilib repository, uncomment the `[multilib]` section in `/etc/pacman.conf`

<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;">/etc/pacman.conf
--------------------------------------------------------------------------------------
[multilib]
Include = /etc/pacman.d/mirrorlist</pre>

Then upgrade the system `sudo pacman -Syu`.

_**Warning**: Please ensure your graphics card is supported by modern Nvidia driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/149138/en-us_

Proprietary driver and support for Vulkan are required for proper functionality of games.

To install it, execute following command:

    sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader 

###### Enable Esync compability:

First step is to run the `ulimit -Hn` command. If the value printed is equal or greater to 524288 then you're all set, your system is ready to use Esync! If you are running Systemd 240 or later, this should already be the case.

**Modifying Systemd configuration**<br> 
You (with root privileges or `sudo`) need to edit both `/etc/systemd/system.conf` and `/etc/systemd/user.conf` by adding `DefaultLimitNOFILE=524288`. If `DefaultLimitNOFILE=` already exist in both `system.conf` and `user.conf`, add `524288` after `=` and make sure to uncomment the line (remove the `#`) to make it functional.<br><br>
Once the files are edited, restart your computer for the changes to take effect. To verify if the limits were applied, run `ulimit -Hn` to see open files limit (it should report `524288`).<br>

If the value printed still says something like 4096, try the ulimits method below.

###### Install the game:
[Select the one that says: "This is a compilation of the contributions from r/leagueoflinux reddit"](https://lutris.net/games/league-of-legends/)

You need to let the client in the login page download everything it wants, THEN close it to complete the installation. Then, open the game and you should be able to log into the client without problems.

##### Final configs:
Before starting the game, you will need to open a terminal and execute this command: 

    sudo sh -c 'sysctl -w abi.vsyscall32=0'

Once this is done, try starting the game. If it works, great, you have a working LoL installation, enjoy the game! (Though, you might want to check out the optimization section below.)

If not, please check whether you have lib32-libldap installed. In my case, for example, without installing this dependency, the game simply refuses to launch.

You can use this command for keeping the setting persistant:
    sudo bash -c 'echo "abi.vsyscall32 = 0" >> /etc/sysctl.d/vsyscall.conf && sysctl -p'


<a id="disclaimer"></a>
## Disclaimer ⚠️

All of the configs and scripts in this repo belong to my personal setup. None of them is guaranteed to work properly on your machine, so use them carefully and responsibly, and as always remember to make backups. Other than that, feel free to take inspiration or include them in your setup.


<h1 align="center">🌟 Good Luck and Cheers! 🌟</h1>
