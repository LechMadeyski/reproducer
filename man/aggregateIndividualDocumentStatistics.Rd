% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MetaAnalysisForFamiliesOfExperimentsSR.R
\name{aggregateIndividualDocumentStatistics}
\alias{aggregateIndividualDocumentStatistics}
\title{aggregateIndividualDocumentStatistics}
\usage{
aggregateIndividualDocumentStatistics(D1.M, D1.SD, D1.N, D2.M, D2.SD, D2.N)
}
\arguments{
\item{D1.M}{is a vector of mean values from a set of experiments in a family reporting observations from participants using a specific document in the first time period with either the control or the treatment technique.}

\item{D1.SD}{is a vector of results from the set of experiment in a family reporting the standard deviations of observations from participants using the same document in the first time period with the same technique.}

\item{D1.N}{is a vector of the numbers of participants in each experiment in a family, using the same document for participants using either the same technique.}

\item{D2.M}{is a vector of mean values of observations from participants using the alternative document in the second time period, but using the same technique.}

\item{D2.SD}{is a vector of the standard deviations of observations from participants using the alternative document in the second time period with the same technique.}

\item{D2.N}{is a vector of the numbers of participants using the same document in the second time period for participants using the same technique.}
}
\value{
data frame incl. the overall weighted mean and pooled standard deviation
}
\description{
This function assumes an ABBA crossover experiment has reported means and variances for each technique in each time period. We calculate the weighted mean and pooled within group variance for the observations arising from the two different sets of materials for a specific technique.
}
\examples{
aggregateIndividualDocumentStatistics(10, 2, 20, 15, 2, 20)
#     M SD
# 1 12.5  2
}
\author{
Barbara Kitchenham and Lech Madeyski
}
