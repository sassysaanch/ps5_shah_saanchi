################################################################################
##
## [ PROJ ] < Problem set #5 >
## [ FILE ] < Homework Edu 260B >
## [ AUTH ] < Saanchi Shah/ sassysaanch >
## [ INIT ] < 2/12/2023 >
##
################################################################################

## ---------------------------
## libraries
## ---------------------------

library(tidyverse)

## ---------------------------
## directory paths
## ---------------------------
plots_dir <- file.path("./plots")


## -----------------------------------------------------------------------------
## Part 2 - Label each question using comments
## -----------------------------------------------------------------------------
load(url("https://github.com/anyone-can-cook/rclass2/raw/main/data/recruiting/recruit_school_somevars.RData"))

# + `visits_by_100751` = University of Alabama
#+ `visits_by_126614` = University of Colorado Boulder
# + `visits_by_110635` = UC Berkeley

df_univ <- df_school %>% 
  mutate(visited = if_else(visits_by_126614 >= 1, 1, 0)) %>% 
  filter(state_code == inst_126614) %>% 
  select(ncessch, total_students, avgmedian_inc_2564, visited)

png(file.path(plots_dir, 'scatterplot_cuboulder.png'))
ggplot(data = df_univ, aes(x = total_students, y = avgmedian_inc_2564, color = as.factor(visited))) +
  geom_point() +
  xlab('Total enrollment') + ylab('Average median income') +
  scale_color_discrete(name = 'Recruitment Visits', labels = c('No visits', 'Visits'))
dev.off()

## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
