#!/bin/bash

cat $1 |
    sed -e 's/M/ M /g' |
    sed -e 's/U/ U /g' |
    sed -e 's/X/ X /g' |
    sed -e 's/F/ F /g' |
    sed -e 's/Z/ Z /g' |
    sed -e 's/W/ W /g' |
    sed -e 's/R/ R /g' |
    sed -e 's/G/ G /g' |
    sed -e 's/N0/N0 /g' |
    sed -e 's/ \+/ /g' |
    sed -e 's/^ //g' |
    sed -e 's/ /,/g' |
    sed -e '/^N/!s/^/N0,000,/gi'|
    awk 'BEGIN{FS=",";OFS=","}$3=="X"{$3=",,X"}1' |
    awk 'BEGIN{FS=",";OFS=","}$5=="Z"{$5=",,Z"}1' |
    awk 'BEGIN{FS=",";OFS=","}$9=="F"{$9=",,F"}1' |
    sed -e 's/T0001/,,,,,,,,,,T0001/g' |
    sed -e 's/T0000/,,,,,,,,,,T0000/g' |
    awk 'BEGIN{FS=",";OFS=","}$3=="M"{$3=",,,,,,,,,,M"}1' |
    awk 'BEGIN{FS=",";OFS=","}$7=="F"{$7=",,,,F"}1' |
    awk 'BEGIN{FS=",";OFS=","}$5=="U"{$5=",,,,,,,,,,,,U"}1'|
    awk 'BEGIN{FS=",";OFS=","}$7=="M"{$7=",,,,,,,,,,M"}1'|
    sed -e '70,$s/^N0,000/,/g' |
    awk -F, '{print $2,$4,$6,$8,$10,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21}' |
    sed 's/ /,/g' |
    sed '1iN0,G,X,Z,R,F' > $(basename $1 .txt).csv






    






