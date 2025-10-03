# A function that runs Ñopo model
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-06

oaxaca_model <- function(oaxaca_data_unit) {
  # runs Ñopo model
  #
  # ARGS:
  #   data - oaxaca model dataframe
  #
  # Returns:
  #    A list with oaxaca model reports
  
  s01 <- decr::nopodec_mean(oaxaca_data_unit)
  
  
  n01_AB <- nopodec(s01, 
                    counterfactual = "AB")
  
  
#  bootstrap <- decr::boot_nopodec_mean(
#    data = oaxaca_data,
#    treatment = "gender", 
#    variables = c('age',
#                  'age2',
#                  'ppi',
#                  'working.hours',
#                  'f_head',
#                  'private.sector',
#                  'working.area',
#                  'studying.years',
#                  'region',
#                  'formal.worker'),
#    y = "lnwages", 
#    weights = "V1032", 
#    R = 10)
  
  return(base::list(s01, 
                    n01_AB))#, 
                    #bootstrap))
}
