#This script searches for words in FASTA files (in this case Rhizaria) and creates a list with all the FASTA headers, while removing the '>' character

for f in /proj/uppstore2018069/Harshal/1_Sequence_Extraction/*.faa
do
grep "Rhizaria" $f > ${f%%.*}.txt
sed -i 's/>//g' ${f%%.*}.txt
done
