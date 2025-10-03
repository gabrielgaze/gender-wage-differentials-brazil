# Script for Data manage of the research
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-05

# Files available at https://www.ibge.gov.br/estatisticas/sociais/trabalho/17270-pnad-continua.html?=&t=microdados
# PNADcIBGE package documentation available at https://cran.r-project.org/web/packages/PNADcIBGE/index.html
#
# Last file update: 2024-08-05


# CREATING AND CLEANING A NEW DIR FOR RAW DATA --------------------
my_dir <- base::paste0(dirname(rstudioapi::getActiveDocumentContext()$path), '/data/PNADC_raw_data') 

create_and_clean_dir(my_dir)

# SET FILE NAMES USING set_file_names FUNCTION ------------------------
name_files <- set_file_names(pattern_name = 'data/PNADC_raw_data/PNADC_')

# SET ARGS AND RUN FUNCTION download_pnad_files FOR ALL YEARS ----------------------
purrr::map(.x = name_files, 
           .f = download_pnad_files)

# CLEAN ENVIRONMENT (EXCEPT FOR FUNCTIONS SOURCED) ------------------------
base::rm(list = setdiff(ls(), lsf.str()))