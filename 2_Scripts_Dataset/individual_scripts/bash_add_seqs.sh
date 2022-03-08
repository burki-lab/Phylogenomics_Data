module load bioinfo-tools
module load blast/2.12.0+
module load blobtools/1.1.1

###SETTINGS
OUTDIR=/proj/uppstore2018069/Harshal/2_Dataset/Final_fasta
DATASET=/proj/uppstore2018069/Harshal/2_Dataset/Dataset
BLASTDB=/proj/uppstore2018069/Harshal/2_Dataset/Annotated_Genomes
PARALOGS=/proj/uppstore2018069/Harshal/2_Dataset/Paralogs
BLASTQUERIES=/proj/uppstore2018069/Harshal/2_Dataset/Blast_Queries
SCRIPTS=/proj/uppstore2018069/Harshal/2_Scripts

for k in $BLASTQUERIES/*_hits.txt
do
m="$(basename ${k%%.*} .txt)"
for l in $BLASTDB/*.fa
do
blobtools seqfilter -i ${l%%.*}.proteins.fa -l $k -o ${k%%.*}
###touch ${k%%.*}_empty.fa
f="$(basename ${l%%.*} .proteins.filtered.fna)"
###m="$(basename ${k%%.*} .txt)"
touch ${k%%.*}_empty.fa
#perl -pi -e "s/^>/>${f}-/g" $i
perl -pi -e "s/^>/>${f}-/g" ${k%%.*}.${f}.proteins.filtered.fna
cat ${k%%.*}.${f}.proteins.filtered.fna ${k%%.*}_empty.fa >> ${k%%.*}.hits.fa
###mv ${k%%.*}.hits.fa $OUTDIR
done
done

mv *.hits.fa $OUTDIR

