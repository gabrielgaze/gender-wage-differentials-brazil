# A function that creates file names 
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-05-21

set_file_names <- function(pattern_name){
  # Create rds file names with years ID
  # ARGS:
  #   pattern_name - the pattern file name path in the project directory
  #   
  # Returns:
  #   A text vector with filenames enumerated by years
  
  if (base::class(pattern_name) != 'character'){
    stop('Error: input pattern_name is not a character')
  }
  my_dir <- base::getwd()
  currently_year <- base::as.numeric(format(base::Sys.Date(), '%Y')) - 2
  years <- 2015:currently_year
  name_files <- base::paste0(my_dir, '/',pattern_name, base::as.character(years), '.rds')
  return(name_files)
}
