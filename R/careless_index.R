#' Detect careless responses
#'
#' A function to detect careless survey responses using the careless package.
#' The function has the improvement to first remove speeders, because they
#' negatively affect the metrics used in the careless package.
#'
#'
#' @param dat A data.frame that contains the survey data.
#' @param speeder_analysis A criterion to test against speeders. The
#' speeder_analysis parameter can be one of the following: median,
#' median/2 (default), median/3, or a numeric value that is directly used
#' as a threshold. Using FALSE will ignore speeder analysis.
#' @param likert_vector A vector of indices that should be analyzed.
#' @param duration_column A string that contains the name of the column that
#' has the duration of survey responses. As a default we use
#' Duration (in seconds), which is used by Qualtrix.
#' @param id_column A string that contains the name of a id column. As a default
#' we use "ResponseId", which is used by Qualtrix.
#' @param antonyms Whether or not to test for psychometric antonyms (default: T)
#' @param critval_ant Threshold for antonym analysis (default: -0.6)
#' @param synonyms Whether or not to test for psychometric synonyms (default: T)
#' @param critval_syn Threshold for synonym analysis (default: -0.6)
#' @param mahaD Whether or not to test for mahalanobis distance with confidence of 0.99. (default: T)
#'
#' @return Returns an updated dataframe containing indices
#' @export
#'
# @examples
careless_indices <- function(dat,
                             speeder_analysis = F,
                             likert_vector = NULL,
                             duration_column = "Duration (in seconds)",
                             id_column = "ResponseId",
                             antonyms = TRUE,
                             critval_ant = -0.6,
                             synonyms = TRUE,
                             critval_syn = 0.6,
                             mahaD = TRUE)  {


  stopifnot("speeder_analysis must be either \"median\", \"median/2\",\"median/3\", FALSE, or a numeric value." =
              {
                !(!isFALSE(speeder_analysis) &&
                  !is.character(speeder_analysis) &&
                     (substr(speeder_analysis, 1,7) == "median/" &&
                          numbers_only(substr(speeder_analysis, 8))) &&
                       !is.numeric(speeder_analysis))
  })


    id <- id_column
    data.quality <- dat
    # First to speeder analysis
    if (!isFALSE(speeder_analysis)) {
      if (is.numeric(speeder_analysis)) {
        speedlimit <- speeder_analysis
      } else{
        speedercondition <- strsplit(speeder_analysis, "/")
        speedlimit <-
          stats::median(dat[[duration_column]]) / as.numeric(speedercondition[[1]][2])
      }
      dat$careless_speeder <-
        ifelse(dat[[duration_column]] > speedlimit, FALSE, TRUE)
      data.quality <- dat[which(dat$careless_speeder == FALSE), ]
    }
    # data.quality contains now a filtered list. Further analysis is only performed on non-speeders

    quality.indices <-
      data.frame(ResponseId = data.quality[[id]])
    names(quality.indices)[names(quality.indices) == "ResponseId"] <- id

    if (!is.null(likert_vector)) {
      # This works with speeders ----
      # TODO: provide sensible error message if not all vectors can be numerics
      df_likerts_numeric <- dplyr::mutate_all(dat[, likert_vector], as.numeric)

      # add longstrings to data frame
      temp <- careless::longstring(df_likerts_numeric, avg = T)
      dat$careless_longstr <- temp$longstr
      dat$careless_avgstr <- temp$avgstr

      # add inter response variability
      dat$careless_irv <- careless::irv(df_likerts_numeric)


      # This (sensibly) works only without speeders ----
      if (synonyms) {
        tryCatch(quality.indices$careless_psychsyn <-
              careless::psychsyn(df_likerts_numeric, critval = critval_syn),
              error = function(e) {
                warning(e)
              })
      }
      if (antonyms) {
        tryCatch(quality.indices$careless_psychant <-
              careless::psychsyn(df_likerts_numeric, critval = -0.6, anto = T),
              error = function(e) { warning(e) })
      }
      if (mahaD) {
        temp <-
          careless::mahad(
            df_likerts_numeric,
            flag = TRUE,
            confidence = 0.99,
            na.rm = TRUE,
            plot = FALSE
          )
        quality.indices$careless_mahadD <- temp$d_sq
        quality.indices$careless_mahadflag <- temp$flagged
      }
    }

    # join by merging, TODO needs testing
    res <- merge(x = dat,
                 y = quality.indices,
                 by = id_column,
                 all.x = TRUE)
    res
}


#' Tests if a vector of strings can be a numeric
#'
#' @param x a vector of strings
#'
#' @return Returns a vector of booleans
# @export
numbers_only <- function(x) {
  !grepl("^[A-Za-z]+$", as.character(x), perl = T)
  }
