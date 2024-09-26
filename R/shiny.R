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

#' Google login screen with a background image
#'
#' @param req
#' @param title
#' @param bg_image
#'
#' @return
#' @export
#'
#' @examples
#' # When calling shiny use...
#' # shinyApp(gar_shiny_ui(ui, login_ui = seq_google_login_screen()), server)
seq_google_login_screen <- function(req, title = "App Login", bg_image){
  login_screen <-  {
    shiny::addResourcePath("img", system.file("img", package = "googleAuthR"))
    shiny::addResourcePath("css", system.file("css", package = "googleAuthR"))
    shiny::fillPage(
      padding = 50,
      title = title,
      shiny::tags$head(shiny::tags$link(rel = "stylesheet",
                                        href = "css/button.css")),

      shiny::img(
        src = bg_image,
        style = '
        left: 50%;
        position: absolute;
        transform: translate(-50%, 0);
        overflow: hidden;
        top: 0;
        z-index: -1;
          height: 100%;
    width: 100%;'
      ),

      shiny::a(
        href = gar_shiny_auth_url(req),
        shiny::tags$button(class = "loginBtn loginBtn--google",
                           "Login with Google")
      )
    )
  }
}
