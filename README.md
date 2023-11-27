<!-- README.md is generated from README.Rmd. Please edit that file -->

# reproducer

The R package **reproducer** is aimed to support reproducible research
in software engineering. See the package
[homepage](https://cran.r-project.org/package=reproducer) for details
and examples.

## Installation

One may install the stable version from
[CRAN](https://cran.r-project.org/package=reproducer):

``` r
install.packages('reproducer', dependencies = TRUE)
```

You can use **devtools** to install the development version from my web
site:

``` r
install.packages("devtools", dependencies = T, repos = "https://cran.r-project.org/")
library(devtools)
devtools::install_url("https://madeyski.e-informatyka.pl/download/R/reproducer_0.5.3.tar.gz")
library(reproducer)
```

## Motivation

The motivation is to support using robust statistical methods and
reproducible research in software engineering via sharing data sets and
code behind the published or just submitted papers.

## Citation

If you use **reproducer**, please cite it:

    #> To cite package 'reproducer' in publications please use:
    #> 
    #>   Lech Madeyski, Marian Jureczko (2015). Which process metrics can
    #>   significantly improve defect prediction models? An empirical study.
    #>   Software Quality Journal, vol. 23, no. 3, pp. 393-422 DOI:
    #>   10.1007/s11219-014-9241-7 Online:
    #>   https://dx.doi.org/10.1007/s11219-014-9241-7
    #> 
    #>   Marian Jureczko, Lech Madeyski (2015). Cross-project defect
    #>   prediction with respect to code ownership model: An empirical study
    #>   e-Informatica Software Engineering Journal, vol. 9, no. 1, pp. 21-35
    #>   DOI: 10.5277/e-Inf150102 Online:
    #>   https://dx.doi.org/10.5277/e-Inf150102
    #> 
    #>   Barbara A. Kitchenham, Lech Madeyski, David Budgen, Jacky Keung,
    #>   Pearl Brereton, Stuart Charters, Shirley Gibbs and Amnart Pohthong
    #>   (2017). Robust Statistical Methods for Empirical Software Engineering
    #>   Empirical Software Engineering, vol. 22, no.2, p. 579-630 DOI:
    #>   10.1007/s10664-016-9437-5 Online:
    #>   https://dx.doi.org/10.1007/s10664-016-9437-5
    #> 
    #>   Lech Madeyski and Barbara Kitchenham (2018) Effect Sizes and their
    #>   Variance for AB/BA Crossover Design Studies Empirical Software
    #>   Engineering, vol. 23, no.4, p. 1982-2017 DOI:
    #>   10.1007/s10664-017-9574-5 Online:
    #>   https://dx.doi.org/10.1007/s10664-017-9574-5
    #> 
    #>   Barbara Kitchenham, Lech Madeyski and Pearl Brereton (2020)
    #>   Meta-analysis for families of experiments in software engineering: a
    #>   systematic review and reproducibility and validity assessment
    #>   Empirical Software Engineering, vol. 25, no.1, p. 353-401 DOI:
    #>   10.1007/s10664-019-09747-0 Online:
    #>   https://dx.doi.org/10.1007/s10664-019-09747-0
    #> 
    #>   Tomasz Lewowski and Lech Madeyski (2020) Creating Evolving Project
    #>   Data Sets in Software Engineering vol. 851 of Studies in
    #>   Computational Intelligence, p.1-14, Springer DOI:
    #>   10.1007/s10664-019-09747-0 Online:
    #>   https://dx.doi.org/10.1007/s10664-019-09747-0
    #> 
    #>   Barbara Kitchenham, Lech Madeyski, Giuseppe Scanniello, and Carmine
    #>   Gravino (2022) The importance of the correlation in crossover
    #>   experiments IEEE Transactions on Software Engineering, vol. 48, no.8,
    #>   p. 2802-2813 DOI: 10.1109/TSE.2021.3070480 Online:
    #>   https://doi.org/10.1109/TSE.2021.3070480
    #> 
    #>   Lech Madeyski (2023). reproducer: Reproduce Statistical Analyses and
    #>   Meta-Analyses. R package version 0.5.3.
    #>   https://madeyski.e-informatyka.pl/reproducible-research/
    #> 
    #> To see these entries in BibTeX format, use 'print(<citation>,
    #> bibtex=TRUE)', 'toBibtex(.)', or set
    #> 'options(citation.bibtex.max=999)'.

## Status

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/reproducer)](https://cran.r-project.org/package=reproducer)
[![Total
Downloads](https://cranlogs.r-pkg.org/badges/grand-total/reproducer)](https://cran.r-project.org/package=reproducer)
[![Downloads/month](https://cranlogs.r-pkg.org/badges/reproducer)](https://cran.r-project.org/package=reproducer)
