#' Access the Sequence colour palette
#'
#' @return A named list of colours
#' @export
#'
#' @examples
#' seq_palette()
seq_palette <- function(){
  list(red = "#d92344",
    light_grey = "#d7d7d9",
    blue = "#0568a6",
    green = "#52bd6f",
    yellow = "#f2b705",
    darkgrey = "#636369",
    white = "#ffffff")
}

seq_heatcolours <- function(){
  c(seq_palette()$blue, seq_palette()$green, seq_palette()$yellow, seq_palette()$red)
}

#' Get a heat colour ramp
#'
#' @param n Number of colours to return
#'
#' @return A vector of hex codes
#' @export
#'
#' @examples
#' seq_heatscale(12)
seq_heatscale <- function(n = 10){
  colorRampPalette(seq_heatcolours())(n)
}
