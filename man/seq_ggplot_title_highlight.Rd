% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggplot.R
\name{seq_ggplot_title_highlight}
\alias{seq_ggplot_title_highlight}
\title{Formats text as an html span with the specified colour}
\usage{
seq_ggplot_title_highlight(text, colour)
}
\arguments{
\item{text}{a string}

\item{colour}{a hex code including the `#'}
}
\description{
Formats text as an html span with the specified colour
}
\examples{
mtcars |>
ggplot2::ggplot(ggplot2::aes(x = disp, y = hp)) +
  ggplot2::geom_line(linewidth = 1, colour = seq_palette$red) +
  seq_ggplot_minimal() +
  ggplot2::labs(title = glue::glue("My title about this {seq_ggplot_title_highlight('chart series', seq_palette$red)}"),
                subtitle = "What the actual definition of this chart might be",
                caption = "source: a source")

}
