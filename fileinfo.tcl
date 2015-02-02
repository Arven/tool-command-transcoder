proc fileinfo {{name .}} {
    set fp [open "|mediainfo --inform=file://long-info.txt \"$name\""]
    set data [read $fp]
    .v.fi.txt insert end $data
}