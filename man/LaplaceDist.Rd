% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NPSimulation.R
\name{LaplaceDist}
\alias{LaplaceDist}
\title{LaplaceDist}
\usage{
LaplaceDist(N, mean, spread, max = 0.5, min = -0.5)
}
\arguments{
\item{N}{is the required sample size}

\item{mean}{is the required mean}

\item{spread}{is the spread of the function}

\item{max}{the upper limit of the distribution. Must be finite.}

\item{min}{the lower limit of the distribution. Must be finite.}
}
\value{
N values from a Laplace distribution
}
\description{
Returns a sample of N observations from a Laplace distribution with specified mean and spread.
}
\examples{
set.seed(123)
LaplaceDist(10, 0, 1)
#  [1] -0.55311564  0.85946218 -0.20094937  1.45258293  2.12808209 -2.39565480  0.05785263
#   [8]  1.53636446  0.10855453 -0.09076809

}
\author{
Barbara Kitchenham and Lech Madeyski
}
