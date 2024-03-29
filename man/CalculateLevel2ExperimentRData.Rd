% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rPaperFunctions.R
\name{CalculateLevel2ExperimentRData}
\alias{CalculateLevel2ExperimentRData}
\title{CalculateLevel2ExperimentRData}
\usage{
CalculateLevel2ExperimentRData(
  Level1Data,
  Groups,
  StudyID,
  ExperimentNames,
  Metrics,
  Type
)
}
\arguments{
\item{Level1Data}{a tibble in the format produced by the ConstructLevel1ExperimentRData function which has r-values for each sequence group in a crossover experiment}

\item{Groups}{This is a list that defines the sequence group labels used in the dataset.}

\item{StudyID}{This holds an identifier used to identify the origin of the experimental data in the output from this function.}

\item{ExperimentNames}{This a list of identifiers used to define each experiment in the output from this function.}

\item{Metrics}{This is a list of of character strings identifying each outcome metric reported in each of the experiments in the set of replicated experiments.}

\item{Type}{this is a list of character strings specifying for each experiment whether the experiment is a two sequence group '2G' or four sequence group '4G' experiment.
return RExp.Table This is a table containing the pooled data variance and the pooled difference variance for the experiment and the value r for the experiment for each metric}
}
\description{
This function analyses data on r values obtained in the format obtained from  the ConstructLevel1ExperimentRData function and finds the r-value for each metric for each experiment.
}
\examples{
ShortExperimentNames <- c("E1", "E2", "E3", "E4")
FullExperimentNames <- c("EUBAS", "R1UCLM", "R2UCLM", "R3UCLM")
Metrics <- c("Comprehension", "Modification")
Groups <- c("A", "B", "C", "D")
Type <- c(rep("4G", 4))
StudyID <- "S2"
Control <- "SC"
# Obtain experimental data from each file and put in wide format
ReshapedData <- ExtractExperimentData(
  KitchenhamEtAl.CorrelationsAmongParticipants.Scanniello14TOSEM,
  ExperimentNames = FullExperimentNames, idvar = "ParticipantID",
  timevar = "Period", ConvertToWide = TRUE
)
Lev1Data <- ConstructLevel1ExperimentRData(
  ReshapedData, StudyID, ShortExperimentNames, Groups,
  Metrics, Type, Control
)
CalculateLevel2ExperimentRData(Lev1Data,
  Groups = Groups, StudyID = StudyID,
  ExperimentNames = ShortExperimentNames, Metrics = Metrics, Type = Type
)
# A tibble: 8 x 10
#  StudyID ExpID     N Metric        PooledVar1 PooledVar2 VarProp PooledVar PooledDiffVar    r.Exp
#  <chr>   <chr> <int> <chr>              <dbl>      <dbl>   <dbl>     <dbl>         <dbl>    <dbl>
# 1 S2      S2E1     24 Comprehension     0.0148     0.0212   0.412    0.0180        0.0248  0.311
# 3 S2      S2E2     22 Comprehension     0.0487     0.0224   0.684    0.0356        0.0534  0.250
# 4 S2      S2E2     22 Modification      0.0445     0.0266   0.626    0.0356        0.0628  0.117
# 5 S2      S2E3     22 Comprehension     0.0353     0.0402   0.467    0.0377        0.105  -0.391
# 6 S2      S2E3     22 Modification      0.0433     0.0414   0.511    0.0424        0.0997 -0.176
# 7 S2      S2E4     18 Comprehension     0.0439     0.0237   0.649    0.0338        0.0355  0.475
# 8 S2      S2E4     18 Modification      0.0322     0.0592   0.353    0.0457        0.0894  0.0222

}
\author{
Barbara Kitchenham and Lech Madeyski
}
