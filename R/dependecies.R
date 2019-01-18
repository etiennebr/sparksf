spark_dependencies <- function(spark_version, scala_version, ...) {
  sparklyr::spark_dependency(
    #packages = "org.locationtech.geomesa:geomesa-fs-dist_2.11:2.1.1",
    jars = list.files(system.file("inst/jars", package = "sparksf"), "\\.jar$", full.names = TRUE)
  )
}

#' @import sparklyr
.onLoad <- function(libname, pkgname) {
  sparklyr::register_extension(pkgname)
}

#' on connect
register_geomesa <- function(sc) {
  sparklyr::invoke_static(sc,
    class = "org.datasyslab.geosparksql.utils.GeoSparkSQLRegistrator",
    method = "registerAll"
  )
}
