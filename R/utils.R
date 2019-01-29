
#' Utility function to create timelines-chart parameters JSON
#'
#' @param timelines A \code{timelines-chart} \code{htmlwidget} object.
#' @param name Slot's name to edit
#' @param ... Arguments for the slot
#'
#' @return A \code{timelines-chart} \code{htmlwidget} object.
#'
#' @importFrom utils modifyList
#'
#' @noRd
.timelines_opt <- function(timelines, name, ...) {

  if(!any(class(timelines) %in% c("timelines", "timelines_Proxy"))){
    stop("timelines must be a timelines or a timelinesProxy object")
  }

  if (is.null(timelines$x$options[[name]])) {
    timelines$x$options[[name]] <- list(...)
  } else {
    timelines$x$options[[name]] <- utils::modifyList(x = timelines$x$options[[name]], val = list(...), keep.null = TRUE)
  }

  return(timelines)
}

#' Utility function to create Billboard parameters JSON
#'
#' @param timelines A \code{timelines-chart} \code{htmlwidget} object.
#' @param name Slot's name to edit
#' @param l List of arguments for the slot
#'
#' @return A \code{timelines-chart} \code{htmlwidget} object.
#'
#' @noRd
.timelines_opt2 <- function(timelines, name, l) {

  if (is.null(timelines$x$options[[name]])) {
    timelines$x$options[[name]] <- l
  } else {
    timelines$x$options[[name]] <- utils::modifyList(x = timelines$x$options[[name]], val = l, keep.null = TRUE)
  }

  return(timelines)
}