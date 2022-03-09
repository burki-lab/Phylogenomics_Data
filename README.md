# Phylogenomics_Data
# Contains scripts for workflow for dataset creation, curation, single gene phylogenies as well as phylogenomics.

## Stage 1 (1_Scripts_Sequence_Extraction)
### Script 1: 1_Extract_Headers.sh
Greps "Rhizaria" from all the genes in Max's original dataset and extracts the whole FASTA header containing "Rhizaria" and removes the '>' symbol from the header to accomodate blobtools in the next step. Output is an *XYZ*.txt file with each gene name as the prefix before the extension.

### Script 2: 2_Extract_Sequences.sh
Takes the list (.txt file) created by Script 1 as a parameter and extracts those sequences from the original dataset using blobtools and the seqfilter module.
Output format is *XYZ*.filtered.fna for each gene present in the dataset (*XYZ* is the gene name).

## Stage 2 (2_Scripts_Dataset)
### Script 1: 1_Blast_DB.sh
Creates a Blast database for each of the newly annotated Rhizarian genomes (eg: Marteilia pararefringens, Marteilia cochillia etc)

### Script 2: 2_Blast_hits_curation.sh
1. Uses the .filtered.fna files as a query for Blast against the annotated reference genomes created by Stage 2 Script 1. Blast outfmt 6 with e-value 1e-20. 
2. The 2nd column from the Blast result is cut and stored in a separate *XYZ*.txt file as this contains the sequence ID for the Blast hit on the reference. This list is then sorted and only the unique entries are saved to avoid copies.
3. Similar to Stage 1 Script 2, the blobtools seqfilter module is used again to extract the Blast hits from the reference genomes. This part also adds the name of the reference genome the Blast hit was found in to the header on the FASTA file so it is easy to interpret when the phylogenetic trees have been created.

### Script 3: 3_Paralogs folder (1_Extract_Headers.sh  2_Extract_Sequences.sh  3_Merge.sh  4_Untagged_paralogs.sh  Rename.sh)
1. 1_Extract_Headers.sh - As with Stage 1 Script 1, it greps "Paralog" in a case insensitive manner using the '-i' option with grep. Creates an *XYZ*.txt file for each gene and has the Fasta headers for 'Paralogs' without the '>' symbol.
2. 2_Extract_Sequences.sh - Uses blobtools seqfilter and the above created .txt files to extract sequences from the Paralog dataset. Creates a *XYZ*.filtered.fna file for each gene.
3. 3_Merge.sh - This script merges the untagged and tagged paralogs created by 2_Extract_Sequences.sh, 2_Extract_Sequences.sh and Rename.sh
4. 4_Untagged_paralogs.sh - This find the untagged paralogs from the dataset using a regex pattern with "(underscore)_word_-(dash)" where the word depends on the gene name.
5. Rename.sh - This script is essential after sequence extraction and before merging. It renames the .filtered.fna files to either .paralogs.fa or .fa so that the output can be merged together with 3_Merge.sh

### Script 4: 4_Prokaryotes folder (1_Extract_Headers.sh  2_Extract_Sequences.sh  Rename.sh)
1. 1_Extract_Headers.sh - greps "Prokaryota" with the '-i' option and creates an *XYZ*.txt file with a list of all found entries with the Fasta sequence header and without the '>' symbol.
2. 2_Extract_Sequences.sh - takes the .txt files created with the Prokaryotes and extracts the sequences from the dataset. Creates an *XYZ*.filtered.fna file for each gene.
3. Rename.sh - Renames the *XYZ*.filtered.fna files to *XYZ*.prokaryotes.fa with the gene name as the prefix.

### Script 5: 5_Merge folder (1_Rename_hits.sh  2_Merge.sh)
1. 1_Rename_hits.sh - Renames Blast hits from Script 2 from *XYZ*_hits.sh to *XYZ*.hits.fa
2. 2_Merge.sh - Merges all Prokaryote, Paralog and Blast hits into 1 file for each gene (called *XYZ*.merged.fa)
