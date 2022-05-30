#Tree-making with IQTree

#!/bin/bash --login

#SBATCH -A snic2021-5-302
#SBATCH -M SNOWY
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 35:00:00
#SBATCH -J phylogenetic_tree
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user harshal-kunal.bhawe.7340@student.uu.se

module load bioinfo-tools # check for updates 
module load MAFFT/7.407 
module load trimAl/1.4.1 
module load iqtree/2.0-rc2-omp-mpi 
module load gcc/6.3.0 
module load openmpi/2.1.0

### SETTINGS
OUTDIR=/proj/uppstore2018069/Harshal/Subsetted_Data/edited_alignment  #the directory where you want the files to be saved 
#fasta=/proj/uppstore2018069/Harshal/2_Dataset/Test/ABCE_nodupl.fa  #the directory of the fasta file 
#append=${1%%.*} #append the name you want your alignments and tree files to have
m="$(basename ${1%%.*} .fa)"

# Make temp dir
MAPDIR_temp=$SNIC_TMP/IQtrees 
mkdir $MAPDIR_temp 
cd $MAPDIR_temp 
cp $1 .

##### Run Mafft-auto
#mafft --auto --adjustdirectionaccurately --thread 2 --reorder $1 > $m.Mafft-auto.fa
    
##### Run Mafft-linsi
####linsi --maxiterate 1000 --reorder --thread 4 $1 > ${append}_Mafft-linsi.fa

##### Run Trim-Al
#	TRIM=$m.Mafft-auto.fa
#	trimal -in $TRIM -out $m.trimAl-gappy.fa -gappyout -fasta

##### Run IQTree
	INPUT=$m.trimAl-gappy.fa
	OUTPUT=$m.IQtree
	iqtree -s $INPUT -m TEST -bb 1000 -alrt 1000 -st AA -nt 4 -pre $OUTPUT

### sync the files back in the OUTDIR
#rsync -av $MAPDIR_temp/$m.Mafft-auto.fa $OUTDIR 
#rsync -av $MAPDIR_temp/$m.trimAl-gappy.fa $OUTDIR 
rsync -av $MAPDIR_temp/$m.IQtree.log $OUTDIR
rsync -av $MAPDIR_temp/$m.IQtree.treefile $OUTDIR

#mv $OUTDIR/*.IQTree.* $OUTDIR/intermediate_files/
#mv $OUTDIR/*.Mafft-auto.* $OUTDIR/intermediate_files/
#mv $OUTDIR/*.trimAl-gappy.* $OUTDIR/intermediate_files/
