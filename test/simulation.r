library(tidyverse)
source('../src/getAllSets.r')
source('../src/getSmithSet.r')
source('../src/getVoteShares.r')
source('../src/calcMinimax.r')
source('generateData.r')
source('../src/smithMinimax.r')
data_df=days=votes=winner=winner2=days2=NULL
data_df=generateData(1000000)
candidates=setdiff(names(data_df),'voterId')

bottomcode=length(candidates)

data_df[is.na(data_df)]=bottomcode

votes=getVoteShares(data_df)

winner=smithMinimax(candidates,votes)

winner2=setdiff(candidates,winner) %>%
	smithMinimax(votes)

paste0("First winner: ",winner) %>% print
paste0("Second winner: ",arrayToString(winner2))

