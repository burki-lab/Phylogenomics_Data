#Blasts queries against previously created blast databases

module load bioinfo-tools
module load blast/2.12.0+

for i in /proj/uppstore2018069/Harshal/Subsetted_Data/Annotated_Genomes/*.proteins.fa
do
for j in /proj/uppstore2018069/Harshal/Subsetted_Data/Blast_Queries/*.faa.filtered.fna
do
touch ${j%%.*}_empty.txt
blastp -db ${i%%.*} -query $j -out ${j%%.*}.out  -num_threads 3 -show_gis -max_target_seqs 10 -outfmt "6 qseqid sseqid pident qcovs evalue bitscore qlen length" -evalue 1e-20 -qcov_hsp_perc 90
cat ${j%%.*}_empty.txt ${j%%.*}.out >> ${j%%.*}.txt
done
done

sh 2_Process.sh
rm /proj/uppstore2018069/Harshal/Subsetted_Data/Blast_Queries/*_empty.txt
mv /proj/uppstore2018069/Harshal/Subsetted_Data/Blast_Queries/*.txt /proj/uppstore2018069/Harshal/Subsetted_Data
