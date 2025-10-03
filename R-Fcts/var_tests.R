

var_tests <- function(model_data){
  model_gender <- survey::svyglm(lnwages ~ gender, 
                                 design = model_data)
  
  model_age <- survey::svyglm(lnwages ~ age, 
                              design = model_data)
  
  model_ppi <- survey::svyglm(lnwages ~ ppi,
                              design = model_data)
  
  model_working.hours <- survey::svyglm(lnwages ~ working.hours,
                                        design = model_data)
  
  model_f_head <- survey::svyglm(lnwages ~ f_head,
                                 design = model_data)
  
  model_private_sector <- survey::svyglm(lnwages ~ private.sector,
                                         design = model_data)
  
  model_studying.years <- survey::svyglm(lnwages ~ studying.years, 
                                         design = model_data)
  
  model_working.area <- survey::svyglm(lnwages ~ working.area, 
                                         design = model_data)
  
  model_region <- survey::svyglm(lnwages ~ region, 
                                 design = model_data)
  
  model_formal.worker <- survey::svyglm(lnwages ~ formal.worker,
                                        design = model_data)
  
  model_wout_control <- survey::svyglm(lnwages ~ gender + age + age2 + studying.years, 
                                       design = model_data)
  
  return(base::list('model_gender' = summary(model_gender)$r.squared,
                    'model_age' = summary(model_age)$r.squared,
                    'model_working.area' = summary(model_working.area)$r.squared,
                    'model_ppi' = summary(model_ppi)$r.squared,
                    'model_working.hours' = summary(model_working.hours)$r.squared,
                    'model_f_head' = summary(model_f_head)$r.squared,
                    'model_private_sector' = summary(model_private_sector)$r.squared,
                    'model_studying.years' = summary(model_studying.years)$r.squared,
                    'model_region' = summary(model_region)$r.squared,
                    'model_formal.worker' = summary(model_formal.worker)$r.squared,
                    'wout_control' = summary(model_wout_control)))

 }
