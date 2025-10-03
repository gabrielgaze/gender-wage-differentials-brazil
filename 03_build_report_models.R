# This script runs the models and saves the results
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-05

# importing data

my_dir <- base::paste0(dirname(rstudioapi::getActiveDocumentContext()$path),'/data/PNADC_structured_model_data/model_data.rds')

model_data <- base::readRDS(file = my_dir)

# descriptive statistics for wages ----------

descriptive_statistics <- purrr::map(.x = model_data, 
                                     .f = descriptive_statistics)

first_last_years <- descriptive_statistics[c(1, length(descriptive_statistics))]

all_pnadc_names <- names(model_data)
  
# Table 1

wage_mean_yearly <- yearly_df_maker(data_list = descriptive_statistics, 
                                    idx = 2)

p1 <- wage_mean_yearly %>%
  ggplot2::ggplot(ggplot2::aes(x = Year,
                               y = wage_mean,
                               color = gender)) +
  ggplot2::geom_line(linewidth = 1.25) +
  ggplot2::theme_bw() +
  ggplot2::labs(x = 'Ano',
                y = 'Média salarial', 
                color = 'Gênero') +
  ggplot2::scale_color_manual(values = c('Homem' = 'deepskyblue', 'Mulher' = 'deeppink')) 

ggplot2::ggsave(filename = 'figs/Wage_mean_yearly_plot.png',
                dpi = 900)

wage_descriptive_table <- wage_mean_yearly %>%
  dplyr::select('Year',
                'gender',
                'wage_mean',
                'wage_median',
                'wage_sd') %>%
  tidyr::pivot_wider(names_from = 'gender', 
                     values_from = c('wage_mean', 
                                     'wage_median', 
                                     'wage_sd')) %>%
  dplyr::rename('Ano' = 'Year',
                'Média masculina' = 'wage_mean_Homem',
                'Mediana masculina' = 'wage_median_Homem',
                'Desvio padrão masculino' = 'wage_sd_Homem',
                'Média feminina' = 'wage_mean_Mulher',
                'Mediana feminina' = 'wage_median_Mulher',
                'Desvio padrão feminino' = 'wage_sd_Mulher') %>%
  xtable::xtable(label = 'Estatística descritiva dos salários', 
                 caption = 'Elaboração própria. Dados da PNADC')

print(wage_descriptive_table,                            
      include.rownames = FALSE, 
      file = 'tables/Wage_descriptive_table.html', 
      type = 'html')

writexl::write_xlsx(x = wage_descriptive_table, path = "wage_desc.xlsx")

# table 2

freq_yearly <- yearly_df_maker(data_list = descriptive_statistics,
                               idx = 1) %>%
  dplyr::select(-freq_se) %>%
  tidyr::pivot_wider(names_from = c('gender', 
                                    'Year'),
                     values_from = c('freq')) %>%
  dplyr::mutate(`Mulher_2015` = base::paste0(as.character(round(`Mulher_2015`/(`Mulher_2015` + `Homem_2015`),4)*100), '%'),
                `Mulher_2016` = base::paste0(as.character(round(`Mulher_2016`/(`Mulher_2016` + `Homem_2016`),4)*100), '%'),
                `Mulher_2017` = base::paste0(as.character(round(`Mulher_2017`/(`Mulher_2017` + `Homem_2015`),4)*100), '%'),
                `Mulher_2018` = base::paste0(as.character(round(`Mulher_2018`/(`Mulher_2018` + `Homem_2015`),4)*100), '%'),
                `Mulher_2019` = base::paste0(as.character(round(`Mulher_2019`/(`Mulher_2019` + `Homem_2015`),4)*100), '%'),
                `Mulher_2022` = base::paste0(as.character(round(`Mulher_2022`/(`Mulher_2022` + `Homem_2015`),4)*100), '%'),
                `Mulher_2023` = base::paste0(as.character(round(`Mulher_2023`/(`Mulher_2023` + `Homem_2023`),4)*100), '%')) %>%
  dplyr::rename('Área de atuação' = 'working.area',
                '2015' = "Mulher_2015",
                '2016' = "Mulher_2016",
                '2017' = "Mulher_2017",
                '2018' = "Mulher_2018",
                '2019' = "Mulher_2019",
                '2022' = "Mulher_2022",
                '2023' = "Mulher_2023") %>%
  xtable::xtable(label = 'Participação na força de trabalho', 
                 caption = 'Elaboração própria. Dados da PNADC') %>%
  select(-Homem_2015, -Homem_2016, -Homem_2017, -Homem_2018, -Homem_2019, -Homem_2022, - Homem_2023)

print(freq_yearly,                            
      include.rownames = FALSE, 
      file = 'tables/freq.html', 
      type = 'html')

writexl::write_xlsx(x = freq_yearly, path = 'tables/participacao_por_setor.xlsx')

# TABELA ESCOLARIDADE

escol <- yearly_df_maker(data_list = descriptive_statistics, idx = 3) %>%
  dplyr::select(-wage_mean_se) %>%
  tidyr::pivot_wider(names_from = 'gender', values_from = wage_mean)

writexl::write_xlsx(x = escol, path = 'tables/escolaridade.xlsx')

# TABELA PARTICIPAÇÃO NO MERCADO DE TRABALHO

part <- yearly_df_maker(data_list = descriptive_statistics, idx = 4) %>%
  dplyr::select(-freq_se) %>%
  tidyr::pivot_wider(names_from = c('gender'),
                     values_from = 'freq') %>%
  dplyr::mutate(part_masc = Homem/(Mulher + Homem),
                part_fem = Mulher/(Homem + Mulher)) %>%
  dplyr::select('Year', 'part_masc', 'part_fem')

writexl::write_xlsx(x = part, path = 'tables/participacao_no_merc_de_trabalho.xlsx')


# TABELA POR IDADE
idade <-  yearly_df_maker(data_list = descriptive_statistics, idx = 5) %>%
  dplyr::select(-`_se`) %>%
  tidyr::pivot_wider(names_from = 'gender', values_from = 'coef')

writexl::write_xlsx(x = idade, path = 'tables/idade.xlsx')

# TABELA POR AREA DE TRABALHO

setor <- yearly_df_maker(data_list = descriptive_statistics, idx = 6) %>%
  dplyr::select(-wage_mean_se) %>%
  tidyr::pivot_wider(names_from = 'Year', values_from = 'wage_mean')

writexl::write_xlsx(x = setor,  path = 'tables/setor.xlsx')

# TABELA POR PPI

ppi <- yearly_df_maker(data_list = descriptive_statistics, idx = 7) %>%
  dplyr::select(-wage_mean_se) %>%
  tidyr::pivot_wider(names_from = c('gender', 'ppi'), 
                     values_from = 'wage_mean')

writexl::write_xlsx(x = ppi, path = 'tables/ppi.xlsx')

# wages x ppi plot 

p2 <- purrr::map(.x = first_last_years, 
                 .f = studying_years_plot)
for (i in base::names(p2)) {
  ggplot2::ggsave(plot = p2[[i]],
                  filename = base::paste0('figs/Studying_years_plot_', i, '.png'),
                  dpi = 900)
}

# linear model -------------

LinModel <- purrr::map(.x = model_data,
                       .f = my_linear_model)

est_table <- texreg::htmlreg(l = LinModel[names(LinModel)], 
                             custom.model.names = stringi::stri_sub(str = all_pnadc_names,
                                                                    from = 7, 
                                                                    to = 11),
                             custom.coef.names = c('Intercepto',
                                                   'Gênero', 
                                                   'Experiência', 
                                                   'Experiência2', 
                                                   'Raça', 
                                                   'Horas de trabalho', 
                                                   'Líder da família',
                                                   'Trabalhador do setor privado',
                                                   'Anos de estudo',
                                                   'Região', 
                                                   'Área de trabalho: Indústria geral',
                                                   'Área de trabalho: Construção',
                                                   'Área de trabalho: Comércio e reparação de veículos',
                                                   'Área de trabalho: Transporte, armazenagem e correio',
                                                   'Área de trabalho: Alojamento e alimentação',
                                                   'Área de trabalho: Comunicação e atividades e administrativas',
                                                   'Área de trabalho: Administração pública, defesa e seguridade social',
                                                   'Área de trabalho: Educação, saúde humana e serviços sociais',
                                                   'Área de trabalho: Outros Serviços',
                                                   'Área de trabalho: Serviços domésticos',
                                                   'Área de trabalho: Atividades mal definidas',
                                                   'Trabalhador formal'),
                            digits = 4, 
                             file = 'tables/linear_model.html')  

# nopo model  ------------

# importing data

my_dir <- base::paste0(dirname(rstudioapi::getActiveDocumentContext()$path),'/data/PNADC_oaxaca_data/oaxaca_data.rds')

oaxaca_data <- base::readRDS(file = my_dir)

# running models

oaxaca_model_results <- purrr::map(.x = oaxaca_data,
                                   .f = oaxaca_model)


oaxaca_mean <- yearly_df_maker(data_list = oaxaca_model_results, 
                               idx = 1)

oaxaca_results <- base::list()

for (i in 1:base::length(all_pnadc_names)){
  temp_list <- oaxaca_model_results[[all_pnadc_names[i]]][[2]] 
  
  temp_df <- dplyr::tibble(Year = base::as.numeric(stringi::stri_sub(str = all_pnadc_names[i],
                                                                     from = 7, 
                                                                     to = 11)),
                           Delta_tot = temp_list[[1]],
                           Delta_A = temp_list[[2]],
                           Delta_X = temp_list[[3]],
                           Delta_S = temp_list[[4]],
                           Delta_B = temp_list[[5]])
  
  oaxaca_results[[i]] <- temp_df
}

oaxaca_results <- base::do.call(what = rbind, args = oaxaca_results) %>%
  xtable::xtable(label = 'nopomodelresults', 
                 caption = 'Elaboração própria. Dados da PNADC', 
                 digits = 4)

print(oaxaca_results,                            
      include.rownames = FALSE, 
      file = 'tables/oaxaca_results.html', 
      type = 'html')


# VARTESTS

var_data <- purrr::map(.x = model_data,
                      .f = var_tests)

# CLEAN ENVIRONMENT (EXCEPT FOR FUNCTIONS SOURCED) -------------------------
base::rm(list = setdiff(ls(), lsf.str()))
