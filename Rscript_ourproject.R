## breeze and natália
## team tbd // delta lab
## 4.4.23

# packages
library(data.table)
library(dplyr)
library(ggplot2)
library(ggstatsplot)

# data
df <- fread("airings_data_CRT.csv")

# figure 1: bar plot for time of day analysis
counts <- table(df$daypart)
barplot(counts, main="CRT Mention Ad Airings",
        xlab="Time of Day Ad Aired") 

# figure 2: bar plot for affiliate analysis
counts2 <- table(df$affiliate)
barplot(counts2, main="CRT Mention Ad Airings",
        xlab="TV Affiliate") 

# table 1: table for affiliate and daypart analysis
table(df$affiliate, df$daypart)

# colors
coldnights = c("#ADB3BA", "#22ADC2", "#F35C9F", "#FFEAEC", "#A2E3C4", "#A80874", "#247BA0", "#2F2F2F", "#9067C6", "#F1C8DB") # basically, we are combining these codes into a list

# figure 3: stacked bar
ggplot(df) +
  aes(x = affiliate, fill = daypart) +
  geom_bar(position = "fill")+
  theme_classic()+ 
  scale_fill_manual(values = coldnights) 

# chi-square test
myChi <- chisq.test(df$daypart, df$affiliate)
myChi

# figure 4: stacked bar chart with detailed stats
ggbarstats(
  data = df,
  x = daypart,
  y = affiliate) +
  labs(caption = NULL) +
  scale_fill_manual(values = coldnights)

