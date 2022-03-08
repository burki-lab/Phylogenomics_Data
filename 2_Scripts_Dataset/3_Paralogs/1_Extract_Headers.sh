#This script searches for words in FASTA files (in this case Paralog) and creates a list with all the FASTA headers, while removing the '>' character

for f in /proj/uppstore2018069/Harshal/2_Dataset/Paralogs/*.fa
do
grep -i "paralog" $f > ${f%%.*}.txt
sed -i 's/>//g' ${f%%.*}.txt
done
