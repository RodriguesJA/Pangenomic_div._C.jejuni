#Abricate - to identify specific genes within databases (resistance genes, virulence genes, and plasmids)
import os
import urllib
import re


genome_file = open("[text.txt]")
read_genome_file = genome_file.readlines()

for i in read_genome_file:
	os.system("abricate --db resfinder ./" + i + ">> ./resfinder_results.tab")
	os.system("abricate --db card ./" + i + ">> ./card_results.tab")
	os.system("abricate --db ncbi ./" + i + ">> ./ncbi_results.tab")
	os.system("abricate --db vfdb ./" + i + ">> ./virulence_typing_results.tab")
	os.system("abricate --db plasmidfinder ./" + i + ">> ./stx1_results.tab")

	print ("done " + i)
