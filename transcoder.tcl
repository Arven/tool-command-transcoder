#!/usr/bin/tclsh
package require Tk

source treeview.tcl
source fileinfo.tcl

# Initialize Program Defaults
wm title . "Tool-Command Transcoder"
ttk::setTheme alt

# Main Resizable Pane
ttk::panedwindow .v -orient vertical

# Tree View
ttk::treeview .v.files -columns "size length audio video"
.v.files heading size -text "Size"
.v.files column  size -width 50
.v.files heading length -text "Length"
.v.files column  length -width 100
.v.files heading audio -text "Audio"
.v.files column  audio -width 200
.v.files heading video -text "Video"
.v.files column  video -width 200

# File Info Panel
ttk::frame .v.fi
text .v.fi.txt
ttk::scrollbar .v.fi.sby -orient vert -command { .v.fi.txt yview }
.v.fi.txt conf -yscrollcommand { .v.fi.sby set }

pack .v.files -expand yes -fill both
pack .v.fi -expand yes -fill both
pack .v.fi.sby .v.fi.txt -expand no -fill y -side right
pack .v.fi.txt -expand yes -fill both
pack .v -expand yes -fill both

.v add .v.files
.v add .v.fi

treeview ../path
fileinfo ../path
