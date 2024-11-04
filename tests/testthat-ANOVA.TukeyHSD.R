# Load libraries and package
library(devtools)
load_all()
library(testthat)
library(readxl)

# Load dataset
my_dataset <- read_excel("data/Personal_Dataset.xlsx")

# Test 1: Check if the function works with NA values present
test1 <- test_that("ANOVA.TukeyHSD handles NA values", {
  test_data_NA <- my_dataset
  test_data_NA$`Lactic acid`[1:3] <- NA # Introduce NA values in the Lactic acid column

  # Function should not error out with NA values in dependent variable
  expect_error(ANOVA.TukeyHSD(data = test_data_NA, variables = `Lactic acid` ~ Species),
               NA, info = "Function should handle NA values gracefully.")
})

# Test 2: Check if the function handles an empty dataset gracefully
test2 <- test_that("ANOVA.TukeyHSD handles an empty dataset gracefully", {
  empty_data <- data.frame(`Lactic acid` = numeric(0), Species = character(0))

  # Function should return a specific error message for empty dataset
  expect_error(ANOVA.TukeyHSD(data = empty_data, variables = `Lactic acid` ~ Species),
               "Empty dataset is not compatible with this function.")
})

# Test 3: Check if the function works with a complete dataset (no NAs)
test3 <- test_that("ANOVA.TukeyHSD works with a complete dataset", {
  # Expect the function to run without error and produce a list with specific elements
  result <- ANOVA.TukeyHSD(data = my_dataset, variables = `Lactic acid` ~ Species)

  # Check the output type and the presence of anova and tukey results
  expect_type(result, "list")
  expect_true("anova" %in% names(result))
  expect_true("tukey" %in% names(result))
})

print(test1)
print(test2)
print(test3)
