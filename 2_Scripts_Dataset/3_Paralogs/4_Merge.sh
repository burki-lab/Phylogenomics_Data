#Merges all paralogs per gene

for i in /proj/uppstore2018069/Harshal/2_Dataset/Paralogs/*.paralogs.fa
do
##f="${basename $i .paralogs.fa}"
touch ${i%%.*}_empty.txt
cat ${i%%.*}.fa ${i%%.*}_empty.txt >> $i
rm ${i%%.*}_empty.txt
done
