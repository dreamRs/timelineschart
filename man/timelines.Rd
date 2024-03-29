% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/timelines.R
\name{timelines}
\alias{timelines}
\title{Timelines chart}
\usage{
timelines(
  data,
  line_height = 12,
  width = NULL,
  height = NULL,
  element_id = NULL
)
}
\arguments{
\item{data}{A [data.frame()] (see details) or a list.}

\item{line_height}{Maximum height of each line, in px.}

\item{width, height}{Width and height for the widget.}

\item{element_id}{A custom id for the widget.}
}
\description{
Create timelines charts with JavaScript library [timelines-chart](https://github.com/vasturiano/timelines-chart).
}
\details{
Data format

If a [data.frame()] is used, it must contains the following columns:

 * group: Name of the group, used in left-side of the timelines chart.
 * label: Label for the line.
 * start: Start of the event.
 * end: End of the event.
 * value: Value to be represented, can be continuous or discrete.
}
