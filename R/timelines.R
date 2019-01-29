#' Timelines chart
#'
#' @param data A \code{data.frame} (see details) or a list.
#' @param line_height Maximum height of each line, in px.
#' @param width,height Width and height for the widget.
#' @param element_id A custom id for the widget.
#'
#' @details Data format
#'
#' If a \code{data.frame} is used, it must contains the following columns:
#'
#' \describe{
#'   \item{group}{Name of the group, used in left-side of the timelines chart.}
#'   \item{label}{Label for the line.}
#'   \item{start}{Start of the event.}
#'   \item{end}{End of the event.}
#'   \item{value}{Value to be represented, can be continuous or discrete.}
#'  }
#'
#' @importFrom htmlwidgets createWidget sizingPolicy
#'
#' @export
timelines <- function(data, line_height = 12, width = NULL, height = NULL, element_id = NULL) {

  is_discrete <- FALSE
  domain <- c(0, 1)
  if (is.data.frame(data)) {
    if (!all(c("group", "label", "start", "end", "value") %in% names(data)))
      stop("data must contains columns: group, label, start, end, value", call. = FALSE)
    is_discrete <- !is.numeric(data$value)
    if (!is_discrete)
      domain <- range(pretty(range(data$value, na.rm = TRUE)))
    data <- parse_data(data)

  }

  config = list(
    data = data,
    options = list(
      maxLineHeight = line_height,
      margins = list(
        left = 90,
        right = 100,
        top = 26,
        bottom = 30
      ),
      scale = list(
        palette = "Viridis",
        domain = domain,
        discrete = is_discrete,
        data_label = "",
        label = ""
      ),
      time = list(
        useUtc = FALSE,
        format = "%Y-%m-%d %-I:%M:%S %p"
      )
    )
  )

  htmlwidgets::createWidget(
    name = 'timelines',
    x = config,
    width = width,
    height = height,
    package = 'timelineschart',
    elementId = element_id,
    sizingPolicy = sizingPolicy(
      defaultWidth = "100%",
      viewer.defaultHeight = "100%",
      viewer.defaultWidth = "100%",
      knitr.figure = FALSE,
      browser.fill = TRUE,
      padding = 10
    )
  )
}


