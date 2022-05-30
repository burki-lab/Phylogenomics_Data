#!/usr/bin/perl

#Argument : the name of the tree file (nexus format)
# script made by Elena Coulier. Modified by Ioana by adding more taxa
#this script will also consider the lower ranks

use strict;
#help menu (-h or --help)
use vars qw ($help);
use Getopt::Long;
GetOptions("h"=> \$help,);
if (($help)or(!@ARGV)){
    print "Use : ./color_the_tree.pl [FILE]...\n";
    print"From a nexus file, generate an other nexus file in witch the branch have been colored. \n\n";
    exit;
}

my $file = $ARGV[0]; #Recovery of the first argument
my $taxa=0;#false
my $i=0;
# Colors for each groups (NB : amélioration avec un hash)
my $colorAnimals="3366ff";
my $colorCrab="0000ff";
my $colorAlveolates="990033";
my $colorAmoebozoa="ffcc00";
my $colorApusozoa="663300";
my $colorArchaea="669999";
my $colorBacteria="666666";
my $colorCandidate="ff00ff";
my $colorChoanoflagelates="cc99ff";
my $colorFilastarea="cc6666";
my $colorCryptophyta="999900";
my $colorExcavata="6666cc";
my $colorFonticula="cc9933";
my $colorFungi="996633";
my $colorHaptista="666633";
my $colorIchthyosporea="66ccff";
my $colorObazoa="cc9900";
my $colorRhodophyta="ff3300";
my $colorRhizaria="cc6699";
my $colorM6MM="cc6699";
my $colorPcanceri="6600cc";
my $colorParamikrocytos="6600cc";
my $colorMackini="9933cc";
my $colorMikrocytos="9933cc";
my $colorBonamia="9933cc";
my $colorMarteilia="cc66ff";
my $colorParamarteilia="cc66ff";
my $colorStramenopila="009999";
my $colorStreptophyta="339900";
my $colorVirus="333333";
my $colorMalawimonas="99cc99";
my $colorGlaucophytes="006633";
my $colorCentroheliozoa="00cc99";
my $colorAscetosporea="00cc99";
my $colorPalpitomonas="ff9999";
my $colorTelonemida="66cc99";
my $colorMetamonada="ff9966";




open(F,"$file")||die "Impossible opening of the file".$ARGV[0]; #open the file (reading)
open(O,">color_$file.tre")||die "Impossible opening of the file".$ARGV[0];
#reading the file
while(<F>){
	chomp($_);
    if (/^begin taxa/)
    {
        $taxa=1;#true : the taxa block begins
    }

    if (/^end;/)
    {
        $taxa=0;#false : end of the taxa block
    }
    if ($taxa and (/\t.*_.*/)){
        $i=$i+1;
        #Animals
		$_= add_color("Metazoa",$colorAnimals,$_);
		$_= add_color("Annelida",$colorAnimals,$_);
		$_= add_color("Porifera",$colorAnimals,$_);
		$_= add_color("Chordata",$colorAnimals,$_);
		$_= add_color("Arthropoda",$colorAnimals,$_);
		$_= add_color("Mollusca",$colorAnimals,$_);
		$_= add_color("Nematoda",$colorAnimals,$_);
		$_= add_color("Rotifera",$colorAnimals,$_);
		$_= add_color("Cnidaria",$colorAnimals,$_);
		$_= add_color("Echinodermata",$colorAnimals,$_);
		$_= add_color("Tardigrada",$colorAnimals,$_);
		$_= add_color("Platyhelminthes",$colorAnimals,$_);
		$_= add_color("Priapulida",$colorAnimals,$_);
		$_= add_color("Orthonectida",$colorAnimals,$_);
		$_= add_color("Placozoa",$colorAnimals,$_);
		$_= add_color("Hemichordata",$colorAnimals,$_);
		$_= add_color("Brachiopoda",$colorAnimals,$_);
		$_= add_color("Bryozoa",$colorAnimals,$_);
		$_= add_color("Golfingiida",$colorAnimals,$_);
		
		
        

        #Alveolates :
        $_= add_color("Alveolata",$colorAlveolates,$_);
        $_= add_color("Chromerida",$colorAlveolates,$_);
        $_= add_color("Apicomplexa",$colorAlveolates,$_);
        $_= add_color("Oligohymenophorea",$colorAlveolates,$_);
        $_= add_color("Spirotrichea",$colorAlveolates,$_); 
        $_= add_color("Heterotrichea",$colorAlveolates,$_);
        $_= add_color("Symbiodinium",$colorAlveolates,$_);
        $_= add_color("Perkinsus",$colorAlveolates,$_); 
        $_ = add_color("Dinophyceae",$colorAlveolates,$_);
        $_ = add_color("Vitrellaceae",$colorAlveolates,$_);
        $_ = add_color("Chromeraceae",$colorAlveolates,$_);
        $_ = add_color("Ciliophora",$colorAlveolates,$_);
        $_ = add_color("Colponemida",$colorAlveolates,$_);
        
        
        
        #Amoebozoa
        $_ = add_color("Amoebozoa",$colorAmoebozoa,$_);
        $_ = add_color("Acanthamoeba",$colorAmoebozoa,$_);
        $_ = add_color("Planoprotostelium",$colorAmoebozoa,$_);
        $_ = add_color("Cavenderia",$colorAmoebozoa,$_);
        $_ = add_color("Acytostelium",$colorAmoebozoa,$_);
        $_ = add_color("Dictyostelium",$colorAmoebozoa,$_);
        $_ = add_color("Tieghemostelium",$colorAmoebozoa,$_);
        $_ = add_color("Heterostelium",$colorAmoebozoa,$_);
        $_ = add_color("Entamoeba",$colorAmoebozoa,$_);
        $_ = add_color("Evosea",$colorAmoebozoa,$_);
        $_ = add_color("Tsukubamonadida",$colorAmoebozoa,$_);
       
                 
        #Apusozoa
        $_ = add_color("Apusozoa",$colorApusozoa,$_);
        $_ = add_color("Thecamonas",$colorApusozoa,$_);
        $_ = add_color("Apusomonas",$colorApusozoa,$_);
        $_ = add_color("Amastigomonas",$colorApusozoa,$_);
        
        #Archaea
	    $_ = add_color("_Archaea",$colorArchaea,$_);
        #Bacteria
        $_ = add_color("_Bacteria",$colorBacteria,$_);
        $_ = add_color("-Bacteria",$colorBacteria,$_);
        $_ = add_color("uncultured-prokaryote",$colorBacteria,$_);
        $_ = add_color("Kinetoplastibacterium",$colorBacteria,$_);
        $_ = add_color("Proteobacteria",$colorBacteria,$_);
        $_ = add_color("Cyanobacteria",$colorBacteria,$_);
        $_ = add_color("Actinobacteria",$colorBacteria,$_);
        
        
        #Centroheliozoa
        $_ = add_color("Centroheliozoa",$colorCentroheliozoa,$_);
        
        #Choanoflagelates
        $_ = add_color("Choanoflagelates",$colorChoanoflagelates,$_);
        $_ = add_color("Salpingoeca",$colorChoanoflagelates,$_);
        $_ = add_color("Monosiga",$colorChoanoflagelates,$_);
        $_ = add_color ("Choanoflagellata",$colorChoanoflagelates,$_);
        
        #Cryptophyta=Cryptophyceae
        $_ = add_color("Cryptophyceae",$colorCryptophyta,$_);
        
        #Excavata
        $_ = add_color("Excavata",$colorExcavata,$_);
        $_ = add_color("Heterolobosea",$colorExcavata,$_);
        $_ = add_color("Euglenozoa",$colorExcavata,$_);
        $_ = add_color("Strigomonas",$colorExcavata,$_);
        $_ = add_color("Phytomonas",$colorExcavata,$_);
        $_ = add_color("Tritrichomonas",$colorExcavata,$_);
        $_ = add_color("Trichomonas",$colorExcavata,$_);
        $_ = add_color("Parabasalia",$colorExcavata,$_);
        $_ = add_color("Stygiella",$colorExcavata,$_);
        $_ = add_color("Jakobida",$colorExcavata,$_);
        $_ = add_color("Giardia",$colorExcavata,$_);
        $_ = add_color("Spironucleus",$colorExcavata,$_);
        $_ = add_color("Fornicata",$colorExcavata,$_);
        $_ = add_color("Angomonas",$colorExcavata,$_);
        $_ = add_color("Herpetomonas",$colorExcavata,$_);
        $_ = add_color("Leptomonas",$colorExcavata,$_);
        $_ = add_color("Leishmania",$colorExcavata,$_);
        $_ = add_color("Trypanosoma",$colorExcavata,$_);
        $_ = add_color("Crithidia",$colorExcavata,$_);
        $_ = add_color("Perkinsela",$colorExcavata,$_);
        $_ = add_color("Bodo",$colorExcavata,$_);
        $_ = add_color("Preaxostyla",$colorExcavata,$_);
        $_ = add_color("Oxymonadida",$colorExcavata,$_);
        
        #Fonticula
        $_ = add_color("Fonticula",$colorFonticula,$_);
        
        #Filastarea
        $_ = add_color("Filastarea",$colorFilastarea,$_);
        $_ = add_color("Capsaspora",$colorFilastarea,$_);
        
        #Glaucophyta
        $_ = add_color("Glaucocystophyceae",$colorGlaucophytes,$_);
        
        #Haptista
        $_ = add_color("Haptista",$colorHaptista,$_);
         $_ = add_color("Haptophyta",$colorHaptista,$_);
        #Fungi
        $_ = add_color("Fungi",$colorFungi,$_);
        $_ = add_color("Ascomycota",$colorFungi,$_);
        $_ = add_color("Basidiomycota",$colorFungi,$_);
        $_ = add_color("Zoopagomycota",$colorFungi,$_);
        $_ = add_color("Mucoromycota",$colorFungi,$_);
        $_ = add_color("Chytridiomycota",$colorFungi,$_);
        $_ = add_color("Blastocladiomycota",$colorFungi,$_);
        $_ = add_color("Microsporidia",$colorFungi,$_);
        $_ = add_color("Cryptomycota",$colorFungi,$_);
        $_ = add_color("fungal",$colorFungi,$_);
        
        #Ichthyosporea
        $_ = add_color("Ichthyosporea",$colorIchthyosporea,$_);
        $_ = add_color("Sphaeroforma",$colorIchthyosporea,$_);
        
        #Malawimonas jakobiformis
        $_= add_color("Malawimonas",$colorMalawimonas,$_);
        
        #Metamonada
        $_= add_color("Metamonada",$colorMetamonada,$_);
        
        #Obazoa
        $_ = add_color("Obazoa",$colorObazoa,$_);
        
        #Palpitomonas
         $_ = add_color("Palpitomonas",$colorPalpitomonas,$_);
         
        #Rhodophyta
        $_ = add_color("Rhodophyta",$colorRhodophyta,$_);
        
		#Rhizaria
        $_ = add_color("Endomyxa",$colorRhizaria,$_);
        $_ = add_color("Foraminifera",$colorRhizaria,$_);
        $_ = add_color("Cercozoa",$colorRhizaria,$_);
        $_ = add_color("Thaumatomonadida",$colorRhizaria,$_);
        $_ = add_color("Polycystinea",$colorRhizaria,$_);
		$_ = add_color("Imbricatea",$colorRhizaria,$_);
        
        
        
        #Stramenopila
        $_ = add_color("Stramenopila",$colorStramenopila,$_);
        $_ = add_color("Oomycota",$colorStramenopila,$_);
        $_ = add_color("Blastocystis",$colorStramenopila,$_);
        $_ = add_color("Blastocystidae",$colorStramenopila,$_);
        $_ = add_color("Bacillariophyceae",$colorStramenopila,$_);
        $_ = add_color("Pelagophyceae",$colorStramenopila,$_);
        $_ = add_color("Phaeophyceae",$colorStramenopila,$_);
        $_ = add_color("Eustigmatophyceae",$colorStramenopila,$_);
        $_ = add_color("Thalassiosira",$colorStramenopila,$_);
        $_ = add_color("Hondaea",$colorStramenopila,$_);
        $_ = add_color("Xanthophyceae",$colorStramenopila,$_);
        $_ = add_color("Bigyra",$colorStramenopila,$_);
        $_ = add_color("Bacillariophyta",$colorStramenopila,$_);
        $_ = add_color("Chrysoparadoxa",$colorStramenopila,$_);
        $_ = add_color("Chrysophyceae",$colorStramenopila,$_);
        $_ = add_color("Synurophyceae",$colorStramenopila,$_);
        $_ = add_color("Raphidophyceae",$colorStramenopila,$_);
          
        
        
        #Streptophyta
        $_ = add_color("Streptophyta",$colorStreptophyta,$_);
        $_ = add_color("Chlorophyta",$colorStreptophyta,$_);
       
        #Telonemida
        $_ = add_color("Telonemida",$colorTelonemida,$_);
       
        #Virus
        $_ = add_color("Virus",$colorVirus,$_);
        $_ = add_color("virus",$colorVirus,$_);
        
        
        #Crab
		$_= add_color("Crab",$colorCrab,$_);
		
		#Pcanceri
		$_= add_color("Paramikrocytos",$colorPcanceri,$_);
		#Mackini
		$_= add_color("Mikrocytos",$colorMackini,$_);
		#Marteilia
		$_= add_color("Marteilia",$colorMarteilia,$_);
		$_= add_color("Marteilia",$colorParamarteilia,$_);
		$_= add_color("Marteilia",$colorBonamia,$_);
		$_= add_color("Marteilia",$colorMikrocytos,$_);
		$_= add_color("Marteilia",$colorParamikrocytos,$_);
     		$_= add_color("Marteilia",$colorM6MM,$_);   
        
        }
    print O $_."\n";
}
print "Number of taxa : ".$i."\n";
close(F);
close(O);

sub add_color {
	my $name = @_[0];
	my $color = @_[1];
	my $line = @_[2];
	#Rechercher si la couleur n'est pas déjà définie sur la ligne
	if ((/\[&!color=#[a-z0-9]{6}\]$/) and (/.*$name.*/))
    {
	#Si tu trouves [&!color=] à la fin de la ligne et le nom de l'organisme cherché, alors tu remplaces le code couleur par celui désiré

            $line =~s/\[&!color=#[a-z0-9]{6}\]$/\[&!color=#$color\]/g;
	}
    else 
    #Sinon tu ajoutes l'information sur la couleur du taxon
    {
        $line =~s/.*$name.*$/$line\[&!color=#$color\]/g;
    }
	return $line;
}
