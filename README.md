# dotprofile

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/dotprofile)](https://CRAN.R-project.org/package=dotprofile)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/jeanmathieupotvin/dotprofile/workflows/R-CMD-check/badge.svg)](https://github.com/jeanmathieupotvin/dotprofile/actions)
[![codecov](https://codecov.io/gh/jeanmathieupotvin/dotprofile/branch/main/graph/badge.svg?token=L2MONOIYND)](https://app.codecov.io/gh/jeanmathieupotvin/dotprofile)
<!-- badges: end -->

Package `dotprofile` is a toolbox to create and manage metadata files and
configuration profiles: files used to configure the parameters and initial
settings for some computer programs. It exposes safe interfaces to such
files via dedicated [R6](https://github.com/r-lib/R6) classes. It aims to
handle low-level tasks and details, and defers what matters to the developers.

## Installation

This package is in a pre-alpha version and should not be used until further
notice. If you insist on using it, you can install the development version
of `dotprofile` from [GitHub](https://github.com/).

``` r
# install.packages("devtools")
devtools::install_github("jeanmathieupotvin/dotprofile")
```

All version published on CRAN below version 0.1.0 should __not__ be used. 
They were published mainly to secure the package's name.
