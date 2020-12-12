
#' This functions adds the score of a given item set and a key set using the psych package
#'
#' @param df the dataframe to use
#' @param item_prefix the prefix common to all items. Data is selected using dplyr::starts_with
#' @param keys a keylist as used in the psych::scoreItems function
#'
# @import psych
# @import dplyr
# @import dataforsocialscience
# @importFrom glue glue
#' @return the data frame with an added column
#' @export
#'
# @examples
# keys <- list(KUT = c("KUT1", "-KUT2", "KUT3", "KUT4"))
# dataforsocialscience::robo_care_raw %>% add_scores("KUT", keys)
add_scores <- function(df, item_prefix, keys){
  raw_alpha <- NULL
  # printing
  cat(glue::glue("\n\nAdding scores for the {item_prefix} scale."))
  cat("\n\n===============================================================\n")
  cat(  "\n---------------------------------------------------Testing keys")

  # debugging
  #df <- robo_care_raw
  #item_prefix <- "KUT"

  data_set <- df %>%
    dplyr::select(dplyr::starts_with(item_prefix)) %>%
    dplyr::mutate_all(haven::zap_labels)

  suppressWarnings({
    res <- psych::alpha(x = data_set, keys = keys, check.keys = T)
  })

  summary(res)

  cat("\n------------------------------------------------Possible drops?\n")

  res$alpha.drop %>% dplyr::arrange(dplyr::desc(raw_alpha)) %>% print()
  cat("\n---------------------------------------------------Calculating scale\n")
  res <- psych::scoreItems(keys = keys, items = data_set, min = 1, max = 6)
  sco <- res$scores %>% dplyr::as_tibble()

  print(res)

  cat("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n")
  cat(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n")
  utils::flush.console()
  df %>% dplyr::bind_cols(sco)
}







if (FALSE) {
  library(dataforsocialscience)
  keys <- list(KUT = c("KUT1", "-KUT2", "KUT3", "KUT4"))
  res <- robo_care_raw  %>% add_scores("KUT", keys)

  }
