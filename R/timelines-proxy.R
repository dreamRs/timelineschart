#' Proxy for \code{timelines-chart}
#'
#' @param shinyId single-element character vector indicating the output ID of the
#'   chart to modify (if invoked from a Shiny module, the namespace will be added
#'   automatically).
#' @param session the Shiny session object to which the chart belongs; usually the
#'   default value will suffice.
#'
#' @export
#'
timelinesProxy <- function(shinyId, session = shiny::getDefaultReactiveDomain()) {

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
