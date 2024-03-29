% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MadeyskiKitchenhamMetaAnalysis.R
\name{plotOutcomesForIndividualsInEachSequenceGroup}
\alias{plotOutcomesForIndividualsInEachSequenceGroup}
\title{plotOutcomesForIndividualsInEachSequenceGroup}
\usage{
plotOutcomesForIndividualsInEachSequenceGroup(
  var,
  covar,
  meanA1,
  treatmentDiff,
  periodEffect,
  numOfSamples
)
}
\arguments{
\item{var}{Variance among subjects is a sum of the between subjects variance and the within subjects variance}

\item{covar}{Covariance equal to the between subjects variance}

\item{meanA1}{Mean for treatment sequence A1}

\item{treatmentDiff}{technique effect which is the difference between the effect of technique A and technique B}

\item{periodEffect}{Period effect which is the difference between period 1 and period 2}

\item{numOfSamples}{Number of samples ('rows' of data) required for each technique and period}
}
\value{
plot
}
\description{
Function to plot a figure on the outcomes for individuals in each sequence group used in a paper 'Effect Sizes and their Variance for AB/BA Crossover Design Studies' by Lech Madeyski and Barbara Kitchenham
}
\examples{
myPlot <- plotOutcomesForIndividualsInEachSequenceGroup(25, 18.75, 50, 10, 5, 15)
}
\author{
Lech Madeyski and Barbara Kitchenham
}
