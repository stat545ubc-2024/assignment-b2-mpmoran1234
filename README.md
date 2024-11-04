
# STAT 545 Assignment B-2:

## Package: ANOVA.TukeyHSD

#### Student: Martin Moran (48449193)

#### Deadline: November 8 @5:00pm PDT

<!-- badges: start -->

![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)
<!-- badges: end -->

## Assignment B-2

Assignment B-2 is an individual project as part of the STAT 545B
coursework. Through this project, I will package my function that I made
during Assignment B-1.

##### The Files in this Repository Include: README.md/.Rmd, NAMESPACE, DESCRIPTION, R/ANOVA.TukeyHSD.R, man/ANOVA.TukeyHSD.Rd, tests/testthat/testthat-ANOVA.TukeyHSD.R, and inst/extdata.xlsx.

- The **README** files contain background information on the project and
  the components included in this repository.
- The **NAMESPACE** file defines which functions are accessible to users
  and specifies package dependencies, controlling the import and export
  of functions.
- The **DESCRIPTION** file contains metadata about the package,
  including its name, version, author, dependencies, and a brief
  description of its purpose.
- The **R/ANOVA.TukeyHSD.R** file contains the core function code for
  the the ANOVA.TukeyHSD package.
- The **man/ANOVA.TukeyHSD.Rd** file provides a detailed explanation of
  the function’s purpose, parameters, usage, and example code.
- The **tests/testthat/testthat-ANOVA.TukeyHSD.R** file contains unit
  tests for the ANOVA.TukeyHSD function, verifying that the function
  behaves as expected with various inputs.
- The **inst/extdata.xlsx** file is the data set that I have been using
  since the mini-data analysis in section A. It is included in this
  repository because it is used in the testthat-ANOVA.TukeyHSD.R file.

## Package Description

The packaged function performs an ANOVA statistical analysis and Tukey’s
Honestly Significant Difference (HSD) Post Hoc Test. This function
streamlines the analysis workflow by combining two commonly used
statistical tests into one simple command.

## Install Instructions

To use the ANOVA.TukeyHSD() function, install the package using
github_install() from devtools as shown below:

1.  Install devtools (if not already installed):

``` r
install.packages("devtools")
```

2.  Load devtools:

``` r
library(devtools)
```

3.  Install this package from github:

``` r
install_github("stat545ubc-2024/assignment-b2-mpmoran1234")
#> rlang (1.1.3 -> 1.1.4) [CRAN]
#> glue  (1.7.0 -> 1.8.0) [CRAN]
#> cli   (3.6.2 -> 3.6.3) [CRAN]
#> package 'rlang' successfully unpacked and MD5 sums checked
#> package 'glue' successfully unpacked and MD5 sums checked
#> package 'cli' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\marti\AppData\Local\Temp\RtmpQVZSkJ\downloaded_packages
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>          checking for file 'C:\Users\marti\AppData\Local\Temp\RtmpQVZSkJ\remotes62b81fab4184\stat545ubc-2024-assignment-b2-mpmoran1234-1faa7b3/DESCRIPTION' ...  ✔  checking for file 'C:\Users\marti\AppData\Local\Temp\RtmpQVZSkJ\remotes62b81fab4184\stat545ubc-2024-assignment-b2-mpmoran1234-1faa7b3/DESCRIPTION' (554ms)
#>       ─  preparing 'ANOVA.TukeyHSD':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#> ─  looking to see if a 'data/datalist' file should be added
#> ─  building 'ANOVA.TukeyHSD_0.1.0.tar.gz'
#>      
#> 
```

## Demonstrated Usage / Example

Here’s an example of how to use the ANOVA.TukeyHSD function with sample
data:

``` r
# Load the package
library(ANOVA.TukeyHSD)
  
# Sample data frame
data <- data.frame(
group = rep(letters[1:3], each = 10),
value = c(rnorm(10, mean = 5), rnorm(10, mean = 7), rnorm(10, mean = 6))
)
  
# Run the ANOVA and Tukey HSD tests
result <- ANOVA.TukeyHSD(data, value ~ group)
  
# View the results
print(result)
#> $anova
#> # A tibble: 2 × 6
#>   term         df sumsq meansq statistic  p.value
#>   <chr>     <dbl> <dbl>  <dbl>     <dbl>    <dbl>
#> 1 group         2  15.8   7.88      6.66  0.00444
#> 2 Residuals    27  31.9   1.18     NA    NA      
#> 
#> $tukey
#> # A tibble: 3 × 7
#>   term  contrast null.value estimate conf.low conf.high adj.p.value
#>   <chr> <chr>         <dbl>    <dbl>    <dbl>     <dbl>       <dbl>
#> 1 group b-a               0    1.67     0.460     2.87      0.00545
#> 2 group c-a               0    0.299   -0.907     1.51      0.813  
#> 3 group c-b               0   -1.37    -2.57     -0.160     0.0240
```
