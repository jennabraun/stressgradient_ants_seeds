#collate the plant ID data so that I can compare and finalize the IDs

library(tidyr)
library(dplyr)


barstow <- read.csv("Raw Data/annuals/barstow.csv")
names_col <- colnames(barstow)
firstrow <- barstow[1,]
both <- paste(names_col, firstrow)
colnames(barstow) <- both
barstow <- barstow[-1,]
str(barstow)
barstow <- barstow %>% mutate(across(7:65, as.numeric))
barstow <- pivot_longer(barstow, 7:65, names_to = "species", values_to = "abun")


cuyamas <- read.csv("Raw Data/annuals/cuyamas.csv")
names_col <- colnames(cuyamas)
firstrow <- cuyamas[1,]
both <- paste(names_col, firstrow)
colnames(cuyamas) <- both
cuyamas <- cuyamas[-1,]
str(cuyamas)
cuyamas <- cuyamas %>% mutate(across(7:81, as.numeric))
cuyamas <- pivot_longer(cuyamas, 7:81, names_to = "species", values_to = "abun")


heartofmojave <- read.csv("Raw Data/annuals/heartofmojave.csv")
names_col <- colnames(heartofmojave)
firstrow <- heartofmojave[1,]
both <- paste(names_col, firstrow)
colnames(heartofmojave) <- both
heartofmojave <- heartofmojave[-1,]
str(heartofmojave)
heartofmojave <- heartofmojave %>% mutate(across(7:73, as.numeric))
heartofmojave <- pivot_longer(heartofmojave, 7:73, names_to = "species", values_to = "abun")


sheephole <- read.csv("Raw Data/annuals/sheephole.csv")
names_col <- colnames(sheephole)
firstrow <- sheephole[1,]
both <- paste(names_col, firstrow)
colnames(sheephole) <- both
sheephole <- sheephole[-1,]
str(sheephole)
sheephole <- sheephole %>% mutate(across(7:71, as.numeric))
sheephole <- pivot_longer(sheephole, 7:71, names_to = "species", values_to = "abun")


tecopa <- read.csv("Raw Data/annuals/tecopa.csv")
names_col <- colnames(tecopa)
firstrow <- tecopa[1,]
both <- paste(names_col, firstrow)
colnames(tecopa) <- both
tecopa <- tecopa[-1,]
str(tecopa)
tecopa <- tecopa %>% mutate(across(7:34, as.numeric))
tecopa <- pivot_longer(tecopa, 7:34, names_to = "species", values_to = "abun")
tecopa <- rename(tecopa, 'ID.notes NA' = "ID.notes ")

yucca <- read.csv("Raw Data/annuals/yucca.csv")
names_col <- colnames(yucca)
firstrow <- yucca[1,]
both <- paste(names_col, firstrow)
colnames(yucca) <- both
yucca <- yucca[-1,]
str(yucca)
yucca <- yucca %>% mutate(across(7:72, as.numeric))
yucca <- pivot_longer(yucca, 7:72, names_to = "species", values_to = "abun")

allplants <- rbind(barstow, cuyamas, heartofmojave, sheephole, tecopa, yucca)
allplants <- allplants %>% drop_na(abun)

write.csv(allplants, "Raw Data/annuals/allplants.csv")


all <- read.csv("Raw Data/annuals/allplants_IDed.csv")
uniq <- all %>% select(species) %>% unique()                 

write.csv(uniq, "Clean Data/annuallist.csv")
