# Here, using a quick Python script looped through all genomes in a specific directory
import os  #This is important to have Python installed. if you are using a conda environment, you need to be able to use bash to run the command line
import urllib
import re

Genomes_file = open( "/[file path]/cattlegenomes.txt" ) #Text file with all the genomes to be used in this pipeline. A file is used instead of a directory to edit which genomes are utilized easily.
Genomes_pair = Genomes_file.readlines() #Here, you are reading all of the file names within a specific folder readlines enable this fx 

for i in Genomes_pair: #Here, we are stripping tabs and spaces from file names 
	i = i.rstrip("\n")
	i = i.rstrip("\r") 
	print (i)
	pairGenome = i.split("\t")  
	RefGenome = str(pairGenome[0])  #Here, we place all of the integers within our file that we read and strip into an array. In this case, each TW# Will be in an array that is called RefGenome
	os.system("fastqc ~/Campy_Genomes/" +RefGenome+ "/" +RefGenome+ "s1_*  ~/Campy_Genomes/" +RefGenome+ "/" +RefGenome+ "s2_* --outdir=/[filepath]fastqc/" + RefGenome)
	print(RefGenome + "_DONE")
#The above loop uses the shell command to enact fastqc a while loop out, putting the files in the directory. Therefore, each TW# will run through this loop, and the last line prints which TW# is being utilized
#Fastqc is the call and the commands. my file directory has the genome name / with s1_pe file names * means ignore the rest or all files with that s1_ in the name we provide the s1 and s2 and the out directory file
# Adapted from Dr. Heather Blaneksnhip, Ph.D., who created the first version of this script.
