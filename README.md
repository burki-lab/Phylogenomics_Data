# Phylogenomics_Data
# Contains scripts for workflow for dataset creation, curation, single gene phylogenies as well as phylogenomics.

## Stage 1 (1_Scripts_Sequence Extraction)
Script 1: 1_Extract_Headers.sh
Greps "Rhizaria" from Max's original dataset and extracts the whole FASTA header containing "Rhizaria" and removes the '>' symbol from the header to accomodate blobtools in the next step. Output is a .txt file.

Script 2: 2_Extract_Sequences.sh
Takes the list created by Script 1 as a parameter and extracts those sequences from the original dataset.
Output format is ....filtered.fna
