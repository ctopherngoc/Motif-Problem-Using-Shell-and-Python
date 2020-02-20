Author: Christopher Nguyen
Class: RBIF-100


How to use:
1. Make sure the database directory, clinical data.txt, copyExomes.sh, create.CrisprReady.sh, editGenome.sh, identifyCrisprSite.sh, and motif_list.txt are in the same directory. 

2.Run copyExomes.sh

3.When copyExomes.sh is completed, run createCrisprReady.sh. Be patient.

4. When createCrisprReady.sh is completed, run identifyCrisprSite.sh.

5. When identifyCrisprSite.sh is completed, run editGenome.sh.

6. Run exomeReport.py


The copyExomes.sh script searches the clinical_data.txt file for diameter of 20-30mm and if the exome was sequenced. The codenames that pass the searches, their corresponding fasta file in the database directory will be copied to the new Exomes directory. 

The createCrisprReady.sh script then searches the qualifying exomes for their top three occurring motifs that  are in the motif_list.txt. It then takes these exome fasta and filters out every gene sequence that does not have one of the three top motifs and outputs a new file named codename_topmotif.fasta in the Exomes directory.

The identifyCrisprSite.sh script and if there is not at least 20 base pairs upstream from the designated "NGG" sequence. These new fasta file is named codename_topmotif.fasta located in the exomes directory. The script then outputs the file named codename_precrispr.fasta in the precrispr folder.

The editGenome.sh script places a "A" in front of the "N" in "NGG" in each gene sequence and renames the file to codename_postcrispr.fasta and outputs it into the postcrispr directory.

The exomeReport.py reports the findings of the genes and outputs a txt file named report.txt





