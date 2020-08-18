# install the package
install.packages("benford.analysis")

# load libraries
library(gtrendsR)
library(reshape2)
library(dplyr)
library(benford.analysis)

# read data
data = read.csv("https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/totals/co-est2019-alldata.csv", header = T)

# filter out columns
data_filt = data %>% filter(COUNTY != 0) %>% select(c(STNAME, CTYNAME, CENSUS2010POP))

# perform benford analysis
trends = benford(data_filt$CENSUS2010POP, number.of.digits = 1, discrete = T, sign = "positive") 
trends

# plot results
plot(trends)
