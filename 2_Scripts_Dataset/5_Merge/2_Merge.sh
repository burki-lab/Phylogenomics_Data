for i in /proj/uppstore2018069/Harshal/2_Dataset/Final_fasta/*.fa
do
##f="${basename $i .paralogs.fa}"
touch ${i%%.*}.merged.fa
cat ${i%%.*}.paralogs.fa ${i%%.*}.prokaryotes.fa ${i%%.*}.hits.fa >> ${i%%.*}.merged.fa
done

mv *.paralogs.fa paralogs/
mv *.prokaryotes.fa prokaryotes/
mv *.hits.fa blast_hits/
