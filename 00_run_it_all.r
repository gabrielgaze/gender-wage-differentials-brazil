# Main script for reproducing the research fully
# Author: Gabriel Gaze Gonçalves Fontenele Gomes
# Last script update: 2024-08-06

# install.packages('PNADcIBGE', 'tidyverse', 'readr','forcats','oaxaca', 'ggplot2', 'stringr', 'srvyr', 'texreg',
                  # 'xtable', 'remotes', 'survey')

# remotes::install_github("gibonet/decr", build_vignettes = TRUE)

# CLEAN UP WORKSPACE ------------
rm(list = ls())

# close all figure windows created 
graphics.off() 

#load packages (colocar library) --------------------------
library(PNADcIBGE)
library(tidyverse)
library(readr)
library(forcats)
library(ggplot2)
library(stringr)
library(srvyr)
library(decr)
library(texreg)
library(xtable)
library(survey)

# change directory (make sure you're using Rstudio)------------------------
my_dir <- dirname(rstudioapi::getActiveDocumentContext()$path) 
setwd(my_dir)

# list functions in 'R-Fcts' --------------------------
my_R_files <- list.files(path = 'R-Fcts',
                         pattern = '*.R',
                         full.names = TRUE)

#Load all functions in r --------------------------------
sapply(my_R_files, source) 

# run import data Script ------------------
source('01_Import_Data.r') 

# run clean data script ----------------
source('02_Clean_data.r')

# run models ----------------------------
source('03_build_report_models.r')
