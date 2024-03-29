% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MetaAnalysisForFamiliesOfExperimentsSR.R,
%   R/NPSimulation.R
\name{calculateSmallSampleSizeAdjustment}
\alias{calculateSmallSampleSizeAdjustment}
\title{calculateSmallSampleSizeAdjustment}
\usage{
calculateSmallSampleSizeAdjustment(df, exact = TRUE)

calculateSmallSampleSizeAdjustment(df, exact = TRUE)
}
\arguments{
\item{df}{A vector of degrees of freedom}

\item{exact}{Default value=TRUE, if exact==TRUE the function returns the exact value of the adjustment(s) which is suitable for small values of df, if exact==FALSE the function returns the approximate version of the adjustment(s). See Hedges and Olkin 'Statistical methods for Meta-Analysis' Academic Press 1985.}
}
\value{
small sample size adjustment value

small sample size adjustment value
}
\description{
Function calculates the Hedges small sample size adjustment for standardized mean effect sizes. It calculates the exact value unless the caller sets the parameter exact to FALSE, or the degrees of freedom is too large.

Function calculates the small sample size adjustment for standardized mean effect sizes
}
\examples{
df <- 2
c <- calculateSmallSampleSizeAdjustment(df)

df <- c(5, 10, 17)
adjexact <- calculateSmallSampleSizeAdjustment(df)
# adjexact=0.8407487 0.9227456 0.9551115
# Hedges and Olkin values 0.8408, 0.9228,0.9551
adjapprox <- calculateSmallSampleSizeAdjustment(df, FALSE)
# adjapprox=0.8421053 0.9230769 0.9552239
df <- 2
a <- calculateSmallSampleSizeAdjustment(df)
# > a
# [1] 0.5641896

df <- c(5, 10, 17)
adjexact <- calculateSmallSampleSizeAdjustment(df)
# > adjexact
# [1] 0.8407487 0.9227456 0.9551115
# Hedges and Olkin values 0.8408, 0.9228,0.9551
adjapprox <- calculateSmallSampleSizeAdjustment(df, FALSE)
# > adjapprox
# [1] 0.8421053 0.9230769 0.9552239
# Another example:
df <- c(10, 25, 50)
calculateSmallSampleSizeAdjustment(df, exact = TRUE)
# [1] 0.9227456 0.9696456 0.9849119
calculateSmallSampleSizeAdjustment(df, exact = FALSE)
# [1] 0.9230769 0.9696970 0.9849246
}
\author{
Barbara Kitchenham and Lech Madeyski
}
