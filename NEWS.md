# CHANGES IN reproducer VERSION 0.1.3

## NEW FEATURES
- added general functions
    - `printXTable`
    - `cloudOfWords`
- added functions to reproduce all of the tables, figures and outputs in the paper (Lech Madeyski, Barbara Kitchenham (2015). How variations in experimental designs impact the construction of comparable effect sizes for meta-analysis (under review)):
    - `reproduceForestPlotRandomEffects`
    - `reproduceMixedEffectsAnalysisWithEstimatedVarianceAndExperimentalDesignModerator`
    - `reproduceMixedEffectsAnalysisWithExperimentalDesignModerator`
    - `reproduceMixedEffectsForestPlotWithExperimentalDesignModerator`
    - `reproduceTableWithEffectSizesBasedOnMeanDifferences`
    - `reproduceTableWithPossibleModeratingFactors`
    - `reproduceTableWithSourceDataByCiolkowski`

## BUG FIXES
- corrected `Madeyski15EISEJ.StudProjects$STUD` data set

# CHANGES IN reproducer VERSION 0.1.2

## NEW FEATURES
- The first published version of reproducer. It includes data sets: 
    - `Madeyski15SQJ.NDC`
    - `Madeyski15EISEJ.OpenProjects`
    - `Madeyski15EISEJ.PropProjects`
    - `Madeyski15EISEJ.StudProjects`
and functions (for importing data, visualization and descriptive analyses):
    - `readExcelSheet`
    - `densityCurveOnHistogram`
    - `boxplotHV`
    - `boxplotAndDensityCurveOnHistogram`

See the package homepage (http://madeyski.e-informatyka.pl/reproducible-research/) for documentation and examples.
