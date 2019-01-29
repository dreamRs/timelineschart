
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
  .timelines_opt(
    timevis, "margins",
    left = left,
    right = right,
    bottom = bottom,
    top = top
  )
}


#' Set scale for \code{timelines-chart}
#'
#' @param timevis A \code{timelines-chart} \code{htmlwidget} object.
#' @param discrete Whether the segment data color values are categorical (false) or continuouss (true).
#' @param palette Color palette to use for continuous or colors vector.
#' @param domain Range of values for continuous data.
#' @param data_label Units of z data. Used in the tooltip descriptions.
#' @param label Color scale label. Only applicable to quantitative z scales.
#'
#' @export
#'
set_scale <- function(timevis, discrete = FALSE, palette = "Viridis", domain = c(0, 1), data_label = "", label = "") {
  .timelines_opt(
    timevis, "scale",
    discrete = discrete,
    palette = palette,
    domain = domain,
    data_label = data_label,
    label = label
  )
}


