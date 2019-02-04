context("test-spatial")

library(sparklyr)
library(DBI)
sc <- spark_connect(master = "local")
sc <- register_geomesa(sc)

test_that("point creation works", {
  expect_silent(pt <- DBI::dbGetQuery(sc, "SELECT st_geomfromwkt('POINT(1 1)')"))
})
