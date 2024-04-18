#' Apply minimal formatting to a plotly chart
#'
#' @param plot The plot to which formatting will be applied
#' @param labels_colour A colour to use for axis text. Defaults to seq_palette()$darkgrey
#'
#' @return A plotly plot
#' @export
#'
#' @examples
#' plotly::plot_ly() |>
#'   seq_plotly_minimal()
seq_plotly_minimal <- function(plot, labels_colour = NA){

  if(is.na(labels_colour)) labels_colour <- seq_palette$darkgrey

  plot <- plot |>
    plotly::layout(
      xaxis = list(
        title = list(font = list(color = labels_colour)),
        zeroline = FALSE,
        showline = FALSE,
        tickfont = list(
          color = labels_colour
        )
      ),
      yaxis = list(
        title = list(font = list(color = labels_colour)),
        zeroline = FALSE,
        showline = FALSE,
        tickfont = list(
          color = labels_colour
        )
      ),
      legend = list(x = 0, y = 100)
    )

  plot
}
