#!/usr/bin/tclsh
package require Tk
package require Expect

source treeview.tcl

wm title . "Tool-Command Transcoder"

ttk::setTheme alt

ttk::treeview .files -columns "size runtime audio video"
.files heading size -text "Size"
.files column  size -width 50
.files heading runtime -text "Runtime"
.files column  runtime -width 100
.files heading audio -text "Audio"
.files column  audio -width 200
.files heading video -text "Video"
.files column  video -width 200

pack .files -expand 1 -fill both

treeview ../path
