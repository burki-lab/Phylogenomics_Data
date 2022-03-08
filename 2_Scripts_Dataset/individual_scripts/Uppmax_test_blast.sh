#!/bin/bash --login

#SBATCH -A snic2021-5-302
#SBATCH -M SNOWY
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 03:00:00
#SBATCH -J blast
#SBATCH --mail-type=ALL
#SBATCH --mail-user harshal-kunal.bhawe.7340@student.uu.se


module load bioinfo-tools
module load blast/2.12.0+
module load blobtools/1.1.1

###SETTINGS
OUTDIR=/proj/uppstore2018069/Harshal/2_Dataset/Final_fasta
DATASET=/proj/uppstore2018069/Harshal/2_Dataset/Dataset
BLASTDB=/proj/uppstore2018069/Harshal/2_Dataset/Annotated_Genomes
PARALOGS=/proj/uppstore2018069/Harshal/2_Dataset/Paralogs
BLASTQUERIES=/proj/uppstore2018069/Harshal/2_Dataset/Blast_Queries

for i in $BLASTDB/*.fa
do
for j in $BLASTQUERIES/*.fna
do
touch ${j%%.*}_empty.txt
blastp -db ${i%%.*} -query $j -out ${j%%.*}.out  -num_threads 4 -show_gis -max_target_seqs 10 -outfmt 6  -evalue 1e-20
cat ${j%%.*}_empty.txt ${j%%.*}.out >> ${j%%.*}.txt

cut -f2 ${j%%.*}.txt > ${j%%.*}_extracted.txt
sort ${j%%.*}_extracted.txt | uniq > ${j%%.*}_hits.txt
rm ${j%%.*}_extracted.txt

done
done

rm $BLASTQUERIES/*.out
rm $BLASTQUERIES/*_empty.txt
#mv $BLASTQUERIES/*.txt $OUTDIR
