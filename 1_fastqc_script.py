# Here using a quick python script looped through all genomes in a specific directory
import os  #This is the important to have biopython will have this already installed if you are using a conda environment need to be able to use bash to run the command line
import urllib
import re

Genomes_file = open( "/[file path]/cattlegenomes.txt" ) #Text file with all the genomes to be used in this pipeline. File is used instead of a directory in order to easily edit which genomes are utilized
Genomes_pair = Genomes_file.readlines() #Here you are reading all of the file names within a specific folder readlines enables this fx 

for i in Genomes_pair: #Here we are stripping tabs and spaces from file names 
	i = i.rstrip("\n")
	i = i.rstrip("\r") 
	print (i)
	pairGenome = i.split("\t")  
	RefGenome = str(pairGenome[0])  #Here we place all of the integers within our file that we read and stripped into an array. In this case each TW# Will be in an array that is called RefGenome
	os.system("fastqc ~/Campy_Genomes/" +RefGenome+ "/" +RefGenome+ "s1_*  ~/Campy_Genomes/" +RefGenome+ "/" +RefGenome+ "s2_* --outdir=/[filepath]fastqc/" + RefGenome)
	print(RefGenome + "_DONE")
#The above loop using the shell command to inact prokka while out putting the the files in the directory. Therefore each TW# will run through this loop and the last line prints which TW# is being utilized
#Fastqc is the call and the commands. my file directory has the genome name / with s1_pe file names * means ignore the rest or all files with that s1_ in the name we provide the s1 and s2 and the outdirectory file
# The first version of this script was created by Dr. Heather Blaneksnhip, PH.D.
