#!/bin/bash
awk '{ sub(/\r$/, "") }  
NR%2 == 1 { name = $0; next } 
$0 ~ /777/ { print name ORS $0 }' fin >> fout
