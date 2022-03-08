#This script takes in the FASTA files as input, then uses the list created by the Extract_Headers script, and creates a new Filtered FNA file with those headers and sequences

module load bioinfo-tools 
module load blobtools/1.1.1
 
for i in /proj/uppstore2018069/Harshal/2_Dataset/Paralogs/*.fa
do
for j in ${i%%.*}.txt
do 
blobtools seqfilter -i $i -l $j
break
done
done
