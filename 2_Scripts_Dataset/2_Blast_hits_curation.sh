#Blasts queries against created blast databases, runs filters and extracts the hit sequences to a file. Also adds Species it was found in and predicted gene name to the FASTA header

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
SCRIPTS=/proj/uppstore2018069/Harshal/2_Scripts


###BLASTS RHIZARIANS AGAINST ANNOTATED GENOMES (from blast.sh, script.sh and extract.sh)
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

###EXTRACTS BLAST RESULTS, ADDS GENOME NAME TO HEADER AND MERGES FILES FOR EACH GENE (from add_seqs.sh)
for k in $BLASTQUERIES/*_hits.txt
do
m="$(basename ${k%%.*} .txt)"
for l in $BLASTDB/*.fa
do
blobtools seqfilter -i ${l%%.*}.proteins.fa -l $k -o ${k%%.*}
f="$(basename ${l%%.*} .proteins.filtered.fna)"
touch ${k%%.*}_empty.fa
perl -pi -e "s/^>/>${f}-/g" ${k%%.*}.${f}.proteins.filtered.fna
cat ${k%%.*}.${f}.proteins.filtered.fna ${k%%.*}_empty.fa >> ${k%%.*}.hits.fa
done
done

mv $BLASTQUERIES/*.hits.fa $OUTDIR
