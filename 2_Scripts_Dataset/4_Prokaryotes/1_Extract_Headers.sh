#This script searches for words in FASTA files (in this case Prokaryota) and creates a list with all the FASTA headers, while removing the '>' character

for f in /proj/uppstore2018069/Harshal/2_Dataset/Paralogs/Original_files/*.fa
do
grep -i "Prokaryota" $f > ${f%%.*}_prokaryotes.txt
sed -i 's/>//g' ${f%%.*}_prokaryotes.txt
##mv /proj/uppstore2018069/Harshal/2_Dataset/Paralogs/Original_files/*_prokaryotes.txt /proj/uppstore2018069/Harshal/2_Dataset/Bacteria
done
