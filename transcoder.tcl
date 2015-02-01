#!/usr/bin/wish
package require tile
source treeview.tcl

ttk::setTheme alt
ttk::treeview .tree
pack .tree -expand 1 -fill both

treeview ../path {}
