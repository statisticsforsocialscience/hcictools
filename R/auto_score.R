
#' This functions adds the score of a given item set and a key set using the psych package
#'
#' @param df the dataframe to use
#' @param item_prefix the prefix common to all items. Data is selected using dplyr::starts_with
#' @param keys a keylist as used in the psych::scoreItems function
#'
#' @import psych
#' @import dplyr
#' @import dataforsocialscience
#' @return the data frame with an added column
#' @export
#'
# @examples
# keys <- list(KUT = c("KUT1", "-KUT2", "KUT3", "KUT4"))
# dataforsocialscience::robo_care_raw %>% add_scores("KUT", keys)
add_scores <- function(df, item_prefix, keys){
  raw_alpha <- NULL
  # printing
  cat("\n\n============================================================\n")
  cat(glue::glue("Adding scores for the {item_prefix} scale.\n\n"))
  cat("============================================================\n\n")
  cat("--Testing keys...\n")
  #df <- robo_care_raw
  #item_prefix <- "KUT"

  res <- df %>% dplyr::select(starts_with(item_prefix)) %>%
    psych::alpha(keys = keys, title = item_prefix, check.keys = T)
  summary(res)
  cat("--Possible drops?\n")
  res$alpha.drop %>% arrange(desc(raw_alpha)) %>% print()
  cat("============================================================\n")
  cat("--Calculating scale\n")
  res <- df %>% select(starts_with(item_prefix)) %>%
    mutate_all(as.numeric) %>%
    scoreItems(keys, ., min = 1, max = 6)
  sco <- res$scores %>% as_tibble()


  print(res)

  cat("\n\n+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n\n")
  utils::flush.console()
  df %>% bind_cols(sco)
}




#' This function automatically scores a set of items and creates a scale variable.
#' It detects inverse coding using the psych::alpha function.
#'
#' @param df a dataframe that contains an item set
#' @param prefix the prefix used in all items and also the name of the new scale.
#'
#' @return the dataframe with the new scale column
#' @export
#'
# @examples
# library(dataforsocialscience)
# robo_care_raw %>% auto_score("KUT")
auto_score <- function(df, prefix) {
  #prefix <- "KUT"
  res <- df %>% dplyr::select(dplyr::starts_with(prefix)) %>%
    dplyr::mutate_all(haven::as_factor) %>%
    psych::alpha(title = prefix, warnings = FALSE, check.keys = TRUE)

  # generate fitting key list
  key_list <- res$keys %>%
    as.character() %>%
    stringr::str_sub(start = 1, end = -2) %>%
    paste0(names(res$keys)) %>% list()

  names(key_list) <- prefix

  add_scores(df, prefix, key_list)
}




if (FALSE) {
  library(psych)
  keys <- list(KUT = c("KUT1", "-KUT2", "KUT3", "KUT4"))
  robo_care_raw %>% add_scores("KUT", keys)

  robo_care_labelled <- robo_care_raw %>% auto_score("KUT") %>%
    auto_score("DIFFPREF") %>%
    auto_score("TK") %>%
    auto_score("PRIVCON") %>%
    auto_score("AUTOT") %>%
    auto_score("CAREX") %>%
    auto_score("CAMCON")
}

