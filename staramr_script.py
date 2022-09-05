#Abricate - to identify specific genes within databases (resistance genes, virulence genes and plasmids)
import os
import urllib
import re

#from Bio.Blast.Applications import NcbiblastxCommandline
#from Bio.Blast.Applications import NcbiblastnCommandline
#from Bio.Seq import Seq
#from Bio import SeqIO
#from Bio.Blast import NCBIWWW
#from Bio.Blast import NCBIXML
#from decimal import *

genome_file = open("/mnt/home/rodri651/Cattle_Genomes.txt")
read_genome_file = genome_file.readlines()


for i in read_genome_file:
	i = i.rstrip("\n")
	i = i.rstrip("\r")
	i = str(i) #Similar to the above code we are reading the genomes and stripping the tabs and spaces to set up a loop for all the genomes

	os.system("staramr search --pointfinder-organism campylobacter   -o /mnt/home/rodri651/staramr_results/" + i + "--mlst-scheme campylobacter  /mnt/gs18/scratch/groups/manninglab/jar_cattlegenomes/" + i + ".fasta")

	print ("done " + i)