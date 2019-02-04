.dependencies_geomesa <- function(spark_version, geomesa_version) {
  root <- "https://github.com/DataSystemsLab/GeoSpark/releases/download"
  file_names <- c("geospark", "geospark-sql_{spark_version}", "geospark-viz")
  df <- expand.grid(
    file_name = file_names,
    spark_version = spark_version,
    geomesa_version = geomesa_version,
    root = root,
    stringsAsFactors  = FALSE
    )
  df$file_name <- purrr::map2_chr(df$file_name, df$spark_version, ~glue::glue(.x, spark_version = .y))
  glue::glue_data(df, ("{root}/{geomesa_version}-spark-{spark_version}/{file_name}-{geomesa_version}.jar"))
}

.refresh_dependencies <-  function(
  files = .dependencies_geomesa(
    spark_version = c("2.1", "2.2", "2.3"),
    geomesa_version = "1.1.3"
    )) {
  utils::download.file(files, destfile = file.path("inst/jars", basename(files)))
}
