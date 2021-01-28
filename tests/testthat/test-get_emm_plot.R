test_that("get_emm_plot works", {

  jmv_result <- jmv::ANOVA(
    data = ToothGrowth,
    dep = "len",
    factors = c("supp", "dose"),
    emMeans = list(
      c("dose", "supp")))


  get_emm_plot(jmv_result) + ggplot2::labs(title = "test")

  testthat::expect_error(get_emm_plot(jmv_result), NA)

  # remove file created in test
  unlink("Rplots.pdf")
})
