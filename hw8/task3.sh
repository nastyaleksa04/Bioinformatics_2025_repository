#!/bin/bash
read -r line < fin
echo "${line:9:1}" >> fout
