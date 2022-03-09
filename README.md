# Phylogenomics_Data
# Contains scripts for workflow for dataset creation, curation, single gene phylogenies as well as phylogenomics.

## Stage 1 (1_Scripts_Sequence_Extraction)
### Script 1: 1_Extract_Headers.sh
Greps "Rhizaria" from all the genes in Max's original dataset and extracts the whole FASTA header containing "Rhizaria" and removes the '>' symbol from the header to accomodate blobtools in the next step. Output is a .txt file for each gene.

### Script 2: 2_Extract_Sequences.sh
Takes the list (.txt file) created by Script 1 as a parameter and extracts those sequences from the original dataset.
Output format is ....filtered.fna for each gene present in the dataset.

## Stage 2 (2_Scripts_Dataset)
### Script 1: 1_Blast_DB.sh
Creates a Blast database for each of the newly annotated Rhizarian genomes (eg: Marteilia pararefringens, Marteilia cochillia etc)\

### Script 2: 2_Blast_hits_curation.sh
1. Uses the .filtered.fna files as a query for Blast against the annotated reference genomes created by Stage 2 Script 1. Blast outfmt 6 with e-value 1e-20. 
2. The 2nd column from the Blast result is cut and stored in a separate .txt file as this contains the sequence ID for the Blast hit on the reference. This list is then sorted and only the unique entries are saved to avoid double results.
3. Similar to Stage 1 Script 3, the blobtools seqfilter option is used again to extract the Blast hits from the reference genomes. This part also adds the name of the reference genome the Blast hit was found in to the header on the FASTA file so it is easy to interpret when the phylogenetic trees have been created.
