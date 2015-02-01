#!/usr/bin/tclsh
package require Tk
source treeview.tcl

wm title . "Tool-Command Transcoder"

ttk::setTheme alt
ttk::treeview .files
pack .files -expand 1 -fill both

treeview ../path
