# A function that filters and structures data into a format accepted statistical analysis
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-05-27

model_data_formatter <- function(data) {
  # A function that filters and structures data for statistical analysis
  #
  # ARGS:
  #   data - PNADC raw survey
  #
  # Returns:
  #    A survey object ready to be used in oaxaca model
  

  tempD <- data %>%
    dplyr::filter(#VD4002 == 'Pessoas ocupadas',
                  #VD4007 == 'Empregado (inclusive trabalhador doméstico)')%>%
    dplyr::rename(#region = V1022,
                  #skin.color = V2010,
                  #education.degree = VD3004,
                  gender = V2007,
                  #studying.years = VD3005,
                  sector = VD4009,
                  #working.area = VD4010,
                  #working.hours = VD4013,
                  house_condition = VD2002,
                  wages = VD4016,
                  age = V2009,
                  formal.worker = VD4012) %>%
    dplyr::mutate(studying.years = base::as.numeric(base::as.character(forcats::fct_recode(studying.years,
                                                                                           '0' = 'Sem instrução e menos de 1 ano de estudo',
                                                                                           '1' = '1 ano de estudo',
                                                                                           '2' = '2 anos de estudo',
                                                                                           '3' = '3 anos de estudo',
                                                                                           '4' = '4 anos de estudo',
                                                                                           '5' = '5 anos de estudo',
                                                                                           '6' = '6 anos de estudo',
                                                                                           '7' = '7 anos de estudo',
                                                                                           '8' = '8 anos de estudo',
                                                                                           '9' = '9 anos de estudo',
                                                                                           '10' = '10 anos de estudo',
                                                                                           '11' = '11 anos de estudo',
                                                                                           '12' = '12 anos de estudo',
                                                                                           '13' = '13 anos de estudo',
                                                                                           '14' = '14 anos de estudo',
                                                                                           '15' = '15 anos de estudo',
                                                                                           '16' = '16 anos ou mais de estudo'
    ))),
    working.hours = base::as.numeric(base::as.character(forcats::fct_recode(working.hours,
                                                                            '14' = 'Até 14 horas',
                                                                            '27' = '15 a 39 horas',
                                                                            '42' = '40 a 44 horas',
                                                                            '46.5' = '45 a 48 horas',
                                                                            '49' = '49 horas ou mais'
    ))),
    private.sector = base::as.numeric(base::as.character(forcats::fct_recode(sector,
                                                                             '1' = 'Empregado no setor privado sem carteira de trabalho assinada',
                                                                             '1' = 'Empregado no setor privado com carteira de trabalho assinada',
                                                                             '0' = 'Militar e servidor estatutário',
                                                                             '0' = 'Empregado no setor público sem carteira de trabalho assinada',
                                                                             '1' = 'Trabalhador doméstico com carteira de trabalho assinada',
                                                                             '0' = 'Empregado no setor público com carteira de trabalho assinada',
                                                                             '1' = 'Trabalhador doméstico sem carteira de trabalho assinada'
                                                                             
    ))),
    lnwages = base::log(wages),
    age2 = age^2,
    ppi = dplyr::case_when(      
      skin.color == 'Preta' ~ 'PPI',
      skin.color == 'Parda' ~ 'PPI',
      skin.color == 'Indígena' ~ 'PPI',
      TRUE ~ 'Não PPI'),
    gender = dplyr::case_when(      
      gender == 'Feminino' ~ 'Mulher',
      gender == 'Masculino' ~ 'Homem',
      gender == 'Homem' ~ 'Homem',
      gender == 'Mulher' ~ 'Mulher'),
    f_head = dplyr::case_when(
      house_condition == 'Pessoa responsável' ~ 1,
      TRUE ~ 0
    ),
    region = dplyr::case_when(region == 'Urbana' ~ 0,
                              TRUE ~ 1
                              
    ),
    formal.worker = dplyr::case_when(formal.worker == 'Contribuinte' ~ 1,
                                     TRUE ~ 0),

    )
  return(tempD)
}
