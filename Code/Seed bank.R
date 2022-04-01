library (readxl)
library (dplyr)
library (ggplot2)
library (lme4)
library (DHARMa)
library (sjPlot)
library (effects)
library (glmmTMB)

dat = read_xlsx ('Data/soil seed bank.xlsx', 1)
str (dat)

dat$Plot = as.factor(dat$Plot)
dat$Species = as.factor(dat$Species)
dat$SBDensity = as.numeric(dat$SBDensity)
dat$Cover = as.numeric(dat$Cover)
dat$Shape = as.numeric(dat$Shape)
dat$Productivity = as.numeric (dat$Productivity)
dat$Dormancy = as.numeric(dat$Dormancy) # could be a factor as well


# Presence-absence data ---------------------------------------------------
m1= glmer (SBPA ~ scale (Altitude) + # environment: less species/lower density in the soil at high elevations
                  scale (Cover)+ # vegetation: species with higher cover are expected to be more present in the soil
                  scale (Productivity) + # plant trait: species with higher productivity should be more present in the soil
                  scale (Weight) + # seed trait: ligher seeds tend to persist better in the soil
                  scale (Endosperm) + # seed trait: 
                  scale (Shape) + # seed trait: round seeds tend to persist better in the soil
                  scale (Dormancy) + # seed trait: dormand seeds tend to persist better in the soil
                  (1|Plot), family = "binomial", data=dat)
summary (m1)

x11()
simres = simulateResiduals(m1, refit=F) 
plot (simres)
testDispersion(simres)

plot (allEffects(m1))
plot_model(m1, show.values = TRUE)
plot_model(m1, transform = "plogis", show.values = TRUE)





# Seed bank density (seedlings/m2) ----------------------------------------

m2 = glmmTMB (SBDensity ~ scale (Altitude) +
             scale (Cover) + 
             scale (Productivity) + 
             scale (Weight) + 
             scale (Endosperm) + 
             scale (Shape) + 
             scale (Dormancy) +
             (1|Plot), family = "poisson",
             ziformula = ~1, data=dat) # this is the best model fit I could get

summary (m2)

simres2 = simulateResiduals(m2, refit=F) 
plot (simres2)

testDispersion(simres2)
testZeroInflation(simres2)

plot (allEffects(m2))