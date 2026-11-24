test_that("basic example works", {
  skip_if_not(
    "neojags" %in% rjags::list.modules(),
    "neojags JAGS module could not be loaded"
  )
  getex <- neojags:::example_neojags()
  expect_s3_class(getex, "runjags")
  expect_true(all(c("alpha", "m", "c", "precision") %in% colnames(getex$mcmc[[1]])))
})
