#Takes blast results and runs filters

for i in /proj/uppstore2018069/Harshal/Subsetted_Data/*.txt
do
awk '($8>=200) && ($6>=93)' $i > ${i%%.*}_refined.txt
cut -f2 ${i%%.*}_refined.txt | sort | uniq > ${i%%.*}_hits.txt
done

mv /proj/uppstore2018069/Harshal/Subsetted_Data/Blast_Queries/*_refined.txt /proj/uppstore2018069/Harshal/Subsetted_Data/Blast_Queries/hits
sh 3_Extract.sh
