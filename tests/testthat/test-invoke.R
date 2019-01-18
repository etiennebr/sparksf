context("invoke")

library(sparklyr)
sc <- spark_connect(master = "local")

test_that("can create JAIRMICRIF object", {
  instance <- invoke_new(sc, "com.sun.media.jai.rmi.JAIRMICRIF")
  expect_true(!is.null(instance))
})
