proc treeview {{name .} {tree {}}} {
    set tree [ .files insert $tree end -text [lindex [file split $name] end] ]
    foreach subdir [ glob -nocomplain -directory $name -type d * ] {
        treeview $subdir $tree
    }
    foreach leaf [ glob -nocomplain -directory $name -type f * ] {
        .files insert $tree end -text [lindex [file split $leaf] end]
    }
}
