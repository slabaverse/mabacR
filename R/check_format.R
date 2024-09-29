#' @title check_format()
#'
#' @description Verify if the database is correctly formatted
#'
#' @param mabac_df The original dataset to be validated
#'
#' @return TRUE if everything is correct or an error containing the explanatory message.
#'
#' @export
#'

check_format <- function(mabac_df) {
  mabac_df <- as.data.frame(mabac_df)
  tryCatch({
    if (missing(mabac_df)) stop("Dataframe is missing.")
    if (!is.data.frame(mabac_df)) stop("Input is not a dataframe.")
    if (is.null(mabac_df) ||nrow(mabac_df) < 2 ||ncol(mabac_df) < 5) stop("Dataframe must have at least 2 rows and 4 columns.")
    if (sum(mabac_df[, 2]) != 1) stop("The sum of the values in the second column (wheight) must be 1.")
    if (!all(as.numeric(mabac_df[, 3]) %in% c(1, -1))) stop("All values in the third column (type) must be either 1 or -1.")
    if (!all(sapply(mabac_df[, c(2, 4:ncol(mabac_df))], is.numeric))) stop("Columns: weight and items must be numeric.")
    return(TRUE)

  }, error = function(e) {
    message('An Error Occurred:')
    print(e$message)
    return(FALSE)

  }, warning = function(w) {
    message('A Warning Occurred:')
    print(w$message)
    return(NA)
  })

}
