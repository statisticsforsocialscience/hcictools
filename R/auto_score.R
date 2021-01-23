




#' This function automatically scores a set of items and creates a scale variable.
#' It detects inverse coding using the psych::alpha function.
#'
#' @param df a dataframe that contains an item set
#' @param prefix the prefix used in all items and also the name of the new scale.
#'
#' @return the dataframe with the new scale column
#' @export
# @import psych
# @importFrom dplyr select
# @import stringr
# @import dataforsocialscience
# @importFrom glue glue
#
#' @examples
#' \dontrun{
#' library(dataforsocialscience)
#' robo_care_raw %>% auto_score("KUT")
#' }
auto_score <- function(df, prefix) {
  #prefix <- "KUT"
  intermediate <- df %>%
    dplyr::select(dplyr::starts_with(prefix)) %>%
    dplyr::mutate_all(haven::zap_labels)

  #print(intermediate)
  res <- psych::alpha(x = intermediate, warnings = FALSE, check.keys = TRUE)

  #print(res)
  # generate fitting key list
  key_list <- res$keys %>%
    as.character() %>%
    stringr::str_sub(start = 1, end = -2) %>%
    paste0(names(res$keys)) %>% list()

  names(key_list) <- prefix

  add_scores(df, prefix, key_list)
}




if (FALSE) {
  dataforsocialscience::robo_care_raw %>% auto_score("CAMCON")
}

