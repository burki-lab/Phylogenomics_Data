# Phylogenomics_Data
# Contains scripts for workflow for dataset creation, curation, single gene phylogenies as well as phylogenomics.

## 1_Scripts_Sequence_Extraction
### 1_Extract_Headers.sh
Greps "Rhizaria" from all the genes in Max's original dataset and extracts the whole FASTA header containing "Rhizaria" and removes the '>' symbol from the header to accomodate blobtools in the next step. Output is an *XYZ*.txt file with each gene name as the prefix before the extension.

### 2_Extract_Sequences.sh
Takes the list (.txt file) created by 1_Extract_Headers as a parameter and extracts those sequences from the original dataset using blobtools and the seqfilter module.
Output format is *XYZ*.filtered.fna for each gene present in the dataset (*XYZ* is the gene name).

## 2_Scripts_Dataset
### 1_Blast_DB.sh
Creates a Blast database for each of the newly annotated Rhizarian genomes (eg: Marteilia pararefringens, Marteilia cochillia etc)

### 2_Blast_hits_curation.sh
1. Uses the .filtered.fna files as a query for Blast against the annotated reference genomes created by 1_Blast_DB. Blast outfmt 6 with e-value 1e-20. 
2. The 2nd column from the Blast result is cut and stored in a separate *XYZ*.txt file as this contains the sequence ID for the Blast hit on the reference. This list is then sorted and only the unique entries are saved to avoid copies.
3. Similar to 2_Extract_Sequences, the blobtools seqfilter module is used again to extract the Blast hits from the reference genomes. This part also adds the name of the reference genome the Blast hit was found in to the header on the FASTA file so it is easy to interpret when the phylogenetic trees have been created.

### 3_Paralogs folder (1_Extract_Headers.sh  2_Extract_Sequences.sh  3_Merge.sh Rename.sh)
1. 1_Extract_Headers.sh - Finds the untagged and tagged paralogs and saves these to a .txt file
2. 2_Extract_Sequences.sh - Uses blobtools seqfilter and the above created .txt files to extract sequences from the Paralog dataset. Creates a *XYZ*.filtered.fna file for each gene.
3. Rename.sh - This script is essential after sequence extraction and before merging. It renames the .filtered.fna files to either .paralogs.fa or .fa so that the output can be merged together with 3_Merge.sh
4. 3_Merge.sh - This script merges the untagged and tagged paralogs created by 2_Extract_Sequences.sh and Rename.sh

### 4_Prokaryotes folder (1_Extract_Headers.sh  2_Extract_Sequences.sh  Rename.sh)
1. 1_Extract_Headers.sh - greps "Prokaryota" with the '-i' option and creates an *XYZ*.txt file with a list of all found entries with the Fasta sequence header and without the '>' symbol.
2. 2_Extract_Sequences.sh - takes the .txt files created with the Prokaryotes and extracts the sequences from the dataset. Creates an *XYZ*.filtered.fna file for each gene.
3. Rename.sh - Renames the *XYZ*.filtered.fna files to *XYZ*.prokaryotes.fa with the gene name as the prefix.

### 5_Merge folder (1_Rename_hits.sh  2_Merge.sh)
1. 1_Rename_hits.sh - Renames Blast hits from Script 2 from *XYZ*_hits.hits.fa to *XYZ*.hits.fa
2. 2_Merge.sh - Merges all Prokaryote, Paralog and Blast hits into 1 file for each gene (called *XYZ*.merged.fa)

## 3_Scripts_Trees
1. 1_Remove_duplicates.sh: Removes duplicates created during merging of the files and stores the duplicates to .txt files based on the gene name
2. 2_Batch_Tree.sh: Batch executes the tree-making script over all the FASTA files in a directory
3. 3_Trees.sh: Creates trees with specified options, used by 2_Batch_Tree to batch execute multiple trees at a time
4. color_treesMRO.Para.pl: Perl script to colour taxa in Nexus Trees. !!!Tree-making is in Newick format, convert using FigTree to Nexus!!!
5. script.pl: Loops over .treefile in a directory and colours all the trees by calling color_treesMRO.Para.pl

## 4_Scripts_Subset_Data
1. 1_Blast.sh: Blasts query sequences to created Blast databases and saves results to .txt files per gene
2. 2_Process.sh: Filters Blast results using bitscore and match length
3. 3_Extract.sh: Extracts filtered blast hit sequences with blobtools
4. 4_Rename_hits.sh: Renames Blast hits to .hits.fa
5. 5_Merge.sh: Merges paralogs, prokaryotes, Blast hits and original dataset
6. 6_Remove_duplicates.sh: Removed duplicates from the merged files
7. 7_Align.sh: Aligns the merged final files with MAFFT
8. 8_Batch_Tree.sh: Batch script to execute tree-making for all aligned files
9. 9_Trees.sh: Tree-making with IQTree
