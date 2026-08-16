#!/usr/bin/env bash
wpctl status | awk '
  /Sinks:/  { insinks=1; next }
  /Sources:/{ insinks=0 }
  insinks && /[0-9]+\./ {
    line = $0
    sub(/^[^0-9]*/, "", line)
    id = line; sub(/\..*/, "", id)
    name = line
    sub(/^[0-9]+\.[ \t]*/, "", name)
    sub(/[ \t]*\[vol:.*$/, "", name)
    gsub(/"/, "\\\"", name)
    printf "{\"id\":\"%s\",\"name\":\"%s\"}, ", id, name
  }
' | sed 's/, $//' | awk '{print "[" $0 "]"}'
