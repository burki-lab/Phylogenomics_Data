#Removes duplicates from the files and stores them in a text file

module load bioinfo-tools
module load SeqKit/0.15.0

for i in /proj/uppstore2018069/Harshal/2_Dataset/Final_fasta/*.merged.fa
do 
seqkit rmdup -n $i -o ${i%%.*}.fa -D ${i%%.*}_duplicates.txt
done

mv *.merged.fa contains_duplicates/
mv *_duplicates.txt contains_duplicates/
