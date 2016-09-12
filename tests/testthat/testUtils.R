context("utils")
test_that("test",{
  a <- as.factor(c("test", "test2"))
  b <- c(1,2)
  expect_equal(as.numeric.factor(a),b)
})
