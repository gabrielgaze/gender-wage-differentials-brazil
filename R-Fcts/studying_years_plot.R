# A function that builds graphs of years of study
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-05

studying_years_plot <- function(stats) {
  # builds graphs of years of study
  #
  # ARGS:
  #   data - a list with model_data for 1 year
  #
  # Returns:
  #    Studying years plot
  
  p <- stats[[3]] %>%
    ggplot2::ggplot(ggplot2::aes(x = studying.years, 
                                 y = wage_mean, 
                                 color = gender)) +
    ggplot2::geom_line(linewidth = 1.25) +
    ggplot2::labs(x = 'Anos de estudo',
                  y = 'Média salarial', 
                  color = 'Gênero') +
    ggplot2::scale_color_manual(values = c('Homem' = 'deepskyblue', 'Mulher' = 'deeppink')) +
    ggplot2::facet_wrap(~ppi,      
                        scales = 'free') +   
    ggplot2::theme_bw()
  
  
  return(p)
}
