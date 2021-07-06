library (readxl)
library (dplyr)
library (ggplot2)
library (corrplot)
library (factoextra)
library (Hmisc)

dat = as.data.frame (read_xlsx ('Seed bank_gradient.xlsx', 1))
str (dat)

dat$SoilDepth = as.numeric(dat$SoilDepth)
dat$SoilN = as.numeric(dat$SoilN)
dat$SoilP = as.numeric(dat$SoilP)
dat$SoilK = as.numeric(dat$SoilK)

rownames(dat) = dat$Plot
dat2 = dat[2:13]
#dat3 = dat2[-c(16),]

# correlations among the env. factors
corenvm = cor(dat2, use="na.or.complete")
res1 = cor.mtest(dat2, conf.level = .95)

x11 ()
corrplot.mixed (corenvm, p.mat = res1$p, 
                sig.level = .05, insig = "blank",
                lower = "number", upper = "circle", diag = "n", 
                tl.pos = "lt", 
                tl.srt=45,
                number.cex = 1.0, 
                is.corr=F)


# PCA 
#trenv = as.data.frame (t (dat2))
#trenv2 = trenv [,-c(16)]

#PCA
#res.pca <- prcomp(dat3, scale = TRUE)

#x11 ()
fviz_eig(res.pca)
fviz_pca_ind(res.pca)
fviz_pca_var(res.pca)

fviz_pca_biplot(res.pca, repel = TRUE)