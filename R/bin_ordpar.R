#' Bin Primary Metric Data into Histogram Bins and Compute Secondary Metric
#'
#' This function can be used after the choose_lower function where the data
#' frame is ready to be disassembled and binned into fixed width containers
#' where the resulting data frame is a lower bound inclusive histogram that
#' can be easily organized and plotted
#'
#' @param df A data frame comsisting of a primary metric to be binned and a secondary to be computed
#' @param minval The minimum value of the primary metric determined via summary metrics
#' @param maxval The maximum value of the primary metric determined via summary metrics
#' @param increment The width/size of the histogram bin
#'
#' @return A data frame that is nicely sorted into bins according to primary metric
#'
#' @export
bin_ordpar <- function(df, minval, maxval, increment) {
  frames <- unique(unlist(df[,1]))
  histval <- seq(minval, maxval, by = increment)
  binned.vals <- data.frame()
  for (i in frames) {
    binned.vals <- rbind(binned.vals, as.data.frame.table(tapply(df[,4], cut(df[,3], histval), mean)))
  }
  binned.vals[is.na(binned.vals)] <- 0
  numbins <- ((nrow(binned.vals)) / (max(frames)))
  binned.vals$framenum <- rep(1:max(frames), each = numbins)
  bal <- abs(min(histval))
  binned.vals$upper <- rep(
    seq(
      (min(histval) + bal),
      (max(histval) + bal - increment),
      by = increment)
  )
  binned.vals <- binned.vals[, c(3, 4, 2)]
  return(binned.vals)
}
