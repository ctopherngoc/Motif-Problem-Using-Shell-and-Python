#! /bin/bash

#Remove old postcrispr directory and codename_precrispr.fasta
rm -r postcrispr

#Create new postcrispr directory
mkdir postcrispr

#Read codename list and append "A" infront of "NGG" in each sequence for each codename_precrispr.fasta. Outputs codename_postcrispr.fasta
while read c;
do
    sed -e 's/\(CGG\)/A\1/g' -e 's/\(AGG\)/A\1/g' -e 's/\(GGG\)/A\1/g' -e 's/\(TGG\)/A\1/g' precrispr/$c"_precrispr".fasta >> postcrispr/$c"_postcrispr".fasta
done < list.txt