% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{KitchenhamMadeyskiBrereton.DocData}
\alias{KitchenhamMadeyskiBrereton.DocData}
\title{KitchenhamMadeyskiBrereton.DocData data}
\format{
A text file with variables:
\describe{
\item{Study}{This field includes the study identifier of each of the 3 primary studies which reported their basic statistics on a time period & document basis. }
\item{Exp}{This identifies the experiment to which the descriptive data belongs.}
\item{Doc}{This identifies whether the data arose from the document used in the first or second time period. The value 'Doc1' identifies the data as coming from the first document or first time period. The value 'Doc2' identifies the data as coming from the second time period or document. Note for Study 3 we used the analysis of a specific document that was used in all 4 ABBA experiments. For studies 7 and 11, the authors identified which we used in r=each time period and Doc1 refers to data from the first time period.}
\item{Mc}{The mean value of the observations obtained using the control technique for the identified document.}
\item{SDc}{The standard deviation of the observations obtained using the control technique for the identified document.}
\item{Nc}{The number of participants using the control technique in the first time period for the identified document.}
\item{Mt}{The mean value of the observations obtained using the treatment technique for the identified document.}
\item{SDt}{The standard deviation of the observations obtained using the treatment technique for the identified document.}
\item{Nt}{The number of participants using the treatment technique in the first time period for the identified document.}
}
}
\source{
\url{https://madeyski.e-informatyka.pl/reproducible-research/}
}
\usage{
KitchenhamMadeyskiBrereton.DocData
}
\description{
This data is used in the paper: Barbara Kitchenham, Lech Madeyski and Pearl Brereton. Meta-analysis for Families of Experiments: A Systematic Review and Reproducibility Assessment, Empirical Software Engineering (2019) doi:10.1007/s10664-019-09747-0.
This file holds the descriptive data for each document and each experiment for studies 3, 7 and 11 which include the mean, standard deviation and sample size for the control and treatment techniques. These studies performed ABBA crossover experiments and reported data for each document separately. Note Study 3 also undertook an independent groups study but data from that experiment is held in the ExpData file.
}
\examples{
KitchenhamMadeyskiBrereton.DocData

}
\keyword{datasets}
