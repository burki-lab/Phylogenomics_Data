for i in /proj/uppstore2018069/Harshal/Paralogs/*.fa
do
file="$(basename $i .fa)"
#echo $file
re='[0-9]'

if [[ ${file: -1} =~ $re ]]
then
	search="${file::-1}"
	echo $search
	grep ">" $i | grep -- "$search" > ${i%.*}.out;
else
	src = "${file}"	
	grep ">" $i | grep -- "$src" > ${i%.*}.out;
fi

#echo $search
#grep ">" $i | grep -- "$search" > ${i%.*}.out;
#grep ">" $i | grep -- "$src" > ${i%.*}.out;
#grep -P '\_\w+\_\w+\-\${search}' $i > ${i%.*}.out
#grep -o -P '(?<='-').*(?="${search}")' $i > ${i%.*}.out
done



module load bioinfo-tools
module load blobtools/1.1.1

for j in /proj/uppstore2018069/Harshal/Paralogs/*.out
do
blobtools seqfilter -i ${j%%.*}.fa -l $j
done
