test_that("basic example works", {
  getex <- neojags:::example_neojags()
  expect_true(is.object(getex), TRUE)
  })
