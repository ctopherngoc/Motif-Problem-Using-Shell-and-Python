#! /bin/bash

#read codename list
while read i;
do
    #read each motif 
    while read p;
    do
        count=$(grep -o $p topmotifs/$i"_top3motifs".txt | wc -l)
        echo $count $p >> topmotifs/$i"_top3motifs".txt
    done < motif_list.txt

    #create txt containing top three motifs for each codename.fasta
    sort -nr -o topmotifs/$i"_top3motifs".txt topmotifs/$i"_top3motifs".txt
    dog=$(head -n 3 topmotifs/$i"_top3motifs".txt)
    echo $dog | tr -d '0123456789' | tr ' ' '\n' > topmotifs/$i"_top3motifs".txt
    sed -i "" '/^[[:space:]]*$/d' topmotifs/$i"_top3motifs".txt
done < list.txt   


#create a codename.txt file with all the genes containing at least one of top three motifs
while read c;
do
    while read a;
    do
        while read b;
        do
            grep -B1 $a exomes/$c.fasta*>> $c"wat".txt
        done < exomes/$c.fasta
    done < topmotifs/$c"_top3motifs".txt
done < list.txt

#format codename.txt and move and replace codename_topmotif.fasta in exomes directory
while read c;
do
        awk '!seen[$0]++' $c"wat".txt > $c"wat".txt_tmp  &&
        tr -d "-"< $c"wat".txt_tmp >$c"wat".txt_tmp1 &&
        sed -i "" '/^[[:space:]]*$/d' $c"wat".txt_tmp1
        mv $c"wat".txt_tmp1 $c"wat".txt_tmp &&
        mv $c"wat".txt_tmp $c"wat".txt
        mv $c"wat".txt exomes/$c"_topmotif".fasta
done < list.txt

#remove unecessary directory
rm -r topmotifs
