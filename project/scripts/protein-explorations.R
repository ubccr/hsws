# The HWI protein crystallization project
# focus: protein explorations
# Summer 2014

# Load the protein "sample" dataframe from the csv files

# Let's explore a few basic characteristics of proteins. We'll use the BLAST algorithm to look for 
# protein sequences similar to some in our dataset, then we'll plot protein molecular weight and sequence 
# length, by p_number (in sample data frame).

# --------- BLAST on proteins -----------

# BLAST is a sequence comparison algorithm that is used to search sequence databases for close matches.
# It can be used to find similar protein sequences, which can allow biologists to make inferences about
# protein function and identity.
# 
# Resources:
# 	BLAST glossary:
# 		http://www.ncbi.nlm.nih.gov/books/NBK62051/
# 
# 	NCBI protein blast web interface:
# 		http://www.ncbi.nlm.nih.gov/BLAST/Blast.cgi
# 		
# 	RCSB protein data bank 
# 		http://www.rcsb.org/pdb/
# 		
# 	R bio3d package	
# 		Documentation: http://thegrantlab.org/bio3d/html/
# 		Useful functions:
# 			blast.pdb() -- perform BLAST sequence database searches
# 			plot.blast() -- plot a Summary of BLAST Hit Statistics. 	
# 			
# 	Jmol tool on hpc2.org	

# ----------------------------

# proteins, short and long
#========================
#
# Identify the shortest and the longest protein sequences in our dataset, referring to the "sample" 
# data frame. How long is each of these sequences? Do you expect to find more or fewer hits in the 
# blast database for one as compared to the other? Why?

# bio3d and BLAST
# ---------------

# Load the R bio3d library.

# Using bio3d on R, run blast on each of these two proteins. Refer to the bio3d documentation for 
# the blast call, and save the results of each call to a variable. Tip: you can use either the "seq" 
# or "targetdb_status" columns to specify the protein.

# Your call will look something like:
# 	long_seq_blast = blast.pdb( long_seq, database="pdb")

# How many BLAST hits do you see for each of these two proteins? Did you expect this result? 

# Plot the BLAST results using the bio3d plot.blast() function, or write your own function if you 
# prefer. 

# If you use the bio3d function, save the results of each call to a variable.

# The call creates four plots that describe the hits returned from the BLAST search. In all four 
# cases, a larger value indicates a better match to the target protein for a given hit.
# 
# 	Length -- the length of the compared target and db sequences. The algorithm may find gaps
#			while seeking matches, so this stated length may differ from the target sequence length.
# 	Identity -- the percent agreement between target and db sequences
# 	Bitscore -- the raw alignment score between target and db sequences
# 	-log(Evalue) -- the -log() of the probability that this alignment score would arise between 
# 				random sequences

# bio3d's plot function clusters the hits from the blast search, with the closest matches in cluster 
# number 1. How many clusters does bio3d identify? How many hits are found in each cluster? Do you 
# agree with bio3d's default thresholds that it placed between clusters? 

# Compare the -log(Evalue) values you see for these two proteins. If there is a difference, is it 
# significant, or not?

# NCBI BLAST
# ----------

# Use the ncbi protein blast web interface to blast these proteins and learn complementary information 
# about them. Specify the protein sequence (seq) for this lookup. Take a look at the E values of 
# similar proteins that are found in the BLAST search, for instance. Remember that all E values will 
# be greater than or equal to zero: the smaller the E value, the better the match; 0 is perfect 
# agreement.

# PDB
# ---

# Use PDB (Protein Data Bank) to look up the identity, origin, and function of each of these two 
# proteins. Learn what organism makes it, what it does, and what its structure looks like. To do 
# this, look in the sample data frame, in the targetdb_status column. Use this value in the PDB 
# (www.rcsb.org/pdb). Based on what you learn, can you explain the number of BLAST hits you saw 
# for each protein?

# Note: As of June 2014, avoid the PDB 3D viewer, as we don't have the right plugin for it.
# However: if you would like to use a 3D viewer for your protein, we have the Jmol tool installed 
# on hpc2.org. Download the desired protein's CIF file from the PDB site to your workstation and 
# start the Jmol tool on hpc2. You can upload the CIF file, open it in Jmol, then interactively 
# change the view of the protein, rotate it in space, and save graphics of it. 

# Can you learn something about the organisms that make these proteins? Does this tell you anything 
# about relative abundance in the blast database? What can you conclude about these proteins? What 
# can't you conclude?

# --------- scatterplot of protein molecular weight vs. sequence length ------------

# The protein's sequence length is the number of amino acids that comprise it.
# The molecular weight is the sum of the masses of all its amino acids.

# Create a scatterplot of experimental_molecular_weight vs. seq_len for the 13 proteins
# in our dataset.
# Make and plot a 'linear model'. Does it look like a linear relationship?
# What do the residuals from this linear fit look like? Plot them.

# Determine the correlation of seq_len and experimental_molecular_weight.
# Why do you think these values are related?
# Reference: 
#   http://tinyurl.com/mpdr2w7


# ---------- derivation of protein's estimated molecular weight ------------------

# As you have seen, there is a relationship between the number of amino acids in a protein
# and its molecular weight (MW). Let's test a rule about this by deriving the molecular weight
# of our 13 proteins, using the sequence length (the number of amino acids).

# Approximate the molecular weights of all the proteins in the dataset, using:
# Approximate Molecular Weight of a Protein
# M.W. of protein = # amino acids x 110 Da

# Now plot the derived MW against the experimental MW, plot a linear fit, 
# and compute the correlation.
# What do the residuals from this linear fit look like? Plot them.

# Do you conclude that this is a reasonable approximation?


# crystallization images
# ----------------------

# load the experiment, sample, and expUrl data frames from the csv files

# View some images of experiments on one of these proteins. Can you identify which ones look 
# crystallized? Here, use the merge() command on experiment and expUrl data frames. Find your 
# protein and look at some image urls.
