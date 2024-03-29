#' @title Proxy for `timelines`
#'
#' @description Proxy to interact with an existing [timelines()] chart in Shiny.
#'
#' @param shinyId single-element character vector indicating the output ID of the
#'   chart to modify (if invoked from a Shiny module, the namespace will be added
#'   automatically).
#' @param session the Shiny session object to which the chart belongs; usually the
#'   default value will suffice.
#'
#' @export
#' @importFrom shiny getDefaultReactiveDomain
timelines_proxy <- function(shinyId, session = shiny::getDefaultReactiveDomain()) {

  if (is.null(session)) {
    stop("timelinesProxy must be called from the server function of a Shiny app")
  }

  if (!is.null(session$ns) && nzchar(session$ns(NULL)) && substring(shinyId, 1, nchar(session$ns(""))) != session$ns("")) {
    shinyId <- session$ns(shinyId)
  }

  structure(
    list(
      session = session,
      id = shinyId,
      x = structure(list())
    ),
    class = "timelines_Proxy"
  )
}

#' Call a proxy method
#'
#' @param proxy  A \code{timelinesProxy} \code{htmlwidget} object.
#' @param name Proxy method.
#' @param ... Arguments passed to method.
#'
#' @return A \code{timelinesProxy} \code{htmlwidget} object.
#' @noRd
.timelines_proxy <- function(proxy, name, ...) {

  proxy$session$sendCustomMessage(
    type = sprintf("update-timelines-%s", name),
    message = list(id = proxy$id, data = list(...))
  )

  proxy
}
.timelines_proxy2 <- function(proxy, name, l) {

  proxy$session$sendCustomMessage(
    type = sprintf("update-timelines-%s", name),
    message = list(id = proxy$id, data = l)
  )

  proxy
}






#' Update data for \code{timelines-chart} with proxy
#'
#' @param timelines  A [timelines_proxy()] \code{proxy} object.
#' @param data A \code{data.frame}, see \code{\link{timelines}} for details.
#'
#' @export
#'
update_data <- function(timelines, data) {
  if (is.data.frame(data)) {
    if (!all(c("group", "label", "start", "end", "value") %in% names(data)))
      stop("data must contains columns: group, label, start, end, value", call. = FALSE)
    data <- parse_data(data)

  }
  .timelines_proxy(timelines, "data", newData = data)
}














