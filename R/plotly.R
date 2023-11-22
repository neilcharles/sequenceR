seq_plotly_minimal <- function(plot, labels_colour = NA){

  if(is.na(labels_colour)) labels_colour <- seq_palette()$darkgrey

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
