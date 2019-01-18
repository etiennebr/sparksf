.dependencies_geomesa <- function(spark_version) {
  urls <- c(
    "https://github.com/DataSystemsLab/GeoSpark/releases/download/1.1.3-spark-{spark_version}/geospark-1.1.3.jar",
    "https://github.com/DataSystemsLab/GeoSpark/releases/download/1.1.3-spark-{spark_version}/geospark-sql_{spark_version}-1.1.3.jar",
    "https://github.com/DataSystemsLab/GeoSpark/releases/download/1.1.3-spark-{spark_version}/geospark-viz-1.1.3.jar"
    )
  purrr::map_chr(urls, ~glue::glue(.x, spark_version = spark_version))
}

.refresh_dependencies <-  function(files = .dependencies_geomesa("2.1")) {
  download.file(files, destfile = file.path("inst/jars", basename(files)))
}
