library(testthat)        # Load testthat package
library(mabacR)         # Load our package

data("mabac_df")

test_that("Missing Dataframe",{
  expect_error(mabacR())
})
