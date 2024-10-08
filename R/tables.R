#' Theme a gt table for Sequence Analytics
#'
#' @param gt_object
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
seq_gt_theme <- function (gt_object, ...)

  # Modified from gtextras NY Times
{
  stopifnot(
    `'gt_object' must be a 'gt_tbl', have you accidentally passed raw data?` = "gt_tbl" %in%
      class(gt_object)
  )

  gt_object |>
    gt::tab_options(
      heading.align = "left",
      column_labels.border.top.style = "none",
      table.border.top.style = "none",
      column_labels.border.bottom.style = "none",
      column_labels.border.bottom.width = 1,
      column_labels.border.bottom.color = "#334422",
      table_body.border.top.style = "none",
      table_body.border.bottom.color = "white",
      heading.border.bottom.style = "none",
      data_row.padding = gt::px(7),
      column_labels.font.size = gt::px(12),
    ...
  ) |>
  gt::tab_style(
    style = gt::cell_text(
      color = seq_palette$darkgrey,
      font = gt::google_font("Nunito Sans"),
      transform = "uppercase"
    ),
    locations = gt::cells_column_labels(everything())
  ) |>
    gt::tab_style(
    style = gt::cell_text(font = gt::google_font("Nunito Sans"), weight = 800),
    locations = gt::cells_title(groups = "title")
  ) |>
    gt::tab_style(style = gt::cell_text(font = gt::google_font("Nunito Sans"), weight = 400),
              locations = gt::cells_body())
}
