# A function which imports the first interview data from PNADC and exports a .rds file
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-05

download_pnad_files <- function(name_file){     
  # imports the first interview data from PNADC and exports a .rds file 
  # ARGS:
  #   name_file - name of .rds file created by set_file_names function (available in this package)
  #   
  # Returns: 
  #   PNADC data will be saved in name_file path 
  
  if (base::class(name_file) != 'character'){
    stop('Error: input name_file is not a character')
  }
  
  year <- base::as.numeric(stringr::str_sub(name_file, 88, 91))
  
  if (year %in% c(2020, 2021)){
    message(base::paste0('A PNAD não foi realizada no ano de ', year))
    
    base::saveRDS(object = NULL, 
                  file = name_file)
  } 
  else {
  temp_df <- PNADcIBGE::get_pnadc(year = year, 
                                  interview = 1,
                                  vars = c('VD4002',
                                           'VD4007',
                                           'V1022',
                                           'V2010',
                                           'VD3004',
                                           'V2007',
                                           'VD3005',
                                           'VD4009',
                                           'VD4010',
                                           'VD4013',
                                           'VD4016',
                                           'V2009', 
                                           'VD2002',
                                           'VD4012')) %>%
    srvyr::as_survey()
  
  base::saveRDS(object = temp_df,
                file = name_file)
  }
  
  Sys.sleep(10)
}
