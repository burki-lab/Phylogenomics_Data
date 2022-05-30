#Batch executes all .fa files to the alignment and tree-making script\

for i in /proj/uppstore2018069/Harshal/2_Dataset/Final_fasta/*.fa
do
sbatch tree.sh $i
done
