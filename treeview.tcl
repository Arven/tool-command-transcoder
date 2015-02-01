proc treeview {{name .} {tree {}}} {
    set tree [ .files insert $tree end -text [lindex [file split $name] end] ]
    foreach subdir [ glob -nocomplain -directory $name -type d * ] {
        treeview $subdir $tree
    }
    foreach leaf [ glob -nocomplain -directory $name -type f * ] {
        set item [.files insert $tree end -text [lindex [file split $leaf] end]]
        set fp [open "|mediainfo --inform=file://inform.txt \"$leaf\""]
        set data [split [read $fp] "\n"]
        .files set $item size [lindex $data 0]
        .files set $item runtime [lindex $data 1]
        .files set $item audio [lindex $data 2]
        .files set $item video [lindex $data 3]
    }
}
