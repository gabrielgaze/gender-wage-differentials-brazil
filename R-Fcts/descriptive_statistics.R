# A function that calculates statistics values
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-06

descriptive_statistics <- function(model_data) {
  # A function that calculates statistics values
  #
  # ARGS:
  #   data - model data 
  #
  # Returns:
  #    3 descriptive statistics tables in a list
  
  dist_homens_mulheres <- model_data %>%
    dplyr::group_by(gender) %>%
    dplyr::summarise(freq = srvyr::survey_mean(studying.years,
                                               na.rm = T))
  
#  estatistica_descritiva <- model_data %>%
#    dplyr::group_by(gender) %>%
#    dplyr::summarise(wage_mean = srvyr::survey_mean(wages, 
#                                                    na.rm = T),
#                     wage_median = srvyr::survey_median(wages,
#                                                        na.rm = T),
#                     wage_sd = srvyr::survey_sd(wages,
#                                                na.rm = T))
  
  
#  estatistica_descritiva_2 <- model_data %>%
#    dplyr::group_by(gender, studying.years) %>%
#    dplyr::summarise(wage_mean = srvyr::survey_mean(wages, 
#                                                    na.rm = T))
  
#  part_merc_trab <- model_data %>%
#    dplyr::group_by(gender) %>%
#    dplyr::summarise(freq = srvyr::survey_total())
  
#  sal_por_idade <- model_data %>%
#    dplyr::group_by(gender, age) %>%
#    dplyr::summarise(tryCatch(
#      survey_mean(wages, na.rm = T),
#      error = function(e) NA
#    ))
  
#  media_salarial_por_setor <- model_data %>%
#    dplyr::group_by(working.area) %>%
#    dplyr::summarise(wage_mean = srvyr::survey_mean(wages, 
#                                                    na.rm = T))
  
#  media_salarial_ppi <- model_data %>%
#    dplyr::group_by(gender, ppi) %>%
#    dplyr::summarise(wage_mean = srvyr::survey_mean(wages, 
#                                                    na.rm = T))

  return(base::list(dist_homens_mulheres)) #estatistica_descritiva, estatistica_descritiva_2, part_merc_trab, sal_por_idade, media_salarial_por_setor, media_salarial_ppi))
}
