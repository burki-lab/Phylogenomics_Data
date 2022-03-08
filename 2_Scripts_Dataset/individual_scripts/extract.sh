module load bioinfo-tools 
module load blobtools/1.1.1
 
for j in /proj/uppstore2018069/Harshal/single_gene_test/ref_seq/*_hits.txt
do 
blobtools seqfilter -i ${j%%_hits.*}.proteins.fa -l $j 
done
