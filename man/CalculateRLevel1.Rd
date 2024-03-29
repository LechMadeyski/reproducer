% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rPaperFunctions.R
\name{CalculateRLevel1}
\alias{CalculateRLevel1}
\title{CalculateRLevel1}
\usage{
CalculateRLevel1(
  Dataset,
  StudyID,
  Groups = c("A", "B", "C", "D"),
  ExperimentName,
  Metrics,
  Type,
  Control
)
}
\arguments{
\item{Dataset}{This holds the data for each participant in a 2-group or 4-group crossover experiment in the 'wide' format. I.e., there is only one entry per participant. The data set should have been generated from a long version of the data based on a variable labelled 'Period' which is used to define which participant data was collected in the first period of the experiment - see function ExtractLevel1ExperimentRData.}

\item{StudyID}{This holds an identifier used to identify the origin of the experimental data in the output from this function.}

\item{Groups}{This is a list that defined the sequence group identifiers used in the dataset.}

\item{ExperimentName}{This an identifiers used to define the specific experiment in the output from this function.}

\item{Metrics}{This is a list of metrics, e.g., ('Correctness','Time','Efficiency').}

\item{Type}{this is a character string specifying whether the experiment is a two sequence group of four sequence group experiment.}

\item{Control}{this is a character string that defines the control treatment in the experiment.}
}
\value{
table this is a tibble holding information identifying for each metric and sequence group the first time period and second time period variance, the pooled variance, the variance of the difference values and the exact r and pooled r.
# importFrom stats
# importFrom var
# importFrom tibble
}
\description{
This function calculates the r value for a 2-group (2G) or 4-Group (4G) Crossover experiment for each sequence group and each outcome metric. The function returns both the exact r value and the r value based on pooled variances for each sequence group and outcome metric
}
\details{
script to obtain correlation coefficients
}
\examples{
ExperimentNames <- c("EUBAS", "R1UCLM", "R2UCLM", "R3UCLM")
ShortExperimentNames <- c("E1", "E2", "E3", "E4")
Metrics <- c("Comprehension", "Modification")
Type <- c("4G", "4G", "4G", "4G")
Groups <- c("A", "B", "C", "D")
StudyID <- "S2"
Control <- "SC"
# Obtain experimental data from a file and put in wide format
dataset2 <- KitchenhamEtAl.CorrelationsAmongParticipants.Scanniello14TOSEM
ReshapedData <- ExtractExperimentData(dataset2,
  ExperimentNames = ExperimentNames,
  idvar = "ParticipantID", timevar = "Period", ConvertToWide = TRUE
)
# Calculate the correlations for each sequence group and each metric.
CalculateRLevel1(
  Dataset = ReshapedData[[1]], StudyID, Groups = c("A", "B", "C", "D"),
  ExperimentName = ShortExperimentNames[1], Metrics, Type = Type[1], Control
)
# A tibble: 8 x 15
# # A tibble: 8 x 15
# Study Exp   Group Metric Id        n ControlFirst    var1   var2
# <chr> <chr> <chr> <chr>  <chr> <int> <lgl>          <dbl>  <dbl>
#   1 S2    E1    A     Compr… S2E1A     6 FALSE        0.0183  0.0163
# 2 S2    E1    B     Compr… S2E1B     6 TRUE         0.0201  0.0326
# 3 S2    E1    C     Compr… S2E1C     6 FALSE        0.00370 0.0155
# 4 S2    E1    D     Compr… S2E1D     6 TRUE         0.0173  0.0201
# 5 S2    E1    A     Modif… S2E1A     6 FALSE        0.0527  0.0383
# 6 S2    E1    B     Modif… S2E1B     6 TRUE         0.0185  0.0482
# 7 S2    E1    C     Modif… S2E1C     6 FALSE        0.00655 0.0244
# 8 S2    E1    D     Modif… S2E1D     6 TRUE         0.0222  0.0266
# # … with 6 more variables: varp <dbl>, ControlVarProp <dbl>,
# #   VarProp <dbl>, vardiff <dbl>, r <dbl>, r.p <dbl>

}
\author{
Barbara Kitchenham and Lech Madeyski
}
