#!/usr/bin/perl -w

# a perl file example

opendir(DIR, ".");
@files = grep(/\.treefile$/,readdir(DIR));
closedir(DIR);

foreach $file (@files) {
  # put your perl code here
  `/proj/uppstore2018069/Harshal/3_Trees/coloured_trees/colortrees.pl $file`  
  #print "$file\n";
}
