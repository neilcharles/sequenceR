test_that("seq_ggplot_minimal() produces output", {
  expect_no_error(
    mtcars |>
      ggplot2::ggplot(ggplot2::aes(x = disp, y = hp)) +
      ggplot2::geom_line(linewidth = 1, colour = seq_palette$red) +
      seq_ggplot_minimal() +
      ggplot2::labs(title = "My title",
                    subtitle = "What the actual definition of this chart might be",
                    caption = "source: A source")
  )
})
