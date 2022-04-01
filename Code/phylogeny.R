# phylogeny caclulated following the approach by Penone et al. 2014: 
# I got the script from here

library (readxl)
library (ape) 
library (phytotools)
library (geiger)
library (PVR)

datphyl = read_xlsx ('Data/soil seed bank.xlsx', 2)
str (datphyl)
datphyl = as.data.frame (datphyl)

# uploading phylogeny
phyl = read.tree(file = "Data/DaPhnE_01.tre")

row.names(datphyl) = datphyl[,1] 
obj = name.check(phyl, datphyl)

summary (obj)
obj$data_not_tree 

# drop the species 
phyl.upd = drop.tip(phyl, obj$tree_not_data)
summary (phyl.upd)

# check the names in the tree and in the data set
name.check(phyl.upd, datphyl)
phyl.upd2 = multi2di(phyl.upd)


x11 ()
plot (phyl.upd2)
# phylogenetic vectors
decomp = PVRdecomp(phyl.upd2)

label.decomp = as.data.frame(decomp@phylo$tip.label) #species names
egvec = as.data.frame(decomp@Eigen$vectors) #extract eigenvectors
egval = decomp@Eigen$values #extract eigenvalues
eigPerc = egval/(sum(egval)) #calculate % of variance
eigPercCum = t(cumsum(eigPerc)) #cumulated variance

eglogic = (matrix(rep(eigPercCum<0.95,each=70),nrow=70)) #I took all eigenvecteurs represnting more than 95% variance
egOK = matrix(egvec[eglogic],nrow=290) 

eigenTobind = cbind(label.decomp,egOK) #eigenvectors to merge with trait database
names(eigenTobind)[1] = "Species"

#the imputation part is as easy as:
traitdat = merge (datphyl, eigenTobind, by="Species")
str (traitdat)