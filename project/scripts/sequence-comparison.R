# The HWI protein crystallization project
# focus: protein explorations II
# Summer 2014

# Sequence comparison, cocktail effectiveness, and possible alternative proteins.

# Assignment: read about sequence alignment and the BLAST software. Don't worry if you don't understand exactly how
# it works - just get a general sense for what it does, and why.

# BLAST compares sequences much faster than we could do by hand, and provides information about the similarities
# between proteins, and likelihood of protein sequences matching randomly. To find other proteins that might
# successfully crystallize, we want proteins with very similar sequences. We'd also like to find out what 
# cocktail was used to crystallize the protein, so that we can guess what might work on our new proteins.

# It's important to note that this is more of a toy model than anything - our sample size is too small to draw
# any significant conclusions, and we're ignoring other factors that contribute to the crystallization of a protein.

# -----------------------------------------------------------------

# 1. Gather all of the Protein Data Bank IDs for the proteins. (They're under targetdb_status.) Load the
#    Bio3D library and the sequence comparison function. Then use the function on all of the PDB IDs. Using
#    read.pdb, or looking yourself, learn about the proteins that are similar to the ones in the sample. For
#    this excercise, "similar" means greater than 98% similarity.

library(bio3d)

sequence_comparison <- function(input){
  protein_summary <- read.pdb(input);
  fasta_format <- aa321(protein_summary$seqres);
  blast <- blast.pdb(fasta_format, database="pdb");
  output <- blast$hit.tbl;
  output;
  
# This function takes input PDB IDs and returns data tables containing information about the protein. read.pdb
# grabs the information from the database, which is then stored under protein_summary. protein_summary$seqres
# is the protein sequence stored as three-letter amino acid codes. aa321() converts these codes into the one-letter
# FASTA format. Finally, blast.pdb searches for similar sequences. To see all of the information found by the BLAST
# algorithm, just enter blast or summary(blast).
}

# 2. Find a way to plot the information obtained by BLAST. You can either use built-in functions, or write your own.
#    Plot several different characteristics of the proteins - namely length and -ln(E-value), but feel free to 
#    include any other plots that interest you. 

# 3. Find the combinations of proteins and cocktails that managed to successfully crystallize. A successful 
#    crystallization will be marked "1" under human_crystal - unsuccessful combinations are marked "0".

# Analysis: Remark on what you've found. Were the similar proteins just low-complexity matches, or were the 
# matches meaningful? What do your plots tell you about the matches BLAST found? Speculate about combinations of 
# proteins and cocktails that might form crystals, and discuss why that might be important. Try to also consider
# the problems with those conclusions - what are we ignoring that could impact real results?
