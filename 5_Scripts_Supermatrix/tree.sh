#The input of this file is the results from executing https://github.com/nylander/catfasta2phyml over all the FASTA files

#!/bin/bash --login

#SBATCH -A snic2021-5-302
#SBATCH -M SNOWY
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 100:00:00
#SBATCH -J SAR_supermatrix
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user harshal-kunal.bhawe.7340@student.uu.se

module load bioinfo-tools # check for updates
module load MAFFT/7.407
module load trimAl/1.4.1
module load iqtree/2.0-rc2-omp-mpi
module load gcc/6.3.0
module load openmpi/2.1.0

### SETTINGS
#OUTDIR=/proj/uppstore2018069/Harshal/testing/partition/partitioned  #the directory where you want the files to be saved
#fasta=/proj/uppstore2018069/Harshal/2_Dataset/Test/ABCE_nodupl.fa  #the directory of the fasta file
#append=${1%%.*} #append the name you want your alignments and tree files to have
#m="$(basename ${1%%.*} .fa)"

# Make temp dir
#MAPDIR_temp=$SNIC_TMP/IQtrees
#mkdir $MAPDIR_temp
#cd $MAPDIR_temp
#cp $1 .
#cp $2 .

iqtree -s $1 -m TEST -bb 1000 -alrt 1000 -st AA -nt 4 -pre SAR_supermatrix

#rsync -av $MAPDIR_temp/* $OUTDIR
#rsync -av $MAPDIR_temp/*.IQtree.treefile $OUTDIR



