spark_dependencies <- function(spark_version, scala_version, ...) {
  sparklyr::spark_dependency(
    # geomesa package: https://mvnrepository.com/artifact/org.locationtech.geomesa/geomesa-fs-dist_2.11/2.1.1
    # grouId:artifact:version
    packages = "org.locationtech.geomesa:geomesa-fs-dist_2.11:2.1.1"
  )
}

#' @import sparklyr
.onLoad <- function(libname, pkgname) {
  sparklyr::register_extension(pkgname)
}
