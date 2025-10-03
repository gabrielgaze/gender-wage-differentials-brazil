# Survey data cleansing manager
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-05


# IMPORT RAW DATA USING set_file_names FUNCTION -------------------------
raw_data_files <- set_file_names(pattern_name = 'data/PNADC_raw_data/PNADC_')

raw_data <- purrr::map(.x = raw_data_files, 
                       base::readRDS)

base::names(raw_data) <- base::paste0('PNADC_', 2015:(base::as.numeric(format(base::Sys.Date(), '%Y')) - 2)) # (IT NEEDS AN UPDATE)

# REMOVE NULL VALUES FROM raw_data -----------------------
raw_data <- raw_data[!base::sapply(X = raw_data, FUN = base::is.null)]


# STRUCTURING DATA USING model_data_formatter FUNCTION --------------------
model_data <- purrr::map(.x = raw_data, 
                         .f = model_data_formatter)

# CREATING A NEW DIR FOR STRUCTURED MODEL DATA ------------------------
my_dir <- base::paste0(dirname(rstudioapi::getActiveDocumentContext()$path), '/data/PNADC_structured_model_data') 

create_and_clean_dir(my_dir)

# SAVING MODEL DATA --------------------------
base::saveRDS(object = model_data,
              file = base::paste0(my_dir, '/model_data.rds'))

# STRUCTURING DATA FOR OAXACA MODEL -------------------

oaxaca_data <- purrr::map(.x = model_data, 
                          .f = get_oaxaca_data)

my_dir <- base::paste0(dirname(rstudioapi::getActiveDocumentContext()$path), '/data/PNADC_oaxaca_data') 

create_and_clean_dir(my_dir)

# SAVING OAXACA DATA --------------------------
base::saveRDS(object = oaxaca_data,
              file = base::paste0(my_dir, '/oaxaca_data.rds'))

# CLEAN ENVIRONMENT (EXCEPT FOR FUNCTIONS SOURCED) -------------------------
base::rm(list = setdiff(ls(), lsf.str()))
