% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{KitchenhamMadeyskiBudgen16.SubjectData}
\alias{KitchenhamMadeyskiBudgen16.SubjectData}
\title{KitchenhamMadeyskiBudgen16.SubjectData}
\format{
A data frame with variables:
\describe{
\item{Judge}{Alphanumeric identifier for each judge}
\item{Institution}{Numerical value identifying each site from which data was collected}
\item{JudgeID}{Numerical value identifying each judge}
\item{Age}{Age of the judge in years}
\item{Eng1st}{Whether the judge's first language was Enlish: Yes/No}
\item{YearsStudy}{The number of years have student been studying computing at University: 1, 2, 3, 4}
\item{AbstractsRead}{Number of abstracts the judge had read prior to the study' 0, 1 to 10, 10+}
\item{AbstractsWritten}{Whether the judge had ever written an abstract for a scientific report/article}
\item{AbstractID}{Alphanumeric identifier for an abstract. The first character identifies the journal, I=IST, J=JSS, the third digit identifies the time period as 1 or 2, the remaining digits identify the abstract number within the set of abstracts found for the specified journal and time period}
\item{Treat}{The initial 3 characters of AbstractID}
\item{TreatID}{A numeric identifier for the journal and time period, 1=IB1, 2=IB2, 3=JB1, 4=JB2}
\item{Order}{The order in which the judge should have viewed the specified abstract}
\item{Completness1NumValue}{The numeric answer to completeness question 1}
\item{Completness2NumValue}{The numeric answer to completeness question 2}
\item{Completness3NumValue}{The numeric answer to completeness question 3}
\item{Completness4NumValue}{The numeric answer to completeness question 4}
\item{Completness5NumValue}{The numeric answer to completeness question 5}
\item{Completness6NumValue}{The numeric answer to completeness question 6}
\item{Completness7NumValue}{The numeric answer to completeness question 7}
\item{Completness8NumValue}{The numeric answer to completeness question 8}
\item{Clarity}{The response to the clarity question or NA if not answered}
\item{NumberOfAnsweredCompletnessQuestions}{The number of completeness questions excluding those with NA}
\item{TotalScore}{Sum of the numeric values of the 8 completeness questions}
\item{MeanScore}{Sum of the completeness questions 1 to 8 divided by TotalScore}
\item{Site}{The name of the site which provided the data. HongKong refers to the Polytechnic University, HongKong.2 refers to the City University}
}
}
\source{
\url{https://madeyski.e-informatyka.pl/reproducible-research/}
}
\usage{
KitchenhamMadeyskiBudgen16.SubjectData
}
\description{
If you use this data set please cite this R package and the following paper when accepted: Barbara Kitchenham, Lech Madeyski, David Budgen, Jacky Keung, Pearl Brereton, Stuart Charters, Shirley Gibbs, and Amnart Pohthong, 'Robust Statistical Methods for Empirical Software Engineering', Empirical Software Engineering, vol. 22, no. 2, pp. 579–630, 2017. DOI: 10.1007/s10664-016-9437-5 (https://dx.doi.org/10.1007/s10664-016-9437-5), URL: https://madeyski.e-informatyka.pl/download/KitchenhamMadeyskiESE.pdf
}
\details{
Data set collected from 16 judges assessing 4 abstracts at 6 sites: Lincoln University NZ=1, Hong Kong Polytechnic University=2, PSu Thailand=3, Durham=4, Keele=5, Hong Kong City University=6

subjectdata.txt: Judge Institution JudgeID age eng1st years.study abs.read Absid Treat TreatID Order Com.1 Com.2 Com.3 Com.4 Com.5 Com.6
Com.7 Com.8 Clarity num.questions total.score av.score Site
}
\examples{
KitchenhamMadeyskiBudgen16.SubjectData

}
\keyword{datasets}
