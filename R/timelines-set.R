
#' Set margins for \code{timelines-chart}
#'
#' @param timevis A \code{timelines-chart} \code{htmlwidget} object.
#' @param left Chart's left margin, which contains the left-side group axis labels.
#' @param right Chart's right margin, which contains the right-side series axis labels.
#' @param bottom Chart's top margin, which contains the color legend.
#' @param top Chart's bottom margin, which contains the time axis labels.
#'
#' @export
#'
set_margins <- function(timevis, left = 90, right = 100, bottom = 26, top = 30) {
  .timelines_opt(timevis, "margins", left = left, right = right, bottom = bottom, top = top)
}


