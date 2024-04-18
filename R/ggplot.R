#' Standard Sequence formatting for a plotly chart
#'
#' @return
#' @export
#'
#' @examples
#' mtcars |>
#' ggplot2::ggplot(ggplot2::aes(x = disp, y = hp)) +
#'   ggplot2::geom_line() +
#'   seq_ggplot_minimal() +
#'   ggplot2::labs(title = "Title",
#'                 subtitle = "Subtitle",
#'                 caption = "source: a source")
#'
seq_ggplot_minimal <- function(){

  ggplot2::theme_minimal() +
    ggplot2::theme(
      axis.title.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor.x = ggplot2::element_blank(),
      axis.text = ggplot2::element_text(colour = seq_palette$lightgrey),
      axis.text.x = ggplot2::element_text(size = 15),
      axis.text.y = ggplot2::element_text(size = 15),
      plot.title = ggtext::element_markdown(hjust = 0, vjust = 1, size = 30), # Left align title
      plot.subtitle = ggplot2::element_text(hjust = 0, vjust = 1, size = 15, colour = seq_palette$lightgrey), # Left align subtitle
      plot.title.position = "plot",
      plot.caption.position = "plot",
      plot.margin = ggplot2::margin(t = 10, r = 10, b = 10, l = 10), # Adjust bottom margin to increase space
      plot.caption = ggplot2::element_text(hjust = 1, size = 15,
                                           margin = ggplot2::margin(t = 15, b = 0),
                                           colour = seq_palette$lightgrey) # Adjust top margin of caption
    )

}

#' Formats text as an html span with the specified colour
#'
#' @param text a string
#' @param colour a hex code including the `#'
#'
#' @return
#' @export
#'
#' @examples
#' mtcars |>
#' ggplot2::ggplot(ggplot2::aes(x = disp, y = hp)) +
#'   ggplot2::geom_line(linewidth = 1, colour = seq_palette$red) +
#'   seq_ggplot_minimal() +
#'   ggplot2::labs(title = glue::glue("My title about this {seq_ggplot_title_highlight('chart series', seq_palette$red)}"),
#'                 subtitle = "What the actual definition of this chart might be",
#'                 caption = "source: a source")
#'
seq_ggplot_title_highlight <- function(text, colour){
  glue::glue("<span style = 'color: {colour};'>{text}</span>")
}
