#Aligns the merged final files with MAFFT

#!/bin/bash --login

#SBATCH -A snic2021-5-302
#SBATCH -M SNOWY
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J mafft_align
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user harshal-kunal.bhawe.7340@student.uu.se


module load bioinfo-tools
module load MAFFT/7.407
module load trimAl/1.4.1

#OUTDIR=/proj/uppstore2018069/Harshal/testing/multigene_test
#append=${1%%.*} #append the name you want your alignments and tree files to have
#m="$(basename ${1%%.*} .fa)"


for i in /proj/uppstore2018069/Harshal/Subsetted_Data/final_dataset/*.fa
do
m="$(basename ${i%%.*} .fa)"

mafft --auto --adjustdirectionaccurately --thread 2 --reorder $i > $m.Mafft-auto.fa

##### Run Trim-Al
        TRIM=$m.Mafft-auto.fa
        trimal -in $TRIM -out $m.trimAl-gappy.fa -gappyout -fasta
done
