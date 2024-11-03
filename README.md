[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/jH1Ixftw)

# STAT 545 Assignment B-2
#### Student: Martin Moran (48449193)
#### Deadline: November 8 @5:00pm PDT

## Assignment B-2
Assignment B-2 is an individual project as part of the STAT 545B coursework. Through this project, I will package my function that I made during Assignment B-1.

## Function Description
The packaged function performs an ANOVA statistical analysis and Tukey's Honestly Significant Difference (HSD) Post Hoc Test. This function streamlines my analysis workflow, especially for my personal dataset.

#### The Files in this Repository Include: README.md, NAMESPACE, and DESCRIPTION. 
* The README file contains background information on the project and the components included in this repository.
* The NAMESPACE file defines which functions are accessible to users and specifies package dependencies, controlling the import and export of functions.
* The DESCRIPTION file contains metadata about the package, including its name, version, author, dependencies, and a brief description of its purpose.

#### Install Instructions
To use the ANOVA.TukeyHSD function, first install the package by cloning this repository and building it with devtools. You will also need the broom package for tidy outputs.
1. Install the broom package (if not already installed)
  ```{r}
    install.packages("broom")
  ```
2. Clone this repository and install the package:
   ```{r}
    # Assuming the repository is cloned locally
    devtools::install("path/to/your/package")
  ```

#### Demonstrated Usage
Here’s an example of how to use the ANOVA.TukeyHSD function with sample data:
  ```{r}
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
  ```
