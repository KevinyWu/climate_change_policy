set.seed(60637)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
global <- read.csv(file = '../data/global_temp_cleaned.csv', as.is = TRUE)
usa <- read.csv(file = '../data/usa_temp_cleaned.csv', as.is = TRUE)

# keep only year, month, annual, 5-year and 10-year columns
global_cleaned <- global[-c(3:4,11:12)]
usa_cleaned <- usa[-c(3:4,11:12)]

# keep only Jan. 1850 to Dec. 2020 Rows
global_cleaned <- global_cleaned[-c(1:1200,3253:3265),]
usa_cleaned <- usa_cleaned[-c(1:360),]

# add 8.60 to all average temperature columns in global_cleaned
global_cleaned$Global_Avg_1 <- global_cleaned$Global_Avg_1 + 8.60
global_cleaned$Global_Avg_5 <- global_cleaned$Global_Avg_5 + 8.60
global_cleaned$Global_Avg_10 <- global_cleaned$Global_Avg_10 + 8.60

# add 11.36 to all average temperature columns in usa_cleaned
usa_cleaned$USA_Avg_1 <- usa_cleaned$USA_Avg_1 + 11.36
usa_cleaned$USA_Avg_5 <- usa_cleaned$USA_Avg_5 + 11.36
usa_cleaned$USA_Avg_10 <- usa_cleaned$USA_Avg_10 + 11.36

# save cleaned data
write.csv(global_cleaned, 'data/global_temp_cleaned.csv', row.names=FALSE)
write.csv(usa_cleaned, 'data/usa_temp_cleaned.csv', row.names=FALSE)