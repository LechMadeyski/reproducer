library(reproducer)
context("MadeyskiKitchenhamMetaAnalysis")

newTolerance <- 0.001

test_that('effectSizeCI(expDesign="CrossOverRM", t=14.4, n1=15, n2=15, r=0.6401) returns expected results', {
  r<-effectSizeCI(expDesign="CrossOverRM", t=14.4, n1=15, n2=15, r=0.6401)
  expect_equal(r$t_LB, 10.96781, tolerance = newTolerance)
  expect_equal(r$t_UB, 19.98903, tolerance = newTolerance)
  expect_equal(r$d_RM_LB, 2.831876, tolerance = newTolerance)
  expect_equal(r$d_RM_UB, 5.161144, tolerance = newTolerance)
  expect_equal(r$d_IG_LB, 1.698889, tolerance = newTolerance)
  expect_equal(r$d_IG_UB, 3.096256, tolerance = newTolerance)
})

test_that('effectSizeCI(expDesign = "IG", t=-6.344175, n1=15, n2=15) returns expected results', {
  r<-effectSizeCI(expDesign = "IG", t=-6.344175, n1=15, n2=15)
  expect_equal(r$t_LB, -9.544803, tolerance = newTolerance)
  expect_equal(r$t_UB, -4.135702, tolerance = newTolerance)
  expect_equal(r$d_RM_LB, "NA", tolerance = newTolerance)
  expect_equal(r$d_RM_UB, "NA", tolerance = newTolerance)
  expect_equal(r$d_IG_LB, -3.485269, tolerance = newTolerance)
  expect_equal(r$d_IG_UB, -1.510145, tolerance = newTolerance)
})

test_that('r<-effectSizeCI(expDesign="CrossOverRM", t=0.5581, n1=6, n2=6, r=0.36135) returns expected results', {
  r<-effectSizeCI(expDesign="CrossOverRM", t=0.5581, n1=6, n2=6, r=0.36135)
  expect_equal(r$t_LB, -1.54704, tolerance = newTolerance)
  expect_equal(r$t_UB, 2.946539, tolerance = newTolerance)
  expect_equal(r$d_RM_LB, -0.6315766, tolerance = newTolerance)
  expect_equal(r$d_RM_UB, 1.202919, tolerance = newTolerance)
  expect_equal(r$d_IG_LB, -0.5047281, tolerance = newTolerance)
  expect_equal(r$d_IG_UB, 0.96132, tolerance = newTolerance)
})

test_that('r<-effectSizeCI(expDesign = "CrossOverRM", r=0.855,t=4.33, n1=7, n2=6) returns expected results', {
  r<-effectSizeCI(expDesign = "CrossOverRM", r=0.855,t=4.33, n1=7, n2=6)
  expect_equal(r$t_LB, 2.208965, tolerance = newTolerance)
  expect_equal(r$t_UB, 8.32456, tolerance = newTolerance)
  expect_equal(r$d_RM_LB, 0.869002, tolerance = newTolerance)
  expect_equal(r$d_RM_UB, 3.274864, tolerance = newTolerance)
  expect_equal(r$d_IG_LB, 0.3309061, tolerance = newTolerance)
  expect_equal(r$d_IG_UB, 1.247031, tolerance = newTolerance)
})

