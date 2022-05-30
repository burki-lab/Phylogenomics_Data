#Merged blast hits, prokaryotes, paralogs and the original dataset

for i in /proj/uppstore2018069/Harshal/Subsetted_Data/*.fa
do
##f="${basename $i .paralogs.fa}"
touch ${i%%.*}.merged.fa
cat ${i%%.*}.fa ${i%%.*}.paralogs.fa ${i%%.*}.prokaryotes.fa ${i%%.*}.hits.fa >> ${i%%.*}.merged.fa
done

rm /proj/uppstore2018069/Harshal/Subsetted_Data/*.paralogs.fa
rm /proj/uppstore2018069/Harshal/Subsetted_Data/*.prokaryotes.fa
mv /proj/uppstore2018069/Harshal/Subsetted_Data/*.hits.fa /proj/uppstore2018069/Harshal/Subsetted_Data/hits
