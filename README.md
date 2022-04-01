
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Rosbakh, Pichler, and Poschlod, Machine learning algorithms predict soil seed bank persistence from easily available traits

This repository contains the code to reproduce the results in Rosbakh et
al., Machine learning algorithms predict soil seed bank persistence from
easily available traits.

## Data

## Methods

Data preparation, the ML pipeline for SSB density and PA can be found in
the [‘1_ML Analysis.Rmd’]('1_ML%20Analysis.Rmd) script. The
[‘2_Figures.Rmd’]('2_Figures.Rmd) script can be used to create the
figures.

## Results

### Figure 1

<embed src="Figures/Fig_1.pdf" title="Performance of the random forest machine learning model (A) and the conventional regression model (B) in predicting presence-absence and density of seed banks. Both models were fitted on three sets of predictors (environment: temperature, nitrogen, moisture, grazing; seed traits: production, mass, endosperm, shape, and dormancy; phylogeny: phylogenetic axes which explain 60% of the variation). The intersections show the performance of the different combinations of predictors. Predictions for presence/absence of SSB (left column) were evaluated by AUC and predictions for SSB density (right column) were evaluated by R2. Models were evaluated by blocked nine-folded cross-validation (observations were from 18 different plots; in each validation step 16 plots were used for training and two plots for validation)." alt="Performance of the random forest machine learning model (A) and the conventional regression model (B) in predicting presence-absence and density of seed banks. Both models were fitted on three sets of predictors (environment: temperature, nitrogen, moisture, grazing; seed traits: production, mass, endosperm, shape, and dormancy; phylogeny: phylogenetic axes which explain 60% of the variation). The intersections show the performance of the different combinations of predictors. Predictions for presence/absence of SSB (left column) were evaluated by AUC and predictions for SSB density (right column) were evaluated by R2. Models were evaluated by blocked nine-folded cross-validation (observations were from 18 different plots; in each validation step 16 plots were used for training and two plots for validation)." width="0.3\linewidth" style="display: block; margin: auto;" type="application/pdf" />
