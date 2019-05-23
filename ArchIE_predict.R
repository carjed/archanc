args = commandArgs(trailingOnly=TRUE)
commandArgs()
# library(data.table)
# library(tidyverse)
# train <- data.frame(fread(args[1]))
LABEL_COL=209

# lr <- train[,1:LABEL_COL] # cut down the extra columns -- 209 is the label (0=not archaic, 1=archaic)
# model <- glm(V209 ~ .,family=binomial(link='logit'),data=lr) # train the model
cat("loading training data...")
model <- readRDS(args[1])
# load(args[1])
cat("done\n")

cat("loading test data...")
test <- read.table(args[2], sep="", header=F)
#test <- read_tsv(args[2], col_names=F)
# predicted <- plogis(predict.glm(model, test[,1:LABEL_COL]))
cat("done\n")

cat("getting predictions...")
# test <- read.table("archanc/output/ArchIE/combined/GutenkunstThreePop_mnm100-0.015_eur.txt")
predicted <- plogis(predict.glm(model, test[,1:LABEL_COL]))
cat("done\n")

# number of samples predicted to be archaic
# length(predicted[predicted>0.5])

# savehistory("archanc/ArchIE_predict.R")

saveRDS(predicted, args[3])