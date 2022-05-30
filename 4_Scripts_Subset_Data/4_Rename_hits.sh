### Renames BLAST HITS from ***_hits.fa to ***.hits.fa

for f in /proj/uppstore2018069/Harshal/Subsetted_Data/*.hits.fa; do mv "$f" "${f%%_hits*.hits.fa}.hits.fa"; done

