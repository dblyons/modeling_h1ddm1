#!/bin/bash

echo
echo '  usage: ./script.sh  <bsmap methratio output>  <annotation.gff> <out.single_c_gff_like>   <out.wba>'
echo 
echo '  produces two output files -- 3. single_c_like_gff  and  4. wba in approximately dzlabtools style'
echo 
echo

awk 'OFS="\t" {print $1,$7,$4,$2,$2,$5,$3,$8,"c="$7";t="$8-$7}' $1 > $3<\br>
<\br>
bedtools map -c 2,8 -o sum -null "NA" -a $2 -b $3 | <\br>
perl -wnla -e ' if (/NA$/) {print "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8];c=0;tot=0"} <\br>
else {$score=$F[9]/$F[10]; print "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$score\t$F[6]\t$F[7]\t$F[8];c=$F[9];tot=$F[10]"};'  > $4<\br>
<\br>
