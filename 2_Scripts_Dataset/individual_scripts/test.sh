module load bioinfo-tools
module load blast/2.6.0+


for i in /proj/uppstore2018069/Harshal/2_Blast/*.fa
do
blastx -db $i -query /proj/uppstore2018069/Ioana/Find_Steamer/BLAST_search/Steamer_fasta_Metzger2018.fas   -out $i.out  -num_threads 3 -show_gis  -max_target_seqs 10 -outfmt 6  -evalue 1e-20
done
