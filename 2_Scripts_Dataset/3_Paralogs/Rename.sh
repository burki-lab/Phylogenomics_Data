###TAKES BLOBTOOLS OUTPUT AND RENAMES TO A MORE LEGIBLE FORMAT

for i in /proj/uppstore2018069/Harshal/2_Dataset/Paralogs/*.filtered.fna
do
mv $i ${i%%.*}.paralogs.fa
done
