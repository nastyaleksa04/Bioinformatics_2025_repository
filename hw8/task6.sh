#!/bin/bash
awk '
{
	lower = tolower($0)
	if (lower !~ /x|y/ && /[0-9]/) {
		sum += length($0)
	}
}
END {
	print sum
}' fin
