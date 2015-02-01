proc treeview {{name .} tree} {
    puts $name
    set tree [ .tree insert $tree end -text $name ]
    foreach subdir [glob -nocomplain -directory $name -type d *] {
        treeview $subdir $tree
    }
    foreach leaf [ glob -nocomplain -directory $name -type f * ] {
        .tree insert $tree end -text $leaf
    }
}
