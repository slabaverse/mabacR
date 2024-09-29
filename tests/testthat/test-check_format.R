library(testthat)
library(mabacR)

data("mabac_df")

test_that("Dataframe is correctly formatted", {
  expect_true(check_format(mabac_df))
})

test_that("Missing Dataframe",{
  expect_error(check_format())
})

test_that("Non Dataframe format",{
  expect_true(is.data.frame(mabac_df))
})

test_that("Dataframe is NULL",{
  expect_true(!is.null(mabac_df) ||nrow(mabac_df) < 2 ||ncol(mabac_df) < 5)
})

test_that("Wight sum is equal to one",{
  expect_equal(sum(mabac_df[2]), 1)
})

test_that("Some columns are numeric",{
  expect_true(all(sapply(mabac_df[, c(2, 4:ncol(mabac_df))], is.numeric)))
})
