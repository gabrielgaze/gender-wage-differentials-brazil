# A function that runs my linear model
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-06

my_linear_model <- function(model_data) {
  # runs my linear model
  #
  # ARGS:
  #   data - model_data
  #
  # Returns:
  #    A list with linear model reports
  
  LinModel <- survey::svyglm(lnwages ~ gender + age + age2 + ppi + 
                               working.hours + f_head +
                               private.sector + studying.years +
                               region + working.area + formal.worker, design = model_data, family = gaussian())
  
  return(LinModel)
}
