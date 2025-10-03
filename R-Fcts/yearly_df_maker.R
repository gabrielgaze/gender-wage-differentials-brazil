# A function that structures dataframes annually
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-06

yearly_df_maker <- function(data_list, idx){
  # A function that structures dataframes annually
  # ARGS:
  #   data_list - a list with different datas
  #   idx - the index number of the data in the list to structure it yearly
  #
  # Returns: 
  #   a dataframe with a column which specifies the year
  
  all_pnadc_names <- names(data_list)
  temp_list <- base::list()
  
  for (i in 1:base::length(all_pnadc_names)){
    temp_df <- data_list[[all_pnadc_names[i]]][[idx]] %>%
      dplyr::mutate(Year = base::as.numeric(stringi::stri_sub(str = all_pnadc_names[i],
                                                              from = 7, 
                                                              to = 11))) 
    temp_list[[i]] <- temp_df
}

  pooled_df <- base::do.call(what = rbind, args = temp_list) 
  return(pooled_df)

}
