#Removed duplicates from the merged files

module load bioinfo-tools
module load SeqKit/0.15.0

for i in /proj/uppstore2018069/Harshal/Subsetted_Data/final_dataset/*.merged.fa
do 
#a=${basename $i .merged.fa}
#a="srp54"
seqkit rmdup -n $i -o ${i%%.*}.fa -D duplicates_${i%%.*}.txt
done

mkdir /proj/uppstore2018069/Harshal/Subsetted_Data/final_dataset/contains_duplicates
mv /proj/uppstore2018069/Harshal/Subsetted_Data/final_dataset/*.merged.fa /proj/uppstore2018069/Harshal/Subsetted_Data/final_dataset/contains_duplicates/
mv /proj/uppstore2018069/Harshal/Subsetted_Data/final_dataset/*.txt /proj/uppstore2018069/Harshal/Subsetted_Data/final_dataset/contains_duplicates/
