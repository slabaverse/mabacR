#' @title check_format()
#'
#' @description Verify if the database is correctly formatted
#'
#' @param mabac_df The original dataset to be validated
#' @param verbose Logical. If \code{TRUE}, messages about errors and warnings will be printed to the console.
#'
#' @return A list containing:
#' \item{status}{Logical, \code{TRUE} if the format is correct, \code{FALSE} if not.}
#' \item{message}{A message providing details about any format issues.}
#'
#'
#' @export
#'

check_format <- function(mabac_df, verbose = TRUE) {

  mabac_df <- as.data.frame(mabac_df)

  result <- list(status = TRUE, message = NULL)

  tryCatch({
    if (missing(mabac_df)) stop("Dataframe is missing.")
    if (!is.data.frame(mabac_df)) stop("Input is not a dataframe.")
    if (is.null(mabac_df) || nrow(mabac_df) < 2 || ncol(mabac_df) < 5)
      stop("Dataframe must have at least 2 rows and 4 columns.")
    if (sum(mabac_df[, 2]) != 1)
      stop("The sum of the values in the second column (weight) must be 1.")
    if (!all(as.numeric(mabac_df[, 3]) %in% c(1, -1)))
      stop("All values in the third column (type) must be either 1 or -1.")
    if (!all(sapply(mabac_df[, c(2, 4:ncol(mabac_df))], is.numeric)))
      stop("Columns: weight and items must be numeric.")

    return(result)

  }, error = function(e) {
    result$status <- FALSE
    result$message <- e$message
    if (verbose) message("An error occurred: ", e$message)
    return(result)

  }, warning = function(w) {
    result$status <- NA
    result$message <- w$message
    if (verbose) message("A warning occurred: ", w$message)
    return(result)
  })
}
