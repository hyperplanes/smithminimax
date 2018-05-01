getAllSets=function(wholeset){
	allSets=NULL
	for(i in 1:length(wholeset)){
		allSets=c(allSets,combn(wholeset,m=i,simplify=FALSE))
	}
	return(allSets)
}