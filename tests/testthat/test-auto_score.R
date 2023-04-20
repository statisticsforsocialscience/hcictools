test_that("auto_score does not crash", {

  bfi <- psych::bfi
  # thes adding first
  #keys <- list(KUT = c("KUT1", "-KUT2"))
  #dataforsocialscience::robo_care_raw %>% add_scores("KUT", keys)

  library(hcictools)
  auto_score(bfi, "A")
  testthat::expect_error( bfi %>% auto_score("A"), NA)

  #dataforsocialscience::robo_care_raw %>% auto_score("KUT")

})
