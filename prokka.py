#Prokka annotated of all C. jejuni scripts. Here using a quick python script looped through all genomes in a specific directory
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


Campy_Genomes_file = open( "/mnt/f/test.txt" ) #Text file with all the genomes to be used in this pipeline. File is used instead of a directory in order to easily edit which genomes are utilized
Campy_Genomes_pair = Campy_Genomes_file.readlines() #Here you are reading all of the file names within a specific folder readlines enables this fx 
os.system(" mkdir /mnt/f/Prokka_Results ") 


for i in Campy_Genomes_pair: #Here we are stripping tabs and spaces from file names 
	i = i.rstrip("\n")
	i = i.rstrip("\r") 
	print (i)
	pairGenome = i.split("\t")  
	RefGenome = str(pairGenome[0])  #Here we place all of the integers within our file that we read and stripped into an array. In this case each TW# Will be in an array that is called RefGenome
	os.system("prokka  --outdir /mnt/f/Prokka_Results/" + RefGenome + " --prefix "  +  RefGenome   + "   /mnt/f/Genomes/" + RefGenome + ".fasta --compliant") #Here we are using Prokka to annotate genomes see https://github.com/tseemann/prokka
	print (RefGenome + "_DONE")    #The above loop using the shell command to inact prokka while out putting the the files in the directory .../Prokka as well as appending the RefGenome loop. Therefore each TW# will run through this loop and the last line prints which TW# is being utilized 