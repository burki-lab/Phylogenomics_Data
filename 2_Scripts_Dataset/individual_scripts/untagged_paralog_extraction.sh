module load bioinfo-tools
module load blobtools/1.1.1

for j in /proj/uppstore2018069/Harshal/Paralogs/*.out
do
blobtools seqfilter -i ${j%%.*}.fa -l $j
done
