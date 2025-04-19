#!/bin/bash
tr -d '\r' < fin | sort -t$'\t' -k2,2V -k3,3n -k4,4n >> fout
