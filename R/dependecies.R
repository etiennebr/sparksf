spark_dependencies <- function(spark_version, scala_version, ...) {
  sparklyr::spark_dependency(
    #packages = "org.locationtech.geomesa:geomesa-fs-dist_2.11:2.1.1",
    jars = list.files(system.file("inst/jars", package = "sparksf"), "\\.jar$", full.names = TRUE),
    packages = c(
      sprintf("org.datasyslab:geospark-sql_%s:1.1.3",spark_version),
      "com.vividsolutions:jts-core:1.14.0",
      "org.datasyslab:geospark:1.1.3"
    )
  )
}

#' @import sparklyr
.onLoad <- function(libname, pkgname) {
  sparklyr::register_extension(pkgname)
}

#' Register geomesa extension
#'
#' @param sc Spark Connection.
#' @export
register_geomesa <- function(sc) {
  sparklyr::invoke_static(sc,
    class = "org.datasyslab.geosparksql.utils.GeoSparkSQLRegistrator",
    method = "registerAll",
    spark_session(sc)
  )
  return(invisible(sc))
}
