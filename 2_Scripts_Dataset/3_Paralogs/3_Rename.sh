#Renames the files from .filtered.fna to .paralogs.fa

for i in /proj/uppstore2018069/Harshal/2_Dataset/Paralogs/*.filtered.fna
do
mv $i ${i%%.*}.paralogs.fa
done
