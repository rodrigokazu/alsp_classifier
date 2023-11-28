# Loading Libraries
library(dplyr)

# Loading Data
raw.file = file.choose()
data = read.csv(raw.file)

# Encoding Sex and genotype as binaries
data$Sex = ifelse(data$Sex == "Male", "0", "1")
data$Genotype = ifelse(data$Genotype == "WT", "0", "1")

# Summarizing performance variables of different experimental sessions
dataAVG = group_by(data, AnimalID, Age, Sex, Genotype) %>%
  summarise(HR2 = mean(HR2),
            HR1 = mean(HR1),
            HR0.5 = mean(HR0.5),
            HR0.2 = mean(HR0.2),
            FAR2 = mean(FAR2),
            FAR1 = mean(FAR1),
            FAR0.5 = mean(FAR0.5),
            FAR0.2 = mean(FAR0.2),
            DP2 = mean(DP2),
            DP1 = mean(DP1),
            DP0.5 = mean(DP0.5),
            DP0.2 = mean(DP0.2),
            CB2 = mean(CB2),
            CB1 = mean(CB1),
            CB0.5 = mean(CB0.5),
            CB0.2 = mean(CB0.2))

# Relocating Genotype column 
dataAVG = dataAVG %>%
  relocate(Genotype, .after = CB0.2)

# Scaling explanatory variable to improve convergence
dataAVG[c(4:19)] = scale(dataAVG[c(4:19)])

# Filtering dataset according to different timepoints
firstrun = dataAVG %>%
  filter(Age == "3-6")
secondrun = dataAVG %>%
  filter(Age == "7-10")
thirdrun = dataAVG %>%
  filter(Age == "14-19")
fourthrun = dataAVG %>%
  filter(Age == "20-21")

# Dropping unnecessary columns
firstrun = subset(firstrun, select = -c(AnimalID, Age))
secondrun = subset(secondrun, select = -c(AnimalID, Age))
thirdrun = subset(thirdrun, select = -c(AnimalID, Age))
fourthrun = subset(fourthrun, select = -c(AnimalID, Age))

# Exporting specific datasets as .csv
write.csv(firstrun, "READYCPTfirstrun.csv", row.names = F)
write.csv(secondrun, "READYCPTsecondrun.csv", row.names = F)
write.csv(thirdrun, "READYCPTthirdrun.csv", row.names = F)
write.csv(fourthrun, "READYCPTfourthrun.csv", row.names = F)