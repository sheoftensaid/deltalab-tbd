## crt 
# 3.30.23
# bf

# packages
library(data.table)
library(tidyverse)

# data
df <- fread("airings_data_CRT.csv")

# subset, collapse, sum 
crt <- df %>%
  select(market, airdate, issue_ed_crt) %>%
  group_by(market, airdate) %>%
  summarize(sum_crt = sum(issue_ed_crt))

# if you look at the data, you'll see the ATL market had 148 airings that 
# mentioned CRT on 10/27/22. Five markets had CRT airiings on 4/12/22, etc.. 



