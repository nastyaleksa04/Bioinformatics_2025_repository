#!/bin/bash
IFS=$'\t' read a b c < fin
sum=$((a + b + c))
echo "$sum" > fout
