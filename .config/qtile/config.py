# -*- coding: utf-8 -*-
import os
import re
import socket
import subprocess
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from typing import List  # noqa: F401

mod = "mod4"                                     # Sets mod key to SUPER/WINDOWS
myTerm = "kitty"                             # My terminal of choice
myConfig = "~/.config/qtile/config.py"    # The Qtile config file location


@ hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


keys = [
    # The essentials
    Key([mod], "Return",
        lazy.spawn(myTerm),
        desc='Launches My Terminal'
        ),
    Key([mod], "d",
        lazy.spawn("dmenu_run -p 'Run: '"),
        desc='Dmenu Run Launcher'
        ),
    Key([mod], "Tab",
        lazy.next_layout(),
        desc='Toggle through layouts'
        ),
    Key([mod, "shift"], "Tab",
        lazy.prev_layout(),
        desc='Toggle through layouts'
        ),
    Key([mod, "shift"], "q",
        lazy.window.kill(),
        desc='Kill active window'
        ),
    Key([mod, "shift"], "r",
        lazy.restart(),
        desc='Restart Qtile'
        ),
    Key([mod, "shift"], "e",
        lazy.shutdown(),
        desc='Shutdown Qtile'
        ),
    # Window controls
    Key([mod], "k",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'
        ),
    Key([mod], "j",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'
        ),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_down(),
        desc='Move windows down in current stack'
        ),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_up(),
        desc='Move windows up in current stack'
        ),
    Key([mod], "h",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),
    Key([mod], "l",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'
        ),
    Key([mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
        ),
    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
        ),
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
        ),
    # Stack controls
    Key([mod, "shift"], "space",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc='Switch which side main pane occupies (XmonadTall)'
        ),
    Key([mod], "space",
        lazy.layout.next(),
        desc='Switch window focus to other pane(s) of stack'
        ),
    # My applications launched with SUPER + Fx
    Key([mod], "F2",
        lazy.spawn("firefox"),
        desc='lynx browser'
        ),
    Key([mod], "F3",
        lazy.spawn(myTerm+" -e sh ./.config/vifm/scripts/vifmrun"),
        desc='vifm'
        ),
    Key([mod, "shift"], "F3",
        lazy.spawn("pcmanfm"),
        desc='pcmanfm'
        ),
    Key([mod], "F4",
        lazy.spawn(myTerm+" -e cmus"),
        desc='cmus'
        ),
    Key([mod], "F5",
        lazy.spawn(myTerm+" -e neomutt"),
        desc='neomutt'
        ),
    Key([mod], "F6",
        lazy.spawn(myTerm+" -e newsboat"),
        desc='newsboat'
        ),
    # Brightness
    Key([], "XF86MonBrightnessUp",
        lazy.spawn("xbacklight -inc 10"),
        ),
    Key([], "XF86MonBrightnessDown",
        lazy.spawn("xbacklight -dec 10"),
        ),
]

group_names = [("1", {'layout': 'max'}),
               ("2", {'layout': 'monadtall'}),
               ("3", {'layout': 'monadtall'}),
               ("4", {'layout': 'monadtall'}),
               ("5", {'layout': 'monadtall'}),
               ("6", {'layout': 'monadtall'}),
               ("7", {'layout': 'monadtall'}),
               ("8", {'layout': 'monadtall'}),
               ("9", {'layout': 'floating'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "control"], str(i), lazy.window.togroup(name)))

layout_theme = {"border_width": 1,
                "margin": 6,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
                }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Stack(stacks=2, **layout_theme),
    # layout.Columns(**layout_theme),
    layout.RatioTile(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Matrix(**layout_theme),
    layout.Max(**layout_theme),
    # layout.Tile(shift_windows=True, **layout_theme),
    # layout.Stack(num_stacks=2),
    # layout.TreeTab(
    #    font="Ubuntu",
    #    fontsize=10,
    #    sections=["FIRST", "SECOND"],
    #    section_fontsize=11,
    #    bg_color="141414",
    #    active_bg="90C435",
    #    active_fg="000000",
    #    inactive_bg="384323",
    #    inactive_fg="a0a0a0",
    #    padding_y=5,
    #    section_top=10,
    #    panel_width=320
    # ),
    layout.Floating(**layout_theme),
    layout.Zoomy(**layout_theme)
]

colors = [["#292d3e", "#292d3e"],  # panel background
          ["#434758", "#434758"],  # background for current screen tab
          ["#ffffff", "#ffffff"],  # font color for group names
          ["#ff5555", "#ff5555"],  # border line color for current tab
          ["#8d62a9", "#8d62a9"],  # border line color for other tab and odd widgets
          ["#668bd7", "#668bd7"],  # color for the even widgets
          ["#e1acff", "#e1acff"]]  # window name

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font="Ubuntu Mono",
    fontsize=12,
    padding=2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
        widget.Sep(
            linewidth=0,
            padding=6,
            foreground=colors[2],
            background=colors[0]
        ),
        widget.Image(
            filename="~/.config/qtile/icons/python.png",
            mouse_callbacks={
                'Button1': lambda qtile: qtile.cmd_spawn('dmenu_run')},
            margin_x=2,
            background=colors[0]
        ),
        widget.GroupBox(
            font="Ubuntu Bold",
            fontsize=10,
            margin_y=4,
            margin_x=0,
            padding_y=5,
            padding_x=3,
            borderwidth=3,
            active=colors[2],
            inactive=colors[2],
            rounded=False,
            highlight_color=colors[1],
            highlight_method="block",
            urgent_alert_method='block',
            urgent_border=colors[3],
            this_current_screen_border=colors[4],
            this_screen_border=colors[4],
            other_current_screen_border=colors[0],
            other_screen_border=colors[0],
            foreground=colors[2],
            background=colors[0]
        ),
        widget.Sep(
            linewidth=0,
            padding=40,
            foreground=colors[2],
            background=colors[0]
        ),
        widget.WindowName(
            foreground=colors[6],
            background=colors[0],
            padding=0,
            fontsize=15
        ),
        widget.TextBox(
            text='',
            background=colors[0],
            foreground=colors[4],
            padding=0,
            fontsize=37
        ),
        widget.TextBox(
            text="",
            padding=0,
            foreground=colors[2],
            background=colors[4],
            fontsize=20
        ),
        widget.CPU(
            foreground=colors[2],
            background=colors[4],
            padding=5,
            fontsize=14,
            format='{freq_current}GHz {load_percent}%',
            mouse_callbacks={
                'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
        ),
        widget.TextBox(
            text='',
            background=colors[4],
            foreground=colors[5],
            padding=0,
            fontsize=37
        ),
        widget.TextBox(
            text="",
            padding=0,
            foreground=colors[2],
            background=colors[5],
            fontsize=15
        ),
        widget.ThermalSensor(
            foreground=colors[2],
            background=colors[5],
            threshold=80,
            padding=5,
            fontsize=14
        ),
        widget.TextBox(
            text='',
            background=colors[5],
            foreground=colors[4],
            padding=0,
            fontsize=37
        ),
        widget.TextBox(
            text="🐏",
            foreground=colors[2],
            background=colors[4],
            padding=0,
            fontsize=14
        ),
        widget.Memory(
            foreground=colors[2],
            background=colors[4],
            mouse_callbacks={
                'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
            padding=5,
            fontsize=14
        ),
        widget.TextBox(
            text='',
            background=colors[4],
            foreground=colors[5],
            padding=0,
            fontsize=37
        ),
        widget.TextBox(
            text="",
            foreground=colors[2],
            background=colors[5],
            padding=0,
            fontsize=22
        ),
        widget.DF(
            foreground=colors[2],
            background=colors[5],
            threshold=90,
            padding=5,
            visible_on_warn=False,
            format='{uf}{m}/{s}{m}|{r:.0f}%',
            fontsize=14
        ),
        widget.TextBox(
            text='',
            background=colors[5],
            foreground=colors[4],
            padding=0,
            fontsize=37
        ),
        widget.TextBox(
            text=" ",
            padding=0,
            foreground=colors[2],
            background=colors[4],
            fontsize=12
        ),
        widget.Battery(
            foreground=colors[2],
            background=colors[4],
            padding=2,
            fontsize=14,
            change_char='⚡',
            notify_below=50,
            show_short_text=False,
            format='{percent:2.0%}'
        ),
        widget.TextBox(
            text='',
            background=colors[4],
            foreground=colors[5],
            padding=0,
            fontsize=37
        ),
        widget.CurrentLayoutIcon(
            foreground=colors[0],
            background=colors[5],
            padding=0,
            scale=0.7
        ),
        widget.CurrentLayout(
            foreground=colors[2],
            background=colors[5],
            padding=5,
            fontsize=14
        ),
        widget.TextBox(
            text='',
            background=colors[5],
            foreground=colors[4],
            padding=0,
            fontsize=37
        ),
        widget.TextBox(
            text="",
            foreground=colors[2],
            background=colors[4],
            padding=4,
            fontsize=20
        ),
        widget.Clock(
            foreground=colors[2],
            background=colors[4],
            format="%a, %b %d  [%H:%M]",
            fontsize=14
        ),
        widget.TextBox(
            text='',
            background=colors[4],
            foreground=colors[5],
            padding=0,
            fontsize=37
        ),
        widget.Systray(
            background=colors[5],
            padding=3
        ),
        widget.Sep(
            linewidth=0,
            padding=5,
            foreground=colors[0],
            background=colors[5]
        ),
    ]
    return widgets_list


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    # Slicing removes unwanted widgets on Monitors 1,3
    return widgets_screen1


def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    # Monitor 2 will display all widgets in widgets_list
    return widgets_screen2


def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20))]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())


]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},
    {'wmclass': 'makebranch'},
    {'wmclass': 'maketag'},
    {'wmclass': 'branchdialog'},
    {'wmclass': 'volumeicon'},
    {'wmclass': 'leagueclient.exe'},
    {'wmclass': 'leagueclientux.exe'},
    {'wmclass': 'Wine'},
    {'wmclass': 'pamac-manager'}
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
