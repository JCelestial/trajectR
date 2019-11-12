#' Filter the Lower Coordinate in a System with Multiple Measurements
#'
#' This function works on raw computed molecular systems where
#' there are several areas of interest measured for the same metric.
#' But, in order to avoid duplication of data, i.e. the system was
#' counted more than once as it contains several metrics, this function
#' picks out only one of those metrics that correpsonds to a secondary
#' metric to the users choosing
#'
#' @param ctrdf1 First data frame of the first metric type
#' @param ctrdf2 Second data frame of the first metric type
#' @param ordpar1 First data frame of the second metric type
#' @param ordpar2 Second data frame of th second metric type
#'
#' @return A data frame of the filtered secondary metric with respect to the first
#'
#' @export
choose_lower <- function(ctrdf1, ctrdf2, ordpar1, ordpar2) {
  zcomfilt <- cbind(ctrdf1[,1:2],
                    "zcom1" = ctrdf1[,5],
                    "ordpar1" = ordpar1[,3],
                    "zcom2" = ctrdf2[,5],
                    "ordpar2" = ordpar2[,3])
  lower.zcom <- data.frame()
  lower.ordpar <- data.frame()
  for (i in 1:nrow(zcomfilt)) {
    if (zcomfilt[[3]][[i]] < zcomfilt[[5]][[i]]) {
      lower.zcom <- rbind(lower.zcom, zcomfilt[[3]][[i]])
      lower.ordpar <- rbind(lower.ordpar, zcomfilt[[4]][[i]])
    }
    else {
      lower.zcom <- rbind(lower.zcom, zcomfilt[[5]][[i]])
      lower.ordpar <- rbind(lower.ordpar, zcomfilt[[6]][[i]])
    }
  }
  lower <- cbind(zcomfilt[,1:2], lower.zcom, lower.ordpar)
  colnames(lower) <- c("frames", "molID", "lower.zcom", "lower.ordpar")
  return(lower)
}
