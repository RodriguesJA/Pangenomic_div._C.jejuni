#Roary - pangenome construction: Installation can be complicated use https://github.com/sanger-pathogens/Roary/issues/427 to isntall ensuring correct Perl installation
import os
import urllib
import re

genome_file = open("/mnt/f/test.txt")
read_genome_file = genome_file.readlines()


for i in read_genome_file:
	i = i.rstrip("\n")
	i = i.rstrip("\r")
	i = str(i) #Similar to the above code we are reading the genomes and stripping the tabs and spaces to set up a loop for all the genomes
	#os.system("cp /mnt/f/Prokka_Results/" + i + "/" + i +".gff /mnt/f/ref_free/total") # Here using shell command cp (to change directories) we are moving the *gff output from the prokka director to  that Roary will use for the pangenome assembly
	
os.system("roary -e -p 8 -f $HOME/anaconda3/envs/roary2_env/roary/results $HOME/anaconda3/envs/roary2_env/roary/*.gff") #Here use all the genomes in a specific folder to construct a pangenome check Github for specific commands : https://github.com/sanger-pathogens/Roary/blob/master/README.md#usage
# -p # of threads used (i.e. computer processors usually 2 threads per core) -e mutliFASTA alignment utilizing PRANK -n fast core genome alignment utilzing MAFFT, (use with -e), -v verbose outpout (more info) -f specifies the output directory

#os.system("/home/osboxes/lyve-SET-2.0.1/scripts/raxmlHPC -m GTRGAMMA -p 12345 -x 12345 -s /mnt/win/Ecoli_MDHHS/contigs/ref_free_group1/roary/core_gene_alignment.aln -# 100 -n MDHHS_group1Bphylo_output.nwk -f a")
