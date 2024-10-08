#' Adds a 'Current Period', 'Previous Period', 'Last Year' column toa table containing dates
#'
#' @param data
#' @param end_date
#' @param window_length
#' @param periodicity
#' @param date_col
#' @param drop_na
#'
#' @return
#' @export
#'
#' @examples
seq_add_period_column <- function(data, end_date, window_length = 7, periodicity = "day", date_col = "date", drop_na = TRUE){

  end_date <- lubridate::as_date(end_date)

  newcol <- data |>
    dplyr::mutate(period_label = ifelse(!!rlang::sym("date") <= end_date & !!rlang::sym("date") > end_date - window_length, "Current Period", NA)) |>
    dplyr::mutate(period_label = ifelse(!!rlang::sym("date") <= end_date - window_length & !!rlang::sym("date") > end_date - window_length * 2, "Previous Period", period_label)) |>
    dplyr::mutate(period_label = ifelse(!!rlang::sym("date") <= end_date - lubridate::years(1) & !!rlang::sym("date") > end_date - lubridate::years(1) - window_length, "Previous Year", period_label))

  if(drop_na){
    newcol <- newcol |>
      dplyr::filter(!is.na(period_label))
  }
  newcol
}

#' Converts a KPI table into period on period and year on year comparisons
#'
#' @param data
#' @param date_last
#' @param date_window_length
#'
#' @return
#' @export
#'
#' @examples
seq_difference_table <- function(data, date_last, date_window_length){

  date_last <- lubridate::as_date(date_last)

  data_formatted <- data |>
    dplyr::group_by(sessionDefaultChannelGroup) |>
    seq_add_period_column(end_date = date_last) |>
    dplyr::group_by(sessionDefaultChannelGroup, period_label) |>
    dplyr::arrange(date) |>
    dplyr::summarise(sessions = sum(sessions)) |>
    tidyr::pivot_wider(names_from = period_label,
                values_from = sessions,
                values_fill = 0) |>
    dplyr::arrange(-`Current Period`) |>
    dplyr::ungroup() |>
    dplyr::mutate(`Proportion of Current Total` = `Current Period` / sum(`Current Period`)) |>
    # select(sessionDefaultChannelGroup, sessions, sessions_pct, timeline) |>
    dplyr::mutate(`Change vs. Previous Period` = `Current Period` / `Previous Period` -1,
           `Change vs. Previous Year` = `Current Period` / `Previous Year` -1,)

}
