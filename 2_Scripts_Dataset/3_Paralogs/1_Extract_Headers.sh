#This script searches for words in FASTA files (in this case Rhizaria) and creates a list with all the FASTA headers, while removing the '>' character

for f in /proj/uppstore2018069/Harshal/2_Dataset/Paralogs/*.fa
do
grep -E -v -e '-(02190019|endo|nucleomorph)_[^_]*$' $f | grep -E --color -e "(-[^_]*_[^_]*$)" > ${f%%.*}.txt
#grep -i "paralog" $f > ${f%%.*}.txt
sed -i 's/>//g' ${f%%.*}.txt
done
