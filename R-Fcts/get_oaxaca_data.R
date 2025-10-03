# A function which transforms model_data in a dataframe ready to Ñopo model
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-06

get_oaxaca_data <- function(model_data){     
  # transforms model_data in a dataframe ready to Ñopo model
  # ARGS:
  #   model_data - a survey object
  #   
  # Returns: 
  #   a dataframe ready to Ñopo model 
  oaxaca_data <- model_data[['variables']] %>%
    dplyr::select('gender',
                  'age',
                  'age2',
                  'ppi',
                  'working.hours',
                  'f_head',
                  'private.sector',
                  'working.area',
                  'studying.years',
                  'region',
                  'formal.worker',
                  'lnwages',
                  'V1032') %>%
    dplyr::arrange(gender) %>%
    stats::na.omit()%>% 
    decr::reweight_strata_all2(
      treatment = "gender", 
      variables = c('age',
                    'age2',
                    'ppi',
                    'working.hours',
                    'f_head',
                    'private.sector',
                    'working.area',
                    'studying.years',
                    'region',
                    'formal.worker'),
      y = "lnwages", 
      weights = "V1032")
  
  return(oaxaca_data)
}
