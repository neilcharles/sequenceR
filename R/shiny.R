#' Sets a Sequence theme for bslib
#'
#' @return bslib theme
#' @export
#'
#' @examples
#' # within app ui...
#' # theme = seq_shiny_bslib_theme()
seq_shiny_bslib_theme <- function(){
  bslib::bs_theme(
    version = 5,
    fg = "rgb(99, 99, 105)",
    primary = seq_palette$blue,
    secondary = seq_palette$darkgrey,
    success = seq_palette$green,
    info = seq_palette$darkgrey,
    warning = seq_palette$yellow,
    danger = seq_palette$red,
    base_font = bslib::font_google("Nunito Sans"),
    heading_font = bslib::font_google("Nunito Sans"),
    font_scale = 0.8,
    `enable-rounded` = FALSE,
    preset = "cosmo",
    bg = "#fff"
  )
}

