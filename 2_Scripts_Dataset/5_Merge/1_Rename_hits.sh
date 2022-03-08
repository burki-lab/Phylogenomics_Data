### Renames BLAST HITS from ***_hits.fa to ***.hits.fa

for f in *hits.fa; do mv "$f" "${f%%_*.hits.fa}.hits.fa"; done

