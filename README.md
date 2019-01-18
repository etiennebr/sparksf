
<!-- README.md is generated from README.Rmd. Please edit that file -->
sparksf
=======

`sparksf` provides acces to spatial functions in [sparklyr](https://github.com/rstudio/sparklyr)

Installation
------------

You can install the development version of sparksf from [github](https://github.com/etiennebr/sparksf) with:

``` r
# install.packages("remotes")
remotes::install_github("etiennebr/sparksf")
```

Example
-------

``` r
library(sparksf)
library(sparklyr)
library(dplyr)

sc <- spark_connect(master = "local")
```
