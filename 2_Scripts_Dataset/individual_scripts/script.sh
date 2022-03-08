for i in /proj/uppstore2018069/Harshal/single_gene_test/ref_seq/*.txt
do
cut -f2 $i > ${i%%.*}_extracted.txt 
sort ${i%%.*}_extracted.txt | uniq > ${i%%.*}_hits.txt
rm ${i%%.*}_extracted.txt
done
