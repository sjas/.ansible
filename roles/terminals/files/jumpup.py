import os
import re
import gi
gi.require_version('Gtk','3.0')
from gi.repository import Gtk as gtk
from gi.repository import Gdk as gdk
import signal
from socket import gethostname
from getpass import getuser
import terminatorlib.plugin as plugin
from terminatorlib.util import err, dbg
from terminatorlib.translation import _
from terminatorlib.terminator import Terminator

# AVAILABLE must contain a list of all the classes that you want exposed
AVAILABLE = ['JumpUp']

class JumpUp(plugin.MenuItem):
    capabilities = ['terminal_menu']
    last_cursor_pos = 0

    def __init__(self):
        plugin.MenuItem.__init__(self)
        self.entry = Terminator().windows[0]
        self.entry.connect('key-release-event', self.onKeyRelease)
        self.entry.connect('key-press-event', self.onKeyPress)


    def callback(self, menuitems, menu, terminal):
        item = gtk.MenuItem(_('JumpUp!'))
        item.connect("activate", self.jumpUp)
        menuitems.append(item)

    def jumpUp(self, widget):
        t = Terminator().last_focused_term
        t.scrollbar_jump(self.last_cursor_pos)

    def onKeyRelease(self, widget, event):
        if (event.state & gdk.ModifierType.MOD1_MASK == gdk.ModifierType.MOD1_MASK) and (event.keyval == 74 or event.keyval == 106): # Alt+J or Alt+j
            self.jumpUp(widget)

    def onKeyPress(self, widget, event):
        if event.keyval == 65293:
            t = Terminator().last_focused_term
            col, row = t.get_vte().get_cursor_position()
            content = t.get_vte().get_text_range(row-1, 0, row, col, lambda *a: True)[0].split("\n")

            #print(content)
            #print(content[-2])
            #print(content[-1])

            # last line contains prompt?
            # doesnt end with "$ # > % "?
            if re.match("\w+@\w+", content[-1]) and not (content[-1].endswith("$ ") or content[-1].endswith("# ") or content[-1].endswith("> ") or content[-1].endswith("% ")):
                #print("works with single-line prompts")
                self.last_cursor_pos = row

            # last line defined?
            # second last line contains prompt?
            # last line doesnt end with "$ # > % "?
            elif content[-1] and not (re.match("\w+@\w+", content[-2])) and not (content[-1].endswith("$ ") or content[-1].endswith("# ") or content[-1].endswith("> ") or content[-1].endswith("% ")):
                #print("works with double-line prompts")
                self.last_cursor_pos = row -1
