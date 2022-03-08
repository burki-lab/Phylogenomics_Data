#!/bin/bash --login

#SBATCH -A snic2021-5-302
#SBATCH -M SNOWY
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J blast
#SBATCH --mail-type=ALL
#SBATCH --mail-user harshal-kunal.bhawe.7340@student.uu.se


module load bioinfo-tools
module load blast/2.12.0+

for i in /proj/uppstore2018069/Harshal/single_gene_test/ref_seq/*.fa
do
blastp -db ${i%%.*} -query /proj/uppstore2018069/Harshal/single_gene_test/PRPF8.faa.filtered.fna -out ${i%%.*}.txt  -num_threads 3 -show_gis -max_target_seqs 10 -outfmt 6  -evalue 1e-20
done
