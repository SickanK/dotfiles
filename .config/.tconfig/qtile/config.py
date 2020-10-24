# --Python - qtile_config--
#  _____ _   __
# /  ___| | / /
# \ `--.| |/ /  Config file for qtile by Sickan!
#  `--. \    \  Config file for qtile by Sickan!
# /\__/ / |\  \ Config file for qtile by Sickan!
# \____/\_| \_/
#
# The following comments are the copyright and licensing information from the default
# qtile config. Copyright (c) 2010 Aldo Cortesi, 2010, 2014 dequis, 2012 Randall Ma,
# 2012-2014 Tycho Andersen, 2012 Craig Barnes, 2013 horsik, 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify,
# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be included in all copies
# or substantial portions of the Software.

# Python imports

from playsound import playsound
import os
import re
import socket
import subprocess
import os.path
from libqtile.config import Key, Screen, Group, Match, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.widget import base
from typing import List  # noqa: F401

# Set Default modkey:
mod = "mod4"
myTerm = "termite"


def init_keys():
    keys = [

        # Change Focus:
        Key([mod], "h", lazy.layout.left()),
        Key([mod], "l", lazy.layout.right()),
        Key([mod], "j", lazy.layout.down()),
        Key([mod], "k", lazy.layout.up()),
        # Swap places:
        Key([mod, "shift"], "h", lazy.layout.swap_left()),
        Key([mod, "shift"], "l", lazy.layout.swap_right()),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
        Key([mod], "e", lazy.to_screen(0)),
        Key([mod], "r", lazy.to_screen(1)),
        Key([mod, "shift"], "w", lazy.window.to_screen(0)),
        Key([mod, "shift"], "y", lazy.window.to_screen(1)),


        # Resize keys:
        Key([mod], "i", lazy.layout.grow()),
        Key([mod], "m", lazy.layout.shrink()),
        Key([mod], "n", lazy.layout.normalize()),
        Key([mod], "o", lazy.layout.maximize()),
        # Move the master pane Left/Right:
        Key([mod, "shift"], "space", lazy.layout.flip()),
        # Toggel fullscreen on/off:
        Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),

        # Change Layout:
        Key([mod], "Tab", lazy.next_layout()),
        # Close focused window:
        Key([mod], "w", lazy.window.kill()),

        # Restart qtile in place:
        Key([mod, "control"], "r", lazy.restart()),

        # Applications/Scripts Shortcuts:
        Key([mod, "shift"], "s", lazy.spawncmd()),

        Key([mod], "Return", lazy.spawn(myTerm)),
        Key([mod], "a", lazy.spawn("nautilus")),
        Key([mod], "s", lazy.spawn("tmux")),
        Key([mod], "d", lazy.spawn("gimp")),
        Key([mod], "f", lazy.spawn("firefox")),
        Key([mod], "7", lazy.spawn("freetube-bin")),
        Key([mod], "8", lazy.spawn("discord-canary")),
        #   Key([mod], "9", lazy.spawn("")),
        #   Key([mod], "0", lazy.spawn("")),

        # Volume control:
        Key([mod], "Up", lazy.spawn("pulseaudio-ctl up")),
        Key([mod], "Down", lazy.spawn("pulseaudio-ctl down")),

        # Brightness control:
        Key([mod], "Left", os.system("light-down")),
        Key([mod], "Right", os.system("sudo bash ~/bash-scripts/brightness-up.sh")),

        # Change keyboard layout:
        Key([mod], "space", lazy.spawn("./Scripts/kbdlayout.sh")),
    ]
    return keys


keys = init_keys()

groups = [
    Group(
        "1",
        label="Ⅰ"
    ),
    Group(
        "2",
        # matches=[Match(wm_class=["firefox"])],
        label="Ⅱ"
    ),
    Group(
        "3",
        label="Ⅲ"
    ),
    Group(
        "4",
        label="Ⅳ"
    ),
    Group(
        "5",
        label="Ⅴ"
    ),
    Group(
        "6",
        label="Ⅵ"
    )
]


for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

layouts = [
    layout.MonadTall(
        border_focus="5e81ac",
        border_normal="b48ead",
        border_width=3,
        margin=5,
    ),
    layout.MonadWide(
        border_focus="5e81ac",
        border_normal="b48ead",
        border_width=3,
        margin=5,
    ),
]

widget_defaults = dict(
    font='Cascadia Code',
    fontsize=14,
    padding=4,
    background="1c1923",
    foreground="5e81ac",
)
extension_defaults = widget_defaults.copy()


def get_bar():
    return bar.Bar([
        widget.GroupBox(
            active="5e81ac",
            inactive="b48ead",
            this_current_screen_border="bf616a",
            highlight_method="line",
            highlight_color=["2e3440", "2e3440"],
            center_aligned=True,
        ),
        widget.TextBox(
            text='|',
            foreground="bf6a6a"
        ),
        widget.Prompt(
            prompt='Run:',
        ),
        widget.Spacer(bar.STRETCH),
        widget.Systray(
        ),
        widget.TextBox(
            text='|',
            foreground="ebcb8b",
        ),
        widget.TextBox(
            text='',
            foreground="ebcb8b",
        ),
        widget.Volume(
            foreground="ebcb8b",
        ),
        widget.TextBox(
            text='|',
            foreground="88c0d0",
        ),
        widget.Battery(
            foreground="88c0d0",
            battery="CMB1",
            format='{percent:2.0%}'
        ),
        widget.TextBox(
            text='|',
            foreground="a3be8c",
        ),
        widget.TextBox(
            text='',
            foreground="a3be8c",
        ),
        widget.Clock(
            format='%a %H:%M',
            foreground="a3be8c",
        ),
        widget.TextBox(
            text='|',
            foreground="bf6a6a",
        ),
        widget.TextBox(
            text='',
            foreground="bf6a6a",
        ),
        widget.Wlan(
            foreground="bf6a6a",
            interface="wlp2s0",
            format="{essid}",
        ),
    ], 26, background="2e3440")


screens = [
    Screen(top=get_bar()),
    Screen(),
]

# Drag floating layouts.
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
follow_mouse_focus = False
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
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"


# Set background
#subprocess.Popen(['sh ~/.fehbg'], shell=True)
subprocess.Popen(['killall xwinwrap'], shell=True)
subprocess.Popen(['sh ~/.gifbg'], shell=True)
subprocess.Popen(['sh ~/.gifbg2'], shell=True)
subprocess.Popen(['sh ~/bash-scripts/two-monitors.sh'], shell=True)


#dir = os.path.join('./', 'test.mp3')
# playsound(dir)


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
