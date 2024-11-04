#' Perform ANOVA and Tukey Post Hoc Test.
#'
#' Conducts an analysis of variance (ANOVA) statistical test followed by a Tukey's Honestly Significant Difference (HSD) Post Hoc test.
#' Returns the output in the form of a tibble.
#'
#' @param data A data frame containing the variables of interest.
#' @param variables The formula syntax `Dependent ~ Independent`.
#'
#' @return A list containing:
#'   - `anova`: A tibble with ANOVA results.
#'   - `tukey`: A tibble with Tukey HSD results.
#'
#' @examples
#' # Example 1: Basic ANOVA and Tukey HSD
#' # Assuming my_data is a dataset with a numeric dependent variable Lactic_acid
#' # and a categorical independent variable Species.
#' my_data <- data.frame(
#'   Lactic_acid = c(5.1, 4.9, 4.7, 6.2, 5.8, 6.4, 5.7, 6.0, 5.9),
#'   Species = factor(rep(c("Species_A", "Species_B", "Species_C"), each = 3))
#' )
#'
#' results <- ANOVA.TukeyHSD(data = my_data, variables = Lactic_acid ~ Species)
#'
#' # View the ANOVA results
#' results$anova
#'
#' # View the Tukey HSD results
#' results$tukey
#'
#' # Example 2: ANOVA and Tukey HSD with multiple groups
#' # In this example, my_experiment_data contains a dependent variable Response
#' # measured across four different Treatment groups.
#'
#' # Creating a sample dataset with four treatment groups
#' my_experiment_data <- data.frame(
#'   Response = c(7.1, 6.8, 7.5, 6.9, 8.3, 8.1, 7.8, 7.4, 6.7,
#'                7.3, 8.5, 7.6, 8.0, 8.2, 7.9, 8.1, 8.3, 7.7),
#'   Treatment = factor(rep(c("Control", "Treatment_A", "Treatment_B",
#'                             "Treatment_C"), each = 4, length.out = 18))
#' )
#'
#' # Running the ANOVA and Tukey HSD analysis
#' experiment_results <- ANOVA.TukeyHSD(data = my_experiment_data,
#'                                        variables = Response ~ Treatment)
#'
#' # Viewing the ANOVA results
#' print(experiment_results$anova)
#'
#' # Viewing the Tukey HSD results
#' print(experiment_results$tukey)
#'
#' @import broom
#' @export

ANOVA.TukeyHSD <- function(data, variables) {
  # Ensure data is not empty
  if (nrow(data) == 0) {
    stop("Empty dataset is not compatible with this function.")
  }

  # Run ANOVA and tidy the result
  anova_result <- stats::aov(variables, data = data)  # Correct use of package::function()
  anova_summary <- broom::tidy(anova_result)           # Correct use of package::function()

  # Run Tukey post-hoc test and tidy the result
  tukey_result <- stats::TukeyHSD(anova_result)       # Correct use of package::function()
  tukey_summary <- broom::tidy(tukey_result)           # Correct use of package::function()

  # Return both summaries
  list(anova = anova_summary, tukey = tukey_summary)
}
