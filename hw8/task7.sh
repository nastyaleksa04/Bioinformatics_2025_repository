#!/bin/bash
INSERT_CHR="1"
DEL_CHR="2"
awk -v ins_chr="$INSERT_CHR" -v del_chr="$DEL_CHR" '
BEGIN {
	max_ins_len = 0
	max_ins_line = ""     
	max_del_len = 0 
	max_del_line = ""
}
/^#/ { next }
{
	chr = $1
	ref = $4
	alt = $5
	split(alt, alts, ",")    
	alt_first = alts[1] 

	if (length(ref) < length(alt_first)) {
		len = length(alt_first) - length(ref)
		if (chr == ins_chr && len > max_ins_len) {
			max_ins_len = len
			max_ins_line = $0
		}
	}else if (length(ref) > length(alt_first)) {
		len = length(ref) - length(alt_first)
		if (chr == del_chr && len > max_del_len) {
			max_del_len = len
			max_del_line = $0
		}
	}
}
END {
	print "Самая длинная вставка в хромосоме " ins_chr ":"
	if (max_ins_line != "") {
		 print max_ins_line
		 print "Длина: " max_ins_len
	 } else {
	 	print "Не найдено"
	 }
 	 print "\nСамая большая делеция в хромосоме " del_chr ":"
	 if (max_del_line != "") {
		 print max_del_line
		 print "Длина: " max_del_len
	 } else {
	 	print "Не найдено"
	}
}' clinvar_20250330.vcf >> fout
