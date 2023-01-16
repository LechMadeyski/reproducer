#' @title varianceSimulation
#' @description Function to find the average small sample size and moderate
#' sample size variance of dIG and dRM from 500 simulations for a specific
#' combination of sample size, correlation and effect size. The function also
#' calculates the proportion of times the correct AB/BA analysis would have
#' rejected the null hypothesis. The function also calculates the proportion
#' of time an incorrect analysis (i.e. an analysis that ignored the presence
#' of repeated measures) would reject the null hypothesis. Function is used in
#' a paper "Effect Sizes and their Variance for AB/BA Crossover Design Studies"
#'  by Lech Madeyski and Barbara Kitchenham.
#' @author Barbara Kitchenham and Lech Madeyski
#' @export varianceSimulation
#' @param reps - the number of replications of each simulation condition i.e.
#' samplesize, correlation value, and treatment value
#' @param samplesize - the sample size in each sequence
#' (i.e. 5, 10, 15, 20, 25, 30, 50)
#' @param tcorr - the correlation between repeated measures
#' (i.e. 0. 0.25, 0.5, 0.75)
#' @param ttreat - the technique effect size (i.e. 0, 2.5, 5)
#' @param tvar - the between and with subjects variance i.e. 25
#' @param tperiod - the period effect, i.e. 5
#' @return a list including values including, e.g., the average small sample
#' size and moderate sample size variance of dIG and dRM for a specific set
#' of simulation conditions
#' @examples
#' varianceSimulation(500, 40, 1, 10, 1, 1)
varianceSimulation <-
  function(reps,
           samplesize,
           tcorr,
           ttreat,
           tvar,
           tperiod) {
    # Set up the conditions for an individual simulation
    tcovar <- tvar * tcorr
    sigmaM <- matrix(c(tvar, tcovar, tcovar, tvar),
      nrow = 2,
      ncol = 2
    )
    meanA <- c(50, 50 + tperiod + ttreat)

    meanB <- c(50 + ttreat, 50 + tperiod)

    Num <- samplesize
    N1 <- N2 <- Num
    df <- N1 + N2 - 2
    c <- 1 - (3 / (4 * df - 1))

    # Set up the variable to hold the outcome of each individual simulation for
    # a specific set of simulation conditions

    treat <- c(1:reps) # Variable to hold estimated value of the treatment effect

    period <- c(1:reps) # Variable to hold estimated value of the treatment effect
    diffvar <- c(1:reps) # Variable to hold estimated value of variance of the
    # difference between values for a specific subject in an individual sample

    effectsizevar <- c(1:reps) # Variable to estimate of variance of
    # unstandardised effect size

    dRM <- c(1:reps) # Variable to hold estimate of dRM
    withinvar <- c(1:reps) # Variable to hold the within sequence and time period
    # variance corresponding to varIG

    varwithinest <- c(1:reps) # variable not used?
    dIG <- c(1:reps) # Variable to hold dIG estimated from withinvar

    r <- c(1:reps) # Estimate of r for each sample

    tRM <- c(1:reps) # Variable to hold value of t test of t-test for
    # repeated measures

    trmsig <- c(1:reps) # Variable to hold significance of t-test
    wrongt <- c(1:reps) # Variable to hold value of t-test after incorrect analysis
    wrongtsig <- c(1:reps) # Variable to hold significance of t-test after
    # incorrect analysis

    vartrm <- c(1:reps) # Variable to hold variance of t-value
    vardrm <- c(1:reps) # Variable to hold variance of drm
    vardig <- c(1:reps) # Variable to hold variance of dig

    lsvardrm <- c(1:reps) # Variable to hold medium sample size approximation
    # variance of drm
    lsvardig <- c(1:reps) # Variable to hold medium sample size sample
    # approximation variance of dig

    lsvardrmaccuracy <- c(1:reps) # Variable to hold estimate of the accuracy of
    # the approximate drm variance
    lsvardigaccuracy <- c(1:reps) # Variable to hold estimate of the accuracy of
    # the approximate dig variance

    for (i in 1:reps)
    {
      # Set up the sample for a specific simulation condition i.e. samplesize,
      # correlation value, and treatment value. Construct a multivariate normal
      # sample with two variables one for each time period.

      # Sample for sequence A.

      mydata1 <- MASS::mvrnorm(Num, meanA, sigmaM)

      # Sample data for Sequence B

      mydata2 <- MASS::mvrnorm(Num, meanB, sigmaM)

      # Reformulate the sample data so it can be analysed as a cross-over sample
      mydata1 <- as.data.frame(mydata1)
      mydata2 <- as.data.frame(mydata2)
      names(mydata1) <- c("AP1", "AP2")
      names(mydata2) <- c("BP1", "BP2")

      # Calculate the period difference for each sample
      diff1 <- mydata1$AP2 - mydata1$AP1
      diff2 <- mydata2$BP2 - mydata2$BP1

      # Calculate the unstandardized treatment effect and period effect
      treat[i] <- (mean(diff1) - mean(diff2)) / 2
      period[i] <- (mean(diff1) + mean(diff2)) / 2

      # Calculate the the within groups variance of the period difference - note
      # the sample sizes in each  period are equal
      diffvar[i] <- (stats::var(diff1) + stats::var(diff2)) / 2

      # For a cross-over with a significant period effect the within groups
      # variance of drm is half the variance of the difference variance.
      effectsizevar[i] <- diffvar[i] / 2

      # Calculate drm-the standardised effect size for the repeated measure
      # design
      dRM[i] <- treat[i] / (sqrt(effectsizevar[i]))


      withinvar[i] <- (
        stats::var(mydata1$AP1) + stats::var(mydata1$AP2) +
          stats::var(mydata2$BP1) + stats::var(mydata2$BP2)
      ) / 4

      # Calculate dig - the standardised effect size equivalent to a between
      # groups design

      dIG[i] <- treat[i] / sqrt(withinvar[i])

      # Calculate the estimate of the correlation between subjects

      r[i] <- (withinvar[i] - effectsizevar[i]) / withinvar[i]


      # Calculate the value of the t-test obtained that would be found using the
      # correct analysis
      tRM[i] <- dRM[i] * sqrt((2 * N1 * N2) / (N1 + N2))

      # Assess whether the t-value would be judged significant
      if ((1 - stats::pt(abs(tRM[i]), df)) * 2 < 0.05) {
        trmsig[i] <- 1
      } else {
        trmsig[i] <- 0
      }

      # Calculate the value of the t-test obtained that would be found from a
      # simple period by sequence analysis ignoring the fact that values were
      # correlated - i.e. t-test with 4*Num-3 df.
      # In this case the t test is related to:
      # sqrt((1/2*Num) + (1/2*Num))=sqrt(1/Num)
      wrongt[i] <- dIG[i] / sqrt(1 / (Num))
      if ((1 - stats::pt(abs(wrongt[i]), 4 * Num - 3)) * 2 < 0.05) {
        wrongtsig[i] <- 1
      } else {
        wrongtsig[i] <- 0
      }

      # Calculate the variance of the standardised effect sizes based on the
      # variance of the t-value
      vartrm[i] <- (df / (df - 2)) * ((1 + tRM[i]^2)) - tRM[i]^2 / c^
        2
      vardrm[i] <- vartrm[i] * (N1 + N2) / (2 * N1 * N2)
      vardig[i] <- vardrm[i] * (1 - r[i])

      # Calculate the medium sample size variance of the standardised effect
      # sizes
      lsvardrm[i] <- (N1 + N2) / (2 * N1 * N2) + dRM[i]^2 / (2 * (N1 + N2 -
        2))
      lsvardig[i] <- (1 - r[i]) * (N1 + N2) / (2 * N1 * N2) + dIG[i]^2 /
        (2 * (N1 + N2 - 2))

      # Calculate the accuracy of the medium sample size variance compared
      # with the "exact" estimate
      lsvardrmaccuracy[i] <- 100 * (vardrm[i] - lsvardrm[i]) / vardrm[i]
      lsvardigaccuracy[i] <- 100 * (vardig[i] - lsvardig[i]) / vardig[i]
    }

    # Calculate the values to be plotted for this specific set of
    # simulation conditions
    esttrm <- mean(tRM)
    propsig <- 100 * sum(trmsig) / reps
    propwrongtsig <- 100 * sum(wrongtsig) / reps
    esttreat <- mean(treat)
    estdRM <- mean(dRM)
    estdIG <- mean(dIG)
    estvardrm <- mean(vardrm)
    estvardig <- mean(vardig)
    estlsvardrm <- mean(lsvardrm)
    estlsvardig <- mean(lsvardig)
    estr <- mean(r)
    averagelsvardrmaccuracy <- mean(lsvardrmaccuracy[i])
    averagelsvardigaccuracy <- mean(lsvardigaccuracy[i])
    result <- list(
      esttrm = esttrm,
      proportionsig = propsig,
      propwrongtsig = propwrongtsig,
      esttreat = esttreat,
      dRM = estdRM,
      dIG = estdIG,
      vardrm = estvardrm,
      vardig = estvardig,
      lsvardrm = estlsvardrm,
      lsvardig = estlsvardig,
      approxaccuracyvardrm = averagelsvardrmaccuracy,
      approxaccuracyvardig = averagelsvardigaccuracy,
      estcorr = estr
    )
    return(result)
  }


#' @title getSimulatedCrossoverDataSets
#' @description Function to obtain the simulated crossover data sets, stored
#' as a data frame, needed to show the relationship between sample size x effect
#' size x [Percentage Inaccuracy of the Large Sample Variance Approximation]/
#' [Proportion of Significant t-Values Using the Correct Analysis]/
#' [Proportion of Significant t=values when Using an Invalid Analysis].
#' Function is used in a paper "Effect Sizes and their Variance for AB/BA
#' Crossover Design Studies" by Lech Madeyski and Barbara Kitchenham.
#' @author Lech Madeyski and Barbara Kitchenham
#' @export getSimulatedCrossoverDataSets
#' @return simulated crossover data sets exactly the same as stored in
#' reproducer::KitchenhamMadeyski.SimulatedCrossoverDataSets
#' @examples
#' data <- getSimulatedCrossoverDataSets()
getSimulatedCrossoverDataSets <- function() {
  # Need simulations for different samples sizes, technique effects, and
  # within-subject correlations

  # Technique effect sizes: 0, 2.5, 5
  # Sample sizes per sequence group: 5, 10, 15, 20, 25, 30, 50
  # Correlations: 0, 0.25, 0.5, 0.75
  # Period:  0,5

  samplesize <- c(5, 10, 15, 20, 25, 30, 50)
  corr <- c(0, 0.25, 0.5, 0.75)
  treat <- c(0, 2.5, 5)
  period <- c(0, 5)


  SampleSize <- c("5", "10", "15", "20", "25", "30", "50")

  Correlations <- c("0", "0.25", "0.5", "0.75")
  EffectSize <- c("0", "2.5", "5")
  Period <- c("0", "5")

  SSFull <- c(rep(SampleSize, 12))
  CFull <- c(
    rep(Correlations[1], 21),
    rep(Correlations[2], 21),
    rep(Correlations[3], 21),
    rep(Correlations[4], 21)
  )
  ESPattern <- c(
    rep(EffectSize[1], 7),
    rep(EffectSize[2], 7),
    rep(EffectSize[3], 7)
  )
  ESFull <- c(rep(ESPattern, 4))

  Accuracy <- c(1:84)
  PropSig <- c(1:84)
  WrongTSig <- c(1:84)
  # Sets up a data frame to hold the output from the simulations. The first
  # three variables identify the specific conditions realted to sample size,
  # correlation and effect size
  simulationOutputDf <- data.frame(
    SSFull, CFull, ESFull, Accuracy, PropSig,
    WrongTSig
  )
  counti <- 0
  countk <- 0
  # Calculate the simulation metrics. This loop tries all the different
  # simulation conditions and outputs the three values that will be plotted
  # for each conditions into a single data frame.
  for (j in 1:4)
  {
    for (k in 1:3)
    {
      countk <- countk + 1
      set.seed(123 * j * countk)
      for (i in 1:7)
      {
        counti <- counti + 1
        simout <- varianceSimulation(
          500,
          samplesize[i],
          corr[j],
          treat[k],
          25,
          period[2]
        )
        simulationOutputDf[counti, 4] <- simout$approxaccuracyvardrm
        simulationOutputDf[counti, 5] <- simout$proportionsig
        simulationOutputDf[counti, 6] <- simout$propwrongtsig
      }
    }
  }

  actualSampleSize <- samplesize * 2

  results <- data.frame(actualSampleSize, simulationOutputDf)
  return(results)
}
