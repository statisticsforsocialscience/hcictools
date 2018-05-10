# Context is the file that ist tested
context("utils")
# name the test
test_that("binary test",{
  a <- as.factor(c("test", "test2"))
  b <- c(1, 2)
  expect_equal(as.numeric.factor(a), b)
})
