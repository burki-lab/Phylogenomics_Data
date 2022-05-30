#Batch script to execute tree-making for all aligned files

for i in /proj/uppstore2018069/Harshal/Subsetted_Data/edited_alignment/*.trimAl-gappy.fa
do
sbatch 9_Trees.sh $i
done
