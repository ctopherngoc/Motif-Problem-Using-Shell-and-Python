#! /bin/bash

#remove old precrispr directory and content
rm -r precrispr

#make new precrispr directory
mkdir precrispr

#read codename list
while read c;
do 
    grep -Eo -B1 '.{21,}GG.{0,}' exomes/$c.fasta* > precrispr/$c"_precrispr".fasta_tmp #Search NGG and at least 20 upstream base pairs and creates a temp fasta file
    tr -d "-" < precrispr/$c"_precrispr".fasta_tmp > precrispr/$c"_precrispr".fasta #cleans up file removing "-"
    rm precrispr/$c"_precrispr".fasta_tmp #removes temp fasta
    sed -i "" '/^[[:space:]]*$/d' precrispr/$c"_precrispr".fasta #removes carriage return
done <list.txt