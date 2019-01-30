
#' Set margins for \code{timelines-chart}
#'
#' @param timelines A \code{timelines-chart} \code{htmlwidget} object.
#' @param left Chart's left margin, which contains the left-side group axis labels.
#' @param right Chart's right margin, which contains the right-side series axis labels.
#' @param bottom Chart's top margin, which contains the color legend.
#' @param top Chart's bottom margin, which contains the time axis labels.
#'
#' @export
#'
set_margins <- function(timelines, left = 90, right = 100, bottom = 26, top = 30) {
  .timelines_opt(
    timelines, "margins",
    left = left,
    right = right,
    bottom = bottom,
    top = top
  )
}


#' Set scale for \code{timelines-chart}
#'
#' @param timelines A \code{timelines-chart} \code{htmlwidget} object.
#' @param palette Color palette to use for continuous or colors vector.
#' @param domain Range of values for continuous data.
#' @param discrete Whether the segment data color values are categorical (false) or continuouss (true).
#' @param data_label Units of z data. Used in the tooltip descriptions.
#' @param label Color scale label. Only applicable to quantitative z scales.
#'
#' @export
#'
set_scale <- function(timelines, palette = "Viridis", domain = NULL, discrete = NULL, data_label = NULL, label = NULL) {
  if (!is.null(names(palette))) {
    domain <- names(palette)
    palette <- unlist(unname(palette))
  }
  .timelines_opt2(
    timelines, "scale",
    l = dropNulls(list(
      discrete = discrete,
      palette = palette,
      domain = domain,
      data_label = data_label,
      label = label
    ))
  )
}


#' Set time options for \code{timelines-chart}
#'
#' @param timelines A \code{timelines-chart} \code{htmlwidget} object.
#' @param use_utc Whether to display time in the local time zone (false) or in UTC (true).
#' @param format Time format to use in tooltips. See \href{https://github.com/d3/d3-time-format#locale_format}{d3-time-format} for available options.
#'
#' @export
#'
set_time <- function(timelines, use_utc = FALSE, format = "%Y-%m-%d %-I:%M:%S %p") {
  .timelines_opt(
    timelines, "time",
    useUTC = use_utc,
    format = format
  )
}




#' Set overview options for \code{timelines-chart}
#'
#' @param timelines A \code{timelines-chart} \code{htmlwidget} object.
#' @param enable Whether to show an interactive timeline overview below the chart.
#' @param domain The time extent shown in the overview section below the chart.
#'
#' @export
#'
set_overview <- function(timelines, enable = TRUE, domain = NULL) {
  .timelines_opt(
    timelines, "overview",
    enable = enable,
    domain = domain
  )
}



#' Set zoom for \code{timelines-chart}
#'
#' @param timelines A \code{timelines-chart} \code{htmlwidget} object.
#' @param x Chart's time (horizontal) zoom. A null value indicates a zoom reset to full extent.
#' @param y Chart's vertical zoom. The parameter should follow the syntax \code{c("<start row index>", "<end row index>")}.
#'  A null value indicates a zoom reset to full extent.
#'
#' @export
#'
set_zoom <- function(timelines, x = NULL, y = NULL) {
  .timelines_opt2(
    timelines, "zoom",
    l = dropNulls(list(
      x = x,
      y = y
    ))
  )
}

