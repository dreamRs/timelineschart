#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom htmlwidgets createWidget sizingPolicy
#'
#' @export
timelines <- function(data, line_height = 12, width = NULL, height = NULL, element_id = NULL) {

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
        domain = c(0, 1),
        discrete = FALSE,
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


