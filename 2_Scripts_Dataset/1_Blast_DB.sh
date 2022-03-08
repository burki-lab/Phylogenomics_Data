module load bioinfo-tools
module load blast/2.12.0+

for i in /proj/uppstore2018069/Harshal/2_Dataset/Annotated_Genomes/*.fa
do
makeblastdb -in $i -title ${i%%.*} -out ${i%%.*} -dbtype prot
done

