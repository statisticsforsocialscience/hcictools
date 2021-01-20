test_that("careless_indices accurately checks illegal arguments in speeder_analysis", {

  expect_error(careless_indices(NULL, speeder_analysis = "areer"))
  expect_error(careless_indices(NULL, speeder_analysis = ""))
  expect_error(careless_indices(NULL, speeder_analysis = "FALSE"))
  expect_error(careless_indices(NULL, speeder_analysis = "areer"))
  expect_error(careless_indices(NULL, speeder_analysis = "median/1.3"))
  expect_error(careless_indices(NULL, speeder_analysis = "areer/123"))
  #expect_error(careless_indices(NULL, speeder_analysis = "median/median"))
  #expect_error(careless_indices(NULL, speeder_analysis = "median/m"))

})


test_that("test basic functionality",{

  test_data <- tibble::tibble(
    ResponseId = 1:nrow(psych::bfi),
    duration = stats::rnorm(nrow(psych::bfi), mean = 100, sd = 50),
    psych::bfi)


  testthat::expect_error(careless_indices(test_data, duration_column = "duration", id_column = "ResponseId", likert_vector = c(3:28)), NA)

})
