# Simple Perforce plugin for Sublime Text 2
# (C) 2011 by Javier Arevalo
# Free for anyone to use, distribute and modify

# Copy this file to ST2's Data/Packages/User/perforce.py
# Add the functions to the Tools menu with the following in a file named
#   Data/Packages/User/Main.sublime-menu:
#[
#    {
#        "id": "tools",
#        "children":
#        [
#            { "caption": "-" },
#            { "command": "p4_edit", "caption": "P4 Edit" },
#            { "command": "p4_revert", "caption": "P4 Revert" },
#            { "command": "p4_add", "caption": "P4 Add" }
#        ]
#    }
#]
# And/or in Data/Packages/User/Context.sublime-menu:
#[
#    { "caption": "-" },
#    { "command": "p4_edit", "caption": "P4 Edit" },
#    { "command": "p4_revert", "caption": "P4 Revert" },
#    { "command": "p4_add", "caption": "P4 Add" }
#]

import sublime, sublime_plugin
import os, stat

def UpdateViewWriteability(view):
	if view.file_name():
		if os.access(view.file_name(), os.W_OK):
			view.set_read_only(False)
		else:
			view.set_read_only(True)

# Detect readonly / writable files
# These are both false for non-file buffers
def IsWriteable(view):
	return view.file_name() and os.access(view.file_name(), os.W_OK)

def IsWriteProtected(view):
	return view.file_name() and not os.access(view.file_name(), os.W_OK)

# Event to catch buffer activation and check readonly/writeable
# Note: Running the commands doesn't de- and re-activate the view focus,
# so the ReadOnlyCheck event doesn't fire. We call the function manually
# for each command.
class ReadOnlyCheck(sublime_plugin.EventListener):
	def on_activated(self, view):
		UpdateViewWriteability(view)

# Commands

class P4EditCommand(sublime_plugin.TextCommand):
	"""P4 Edit"""
	def run(self, edit):
		os.system("p4 edit \"" + self.view.file_name() + "\"")
		UpdateViewWriteability(self.view) 

	def is_enabled(self):
		return IsWriteProtected(self.view)

class P4RevertCommand(sublime_plugin.TextCommand):
	"""P4 Revert if unchanged"""
	def run(self, edit):
		os.system("p4 revert -a \"" + self.view.file_name() + "\"")
		UpdateViewWriteability(self.view)

	def is_enabled(self):
		return IsWriteable(self.view)

class P4AddCommand(sublime_plugin.TextCommand):
	"""P4 Add"""
	def run(self, edit):
		os.system("p4 add \"" + self.view.file_name() + "\"")
		UpdateViewWriteability(self.view)

	def is_enabled(self):
		return IsWriteable(self.view)
