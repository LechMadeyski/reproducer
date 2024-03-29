% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NPSimulation.R
\name{RandomExperimentSimulations}
\alias{RandomExperimentSimulations}
\title{RandomExperimentSimulations}
\usage{
RandomExperimentSimulations(
  mean,
  sd,
  diff,
  N,
  reps,
  type = "n",
  seed = 123,
  StdAdj = 0,
  alpha = 0.05,
  returnData = FALSE,
  AlwaysTwoSidedTests = FALSE
)
}
\arguments{
\item{mean}{The default mean used for both groups (one treatment group and one control group). It can be changed for the treatment group using  the parameter diff}

\item{sd}{This is the default spread for both groups. It must be a real value greater than 0. It can be adjusted for the treatment group using the parameter StdAdj}

\item{diff}{This is added to the treatment group mean. It can be a real value avd can take the value zero.}

\item{N}{this is the number of observations in each group. It must be an integer greater than 3.}

\item{reps}{this identifies the number of times each experiment simulation is replicated.}

\item{type}{this specifies the underlying distribution used to generate the data. It takes the values 'n' for a normal distribution, 'l' for lognormal distribution,'g' for a gamma distribution, 'lap' for a Laplace distribution.}

\item{seed}{This specifies the initial seed for the set of replications
(default 123).}

\item{StdAdj}{this specifies the extent of variance instability introduced by the treatment and it must be non-negative but can be 0.}

\item{alpha}{This specifies the level of significance used for statistical
tests (default 0.05).}

\item{returnData}{If TRUE, the function returns the individual effect sizes and their variances, otherwise it returns summary statistics (default FALSE).}

\item{AlwaysTwoSidedTests}{If set to FALSE (default) the algorithms uses one-sided tests if diff!=0 and two-sided tests if diff=0. If set to TRUE the algorithm always uses two-sided tests.}
}
\description{
This function performs multiple simulations of two-group balanced experiments for one of four distributions and a specific group size. It identifies the average value of phat, Cliff' d and their variances. It either returns the effect sizes for each non-parametric effect size or it reports the number of times the each non-parametric effect size is assessed to be significantly different from zero. We also present the values for the t-test as a comparison. For log-normal data the results of analysing the transformed data are also reported.
}
\examples{
as.data.frame(
  RandomExperimentSimulations(
    mean = 0, sd = 1, diff = 0.5, N = 20, reps = 50, type = "n",
    seed = 123, StdAdj = 0, alpha = 0.05))
#        phat     phatvar sigphat emp.phat.var       d       dvar sigd
# 1  0.636675 0.007980072    0.38  0.006413391 0.27335 0.03257962 0.36
#    emp.d.var   tpower        ES Variance     StdES   MedDiff
#1  0.02565356     0.41 0.4849609 0.988889 0.4982554 0.4666802
#as.data.frame(
 # RandomExperimentSimulations(
 #   mean = 0, sd = 1, diff = 0.5, N = 20, reps = 500, type = "n",
 #   seed = 123, StdAdj = 0, alpha = 0.05))
#     phat     phatvar sigphat emp.phat.var      d       dvar  sigd  emp.d.var
# 1 0.63915 0.007925803   0.444  0.007904962 0.2783 0.03235111 0.414 0.03161985
#     tpower        ES Variance
# 1     0.444 0.4999034 1.002012
# 1      StdES   MedDiff
# 1 0.5099792 0.4901394

#as.data.frame(
#   RandomExperimentSimulations(
#     mean = 0, sd = 1, diff = 0.2, N = 20, reps = 500, type = "n",
#     seed = 123, StdAdj = 0, alpha = 0.05, AlwaysTwoSidedTests = TRUE))
#     phat     phatvar sigphat emp.phat.var       d       dvar  sigd emp.d.var
# 1 0.55762 0.008596555   0.092  0.008457325 0.11524 0.03505528 0.076 0.0338293
#     tpower        ES Variance     StdES   MedDiff
# 1       0.1 0.1999034 1.002012 0.2043908 0.1901394

#as.data.frame(
#   RandomExperimentSimulations(
#     mean = 0, sd = 1, diff = 0.2, N = 20, reps = 500, type = "n",
#     seed = 123, StdAdj = 0, alpha = 0.05, AlwaysTwoSidedTests = FALSE))
#     phat     phatvar sigphat emp.phat.var       d       dvar  sigd emp.d.var
# 1 0.55762 0.008596555   0.154  0.008457325 0.11524 0.03505528 0.146 0.0338293
#        tpower        ES Variance
# 1         0.16 0.1999034 1.002012
#      StdES   MedDiff
# 1 0.2043908 0.1901394

RandomExperimentSimulations(
  mean = 0, sd = 1, diff = 0.5, N = 20, reps = 10, type = "l", seed = 456,
  StdAdj = 0, alpha = 0.05, returnData = TRUE, AlwaysTwoSidedTests = FALSE)
# A tibble: 10 x 6
#   Cliffd CliffdSig  PHat PHatSig  StdES ESSig
#    <dbl>     <dbl> <dbl>   <dbl>  <dbl> <dbl>
# 1 -0.185         0 0.407       0 -0.246     0
# 2 -0.08          0 0.46        0  0.185     0
# 3  0.1           0 0.55        0  0.149     0
# 4  0.42          1 0.71        1  0.885     1
# 5  0.51          1 0.755       1  0.827     1
# 6  0.185         0 0.592       0  0.628     1
# 7  0.465         1 0.732       1  0.818     1
# 8  0.42          1 0.71        1  0.341     0
# 9  0.37          1 0.685       1  0.419     0
# 10  0.115         0 0.557       0  0.273     0

}
\author{
Barbara Kitchenham and Lech Madeyski
}
