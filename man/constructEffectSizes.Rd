% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MetaAnalysisForFamiliesOfExperimentsSR.R
\name{constructEffectSizes}
\alias{constructEffectSizes}
\title{constructEffectSizes}
\usage{
constructEffectSizes(Mc, Mt, SDc, SDt, Nc, Nt)
}
\arguments{
\item{Mc}{is a vector containing the mean value of the control group for each experiment.}

\item{Mt}{is a vector containing the mean value of the treatment group for each experiment.}

\item{SDc}{is a vector of the standard deviations of the control group for each experiment.}

\item{SDt}{is a vector of the standard deviations of the the treatment group for each experiment.}

\item{Nc}{is a vector containing the the number of observations (participants) in the control group for each experiment.}

\item{Nt}{is a vector of the number of observations (participants) in the treatment group for each experiment.}
}
\value{
data frame composed of five effect sizes (Glass delta, Cohen's d, Hedges' g, r, Hedges' g adjusted)
}
\description{
The function constructs various different d-style effect sizes for a set of different experiments given basic statistics from each experiment ( the mean value of the control group Mc, the mean value of the treatment group Mt, the standard deviation of the control group SDc, standard deviation of the the treatment group SDt, the number of observations (participants) in the control group Nc, and the number of observations (participants) in the treatment group Nt). The input variables can be vectors or individual numbers but all input vectors must be of the same length. The function returns Glass's Delta, Cohen's D, point bi-serial r (based on Hedges'g unadjusted), Hedges'g and Hegdes' g adjusted for small sample size.
}
\examples{
constructEffectSizes(10, 15, 0.3, 0.2, 15, 15)

Mt <- c(0.633, 0.673, 0.423, 0.727, 0.631)
Mc <- c(0.612, 0.526, 0.356, 0.618, 0.534)
SDt <- c(0.198, 0.115, 0.172, 0.088, 0.122)
SDc <- c(0.159, 0.089, 0.111, 0.166, 0.119)
Nt <- c(12, 12, 14, 10, 8)
Nc <- c(12, 12, 14, 10, 8)
EffectSizes <- constructEffectSizes(Mc, Mt, SDc, SDt, Nt, Nc)
EffectSizes
# GlassDelta    Cohend   Hedgesg          r HedgesgAdjusted
# 1  0.1320755 0.1221516 0.1169513 0.05837591       0.1129107
# 2  1.6516854 1.4931812 1.4296121 0.58151846       1.3802200
# 3  0.6036036 0.4803405 0.4628677 0.22547423       0.4493641
# 4  0.6566265 0.8648343 0.8204538 0.37953300       0.7857047
# 5  0.8151261 0.8604924 0.8049169 0.37335594       0.7608781
}
\author{
Barbara Kitchenham and Lech Madeyski
}
