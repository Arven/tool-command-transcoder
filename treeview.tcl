proc treeview {{name .} {tree {}}} {
    set tree [ .v.files insert $tree end -text [lindex [file split $name] end] ]
    foreach subdir [ glob -nocomplain -directory $name -type d * ] {
        treeview $subdir $tree
    }
    foreach leaf [ glob -nocomplain -directory $name -type f * ] {
        set item [.v.files insert $tree end -text [lindex [file split $leaf] end]]
        set fp [open "|mediainfo --inform=file://short-info.txt \"$leaf\""]
        set data [split [read $fp] "\n"]
        .v.files set $item size [lindex $data 0]
        .v.files set $item length [lindex $data 1]
        .v.files set $item video [lindex $data 2]
        .v.files set $item audio [lindex $data 3]
    }
}
