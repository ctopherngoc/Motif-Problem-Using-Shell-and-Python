#! /bin/bash

#Remove old doc/dir in home directory and create clean dir an docs
rm list.txt
rm -r exomes
rm -r topmotifs
mkdir exomes
mkdir topmotifs
ARRAY=()

#Filter clinical_data.txt by number range (20-30) & "Sequenced"
ARRAY+=$(egrep "(2[0-9]|30).*Sequenced" clinical_data.txt)

#Creates document list.txt and append code names
for i in ${ARRAY[@]}
do
    echo $i | grep -v '[^[:lower:]!+,]' >> list.txt
done

#Copies codename.fasta from exomes to exomes directory
while read i;
do
    cp database/$i.fasta exomes
    cp exomes/$i.fasta topmotifs/$i"_top3motifs".txt
done <list.txt
