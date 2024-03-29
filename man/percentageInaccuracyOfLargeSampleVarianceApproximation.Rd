% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MadeyskiKitchenhamMetaAnalysis.R
\name{percentageInaccuracyOfLargeSampleVarianceApproximation}
\alias{percentageInaccuracyOfLargeSampleVarianceApproximation}
\title{percentageInaccuracyOfLargeSampleVarianceApproximation}
\usage{
percentageInaccuracyOfLargeSampleVarianceApproximation(data)
}
\arguments{
\item{data}{- data behind the plot returned by getSimulatedCrossoverDataSets() or stored in reproducer::KitchenhamMadeyski.SimulatedCrossoverDataSets}
}
\value{
plot described in description
}
\description{
Plot the extent of inaccuracy using the large sample approximate effect size variance on 4 related graphs corresponding to the four different correlation values. Plot visualizes the relationship between sample size and effect size and the percentage inaccuracy of the large sample variance approximation. Function is used in a paper 'Effect Sizes and their Variance for AB/BA Crossover Design Studies' by Lech Madeyski and Barbara Kitchenham.
}
\examples{
data <- KitchenhamMadeyski.SimulatedCrossoverDataSets
myPlot <- percentageInaccuracyOfLargeSampleVarianceApproximation(data)
}
\author{
Barbara Kitchenham and Lech Madeyski
}
