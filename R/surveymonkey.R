require(lubridate)
require(tidyverse)

#' Loads surveymonkey generated csv files that contain 2 line headers
#'
#' @param filename Character of the file location.
#'
#' @return raw data with a single header
#' @export
#'
# @examples
load_surveymonkey_csv <- function(filename) {
  .Deprecated(msg = "This function is deprecated and will be removed in the next release.")
  suppressWarnings(
    header <- readr::read_csv(filename, n_max = 1))
  suppressWarnings(
    raw <- readr::read_csv(filename, skip = 1)
  )
  col_names <- paste(names(header), names(raw))
  names(raw) <- col_names

  remove_nbsp <- function(text){
    gsub("\u00A0", " ", text, fixed = TRUE)
  }
  raw <- raw %>% dplyr::mutate_if(is.character,remove_nbsp)

  raw
}


#' Rename all variables by a character vector, but keep unnamed variables the same
#'
#' @param df The dataframe to rename
#' @param columnvector A vector of names
#'
#' @return A dataframe with renames columns
#' @export
#'
# @examples
name_variables <- function(df, columnvector) {
  .Deprecated(msg = "This function is deprecated and will be removed in the next release.")
  #oldnames <- names(df)
  l <- length(columnvector)
  names(df)[1:l] <- columnvector
  df
}



#' Add a survey response duration to surveymonkey data-frames.
#' Dataframes must contain a date_created and date_modified column.
#'
#' @param df Surveymonkey dataframe
#'
#' @return A dataframe with new column for survey duration
#' @export
#'
# @examples
add_survey_response_duration <- function(df){
  date_created <- date_modified <- newcreate <- newmodified <- modifieddate <- createdate <- NULL
  .Deprecated(msg = "This function is deprecated and will be removed in the next release.")
  if (!"date_created" %in% names(df)) {
    stop("Error: Dataframe must contain a column named `date_created`", call. = F)
  }
  if (!"date_modified" %in% names(df)) {
    stop("Error: Dataframe must contain a column named `date_modified`", call. = F)
  }


  df %>% dplyr::mutate(
    newcreate   = stringr::str_replace_all(date_created, pattern = "/", replacement = "-"),
    newmodified = stringr::str_replace_all(date_modified, pattern = "/", replacement = "-")) %>%
    dplyr::mutate(createdate   = lubridate::mdy_hms(newcreate),
           modifieddate = lubridate::mdy_hms(newmodified)) %>%
    dplyr::mutate(survey_duration = difftime(modifieddate, createdate, units = "secs"))
}


#' Generate a Code-Book from a surveymonkey data-frame
#'
#'
#' @param df Surveymonkey dataframe
#' @param filename Filename for the codebook (xls compatible format)
#'
#' @return nothing
#' @export
#'
# @examples
generate_codebook <- function(df, filename) {
  .Deprecated(msg = "This function is deprecated and will be removed in the next release.")
  text <- names(df)
  variable <- paste0("VAR",1:dim(df)[2])
  codebook <- tibble(variable, text)
  readr::write_delim(codebook, filename, delim = ";")
}

#' Read a codebook file for a surveymonkey dataframe
#'
#'
#' @param filename Filename for the codebook (xls compatible format)
#'
#' @return nothing
#' @export
#'
# @examples
read_codebook <- function(filename){
  .Deprecated(msg = "This function is deprecated and will be removed in the next release.")
  readr::read_delim(filename, delim = ";")
}


