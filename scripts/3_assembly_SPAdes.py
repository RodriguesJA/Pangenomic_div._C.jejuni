import os
import urllib
import re

from Bio.Blast.Applications import NcbiblastxCommandline
from Bio.Blast.Applications import NcbiblastnCommandline   #Imports support commands from different libraries (Bio=Biopython package) 
from Bio.Seq import Seq
from Bio import SeqIO
from Bio.Blast import NCBIWWW
from Bio.Blast import NCBIXML
from decimal import *


Genomes_file = open( "[file path] Cattle_Genomes/Test.txt" ) #Text file with all the genomes to be used in this pipeline. File is used instead of a directory in order to edit which genomes are utilized easily
Genomes_pair = Genomes_file.readlines() #Here you are reading all of the file names within a specific folder readlines enables this fx 

for i in Genomes_pair: #Here we are stripping tabs and spaces from file names 
	i = i.rstrip("\n")
	i = i.rstrip("\r") 
	print (i)
	pairGenome = i.split("\t")  
	RefGenome = str(pairGenome[0])  #Here we place all of the integers within our file that we read and stripped into an array. In this case each TW# Will be in an array that is called RefGenome
	os.system("spades.py --careful -k 21,33,55,77,99,127 --pe1-1 [file path]" + RefGenome + "/" + RefGenome + "s1_pe.fastq --pe1-2 [file path]" + RefGenome + "/" + RefGenome + "s2_pe.fastq  -o  [output directory]" + RefGenome)
	print(RefGenome + "_DONE")
#Adapted from Dr. Heather Blankenship, Ph.D., who wrote the original draft of this script
