library(ggplot2)
set.seed(60637)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
global <- read.csv(file = '../data/global_temp_cleaned.csv', as.is = TRUE)
usa <- read.csv(file = '../data/usa_temp_cleaned.csv', as.is = TRUE)


# global temperatures
ggplot(global, aes(x = Year + (Month/12))) +
  geom_line(aes(y = Global_Avg_1, color = "1-Year Average with 95% Uncertainty")) +
  geom_ribbon(aes(ymin = Global_Avg_1 - Global_Avg_Unc_1,
                  ymax = Global_Avg_1 + Global_Avg_Unc_1),
              fill="pink", alpha = 0.6) +
  geom_line(aes(y = Global_Avg_10, color = "10-Year Average with 95% Uncertainty")) +
  geom_ribbon(aes(ymin = Global_Avg_10 - Global_Avg_Unc_10,
                  ymax = Global_Avg_10 + Global_Avg_Unc_10),
              fill="sky blue", alpha = 0.5) +
  scale_colour_manual("", 
                      breaks = c("1-Year Average with 95% Uncertainty", 
                                 "10-Year Average with 95% Uncertainty"),
                      values = c("red", "blue")) +
  theme_bw() +
  theme(legend.position = "bottom",
        axis.title = element_text(size = 20),
        axis.text = element_text(size = 15),
        plot.title = element_text(size = 25),
        legend.text = element_text(size = 15)) +
  xlab('Year') +
  ylab('Average Temperature (Celcius)') +
  ggtitle('Global Average Land Surface Temperatures, 1850-2020')


# usa temperatures
ggplot(usa, aes(x = Year + (Month/12))) +
  geom_line(aes(y = USA_Avg_1, color = "1-Year Average with 95% Uncertainty")) +
  geom_ribbon(aes(ymin = USA_Avg_1 - USA_Avg_Unc_1,
                  ymax = USA_Avg_1 + USA_Avg_Unc_1),
              fill="pink", alpha = 0.6) +
  geom_line(aes(y = USA_Avg_10, color = "10-Year Average with 95% Uncertainty")) +
  geom_ribbon(aes(ymin = USA_Avg_10 - USA_Avg_Unc_10,
                  ymax = USA_Avg_10 + USA_Avg_Unc_10),
              fill="sky blue", alpha = 0.5) +
  scale_colour_manual("", 
                      breaks = c("1-Year Average with 95% Uncertainty", 
                                 "10-Year Average with 95% Uncertainty"),
                      values = c("red", "blue")) +
  theme_bw() +
  theme(legend.position = "bottom",
        axis.title = element_text(size = 20),
        axis.text = element_text(size = 15),
        plot.title = element_text(size = 25),
        legend.text = element_text(size = 15)) +
  xlab('Year') +
  ylab('Average Temperature (Celcius)') +
  ggtitle('Contiguous U.S. Average Land Surface Temperatures, 1850-2020')


# mean temperature statistics
mean(global$Global_Avg_1)
sd(global$Global_Avg_1)
mean(global[1:1776,]$Global_Avg_1)
sd(global[1:1776,]$Global_Avg_1)
mean(global[1777:2052,]$Global_Avg_1)
sd(global[1777:2052,]$Global_Avg_1)

mean(usa[1:2046,]$USA_Avg_1)
sd(usa[1:2046,]$USA_Avg_1)
mean(usa[1:1776,]$USA_Avg_1)
sd(usa[1:1776,]$USA_Avg_1)
mean(usa[1777:2046,]$USA_Avg_1)
sd(usa[1777:2046,]$USA_Avg_1)


# mean rate of change statistics
(global[2005,]$Global_Avg_10 - global[1777,]$Global_Avg_10)/20*100
(global[2005,]$Global_Avg_10 - global[1201,]$Global_Avg_10)/68*100
(global[2005,]$Global_Avg_10 - global[601,]$Global_Avg_10)/118*100
(global[2005,]$Global_Avg_10 - global[1,]$Global_Avg_10)/168*100

(usa[1992,]$USA_Avg_10 - usa[1777,]$USA_Avg_10)/18*100
(usa[1992,]$USA_Avg_10 - usa[1201,]$USA_Avg_10)/66*100
(usa[1992,]$USA_Avg_10 - usa[601,]$USA_Avg_10)/116*100
(usa[1992,]$USA_Avg_10 - usa[1,]$USA_Avg_10)/166*100