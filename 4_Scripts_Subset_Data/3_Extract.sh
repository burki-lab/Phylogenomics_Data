#Extracts filtered blast hit sequences with blobtools

module load bioinfo-tools
module load blobtools/1.1.1

#m="srp54"

for k in /proj/uppstore2018069/Harshal/Subsetted_Data/*_hits.txt
do
m="$(basename ${k%%.*} .txt)"
for l in /proj/uppstore2018069/Harshal/Subsetted_Data/Annotated_Genomes/*.fa
do
blobtools seqfilter -i ${l%%.*}.proteins.fa -l $k -o ${k%%.*}
f="$(basename ${l%%.*} .proteins.filtered.fna)"
touch ${k%%.*}_empty.fa
perl -pi -e "s/^>/>${f}-/g" ${k%%.*}.${f}.proteins.filtered.fna
cat ${k%%.*}.${f}.proteins.filtered.fna ${k%%.*}_empty.fa >> ${k%%.*}.hits.fa
done
done

#mv $BLASTQUERIES/*.hits.fa $OUTDIR
rm /proj/uppstore2018069/Harshal/Subsetted_Data/*_empty.fa
mv /proj/uppstore2018069/Harshal/Subsetted_Data/*.filtered.fna /proj/uppstore2018069/Harshal/Subsetted_Data/extracts
mv /proj/uppstore2018069/Harshal/Subsetted_Data/*_hits.txt /proj/uppstore2018069/Harshal/Subsetted_Data/hits

