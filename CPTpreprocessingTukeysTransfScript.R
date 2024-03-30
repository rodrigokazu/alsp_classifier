# Loading Libraries
library(dplyr)
library(rcompanion)

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

# Subsetting dataframe for transformation
dataAVG1 = dataAVG[, c(1:4)]
dataAVG2 = dataAVG[, c(5:20)]

# Tranformation of performance variables using Tukey's Ladder of Power funciton
custom_transform_tukey <- function(x) {
  min_val <- min(x)  # Find the minimum value
  if (min_val <= 0) {
    x <- x - min_val + 1  # Add a constant to ensure all values are positive
  }
  transformTukey(x)
}

transformed_data = as.data.frame(lapply(dataAVG2, custom_transform_tukey))

# Merging dataframes post-transformation
transf_dataAVG = cbind(dataAVG1, transformed_data)

# Relocating Genotype column 
transf_dataAVG = transf_dataAVG %>%
  relocate(Genotype, .after = CB0.2)

# Filtering dataset according to different timepoints
firstrun = transf_dataAVG %>%
  filter(Age == "3-6")
secondrun = transf_dataAVG %>%
  filter(Age == "7-10")
thirdrun = transf_dataAVG %>%
  filter(Age == "14-19")
fourthrun = transf_dataAVG %>%
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