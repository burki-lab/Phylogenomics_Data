#!/bin/bash 
#SBATCH -A snic2021-5-302
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 1 
#SBATCH -t 00:20:00 
#SBATCH --mail-user harshal-kunal.bhawe.7340@student.uu.se 
#SBATCH --mail-type=ALL 
#SBATCH -J extract_sequences


#v.2 is made to use several hits files I changed a bit the ending of the blob file

module load bioinfo-tools
module load blobtools/1.1.1 

FASTA=$1 
LIST=$2 
PREFIX=$3 
blobtools seqfilter -i $FASTA -l $LIST -o $PREFIX


#USAGE: blobtools seqfilter -i FASTA -l LIST [-o PREFIX] [-v] [-h|--help]
#Options:
        #-h --help show this -i, --infile <FASTA> FASTA file of sequences (Headers are split at whitespaces) -l, --list <LIST> TXT file containing headers of sequences to keep -o, --out <PREFIX> 
        #Output prefix
        #-v, --invert                Invert filtering (Sequences w/ headers NOT in list)
