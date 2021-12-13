#DELIVERABLE 1
library("dplyr") #import dplyr library
read.csv('Resources/MechaCar_mpg.csv') #importing dataset into r
mecha_car_data <- read.csv('Resources/MechaCar_mpg.csv') #reading in dataset as r DataFrame
head(mecha_car_data) # inspecting data
mra <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=mecha_car_data) #generate multiple linear regression model
summary(mra)

#DELIVERABLE 2
coil_data <- read.csv('Resources/Suspension_Coil.csv') #reading dataset into r
head(coil_data) #inspecting data file
total_summary <- coil_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep') #create 'total_summary' dataframe
lot_summary <- coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep') #create 'lot_summary' dataframe

#DELIVERABLE 3
t.test(log10(coil_data$PSI),mu=log10(1500)) #compute t-test comparing sample (lbs./PSI across all lots) to the population mean of 1500 lbs/PSI

lot1 <- coil_data %>% filter(Manufacturing_Lot=='Lot1') #filter dataset to create sample table with desired filter to be used in t-test
t.test(log10(lot1$PSI),mu=log10(1500)) #compute t-test comparing Lot1's sample lbs./PSI mean to the population lbs./PSI mean of 1500 lbs./PSI

lot2 <- coil_data %>% filter(Manufacturing_Lot=='Lot2') #filter dataset to create sample table with desired filter to be used in t-test
t.test(log10(lot2$PSI),mu=log10(1500)) #compute t-test comparing Lot2's sample lbs./PSI mean to the population lbs./PSI mean of 1500 lbs./PSI

lot3 <- coil_data %>% filter(Manufacturing_Lot=='Lot3') #filter dataset to create sample table with desired filter to be used in t-test
t.test(log10(lot3$PSI),mu=log10(1500)) #compute t-test comparing Lot3's sample lbs./PSI mean to the population lbs./PSI mean of 1500 lbs./PSI


