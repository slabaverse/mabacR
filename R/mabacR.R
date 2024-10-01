#' @title mabacR()
#'
#'@description This package will execute the mathematical algorithms that make up the MABAC method,
#'              a multi-criteria decision method. The data will be normalized,
#'              weighted by the weights, the border area will be determined,
#'              the distances to this border area will be calculated
#'              and finally a ranking with the optimal option will be generated.
#'
#' @param mabac_df The original dataset containing, necessarily in this order:
#'                    1. a column with the criteria;
#'                    2. a column with the weights (which must add up to 1);
#'                    3. A column with types (1 for maximization and -1 for minimization);
#'                    4. and the columns with the evaluated items.
#'
#' @return A ranking with the optimal choice in accordance with your criteria, weights and type of criteria
#'
#' @examples data(mabac_df)
#'           output <- mabacR(mabac_df)
#'
#' @export
#'

mabacR <- function(mabac_df) {
  mabac_df <- as.data.frame(mabac_df)
  # Testing initial data:
  if (missing(mabac_df))
    return("ERROR: Worksheet (mabac_df parameter) is missing")
  check_result <- check_format(mabac_df)
  if (check_result$status == FALSE) return(paste("ERROR:", check_result$message))

  # Getting the maximum and minimum values:
  maxmin_df <- mabac_df[, -c(1, 2, 3)]
  max_values <- apply(maxmin_df, 1, max)
  min_values <- apply(maxmin_df, 1, min)
  differences <- max_values - min_values
  negative_differences <- -differences

  # Normalizing values:
  original_values_t <- mabac_df[, -c(1, 2)]
  original_values <- original_values_t[, -c(1)]
  normalized_value <- original_values

  for (row in 1:nrow(original_values)) {
    for (col in 1:ncol(original_values)) {
      if (original_values_t[row, 1] == 1) {
        current_min <- min_values[row]
        current_difference <- differences[row]
        normalized_value[row, col] <- (original_values[row, col] - current_min) / current_difference

      } else if (original_values_t[row, 1] == -1) {
        current_max <- max_values[row]
        current_neg_difference <- negative_differences[row]
        normalized_value[row, col] <- (original_values[row, col] - current_max) / current_neg_difference

      }
    }
  }
  # Weight normalizing:
  normalized_weight <- normalized_value

  for (row in 1:nrow(normalized_value)) {
    for (col in 1:ncol(normalized_value)) {
      current_value <- normalized_value[row, col]
      current_weight <- mabac_df[row, 2]
      normalized_weight[row, col] <- current_weight * (current_value + 1)
    }
  }
  #  Border Approximation Area:
  baa <- exp(rowMeans(log(normalized_weight)))

  # Matrix Q:
  alternative_dist_baa <- normalized_weight

  for (row in 1:nrow(normalized_weight)) {
    for (col in 1:ncol(normalized_weight)) {
      current_value <- normalized_weight[row, col]
      current_baa <- baa[row]
      alternative_dist_baa[row, col] <- current_value - current_baa
    }
  }
  # Ranking:
  column_sum <- as.data.frame(colSums(alternative_dist_baa))
  colnames(column_sum) <- c("Ranking")
  final_ranking <- column_sum[order(-column_sum$Ranking), , drop = FALSE]

  return(as.data.frame(final_ranking))

}
