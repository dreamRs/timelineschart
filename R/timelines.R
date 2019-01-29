#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom htmlwidgets createWidget
#'
#' @export
timelines <- function(message, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'timelines',
    x,
    width = width,
    height = height,
    package = 'timelineschart',
    elementId = elementId
  )
}


