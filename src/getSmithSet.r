getSmithSet=function(candidates,votes) {
	allSets=getAllSets(candidates)
	nAllSets=NULL
	smithSet=NULL
	test=function(set,notin){
		set=unlist(set)
		notin=unlist(notin)
		if(length(notin)==0){
			return( TRUE)
		}
		for(i in 1:length(set)){
			ele1=set[i]
			for(j in 1:length(notin)){
				ele2=notin[j]
				voteshare=votes[ele1,ele2]
				if(!(voteshare > 0.5)){
					return(FALSE)
				}
			}
		}
		return(TRUE)
	}
	for(i in 1:length(allSets)){
		set=allSets[i]
		notin=setdiff(candidates,unlist(set))
		nAllSets[i]=list(notin)
		smithSet[i]=test(set,notin)
	}

	candidates=allSets[smithSet]
	setSizes=NULL
	for(i in 1:length(candidates)){
		set=unlist(candidates[i])
		setSizes[i]=length(set)
	}
	winner=candidates[setSizes==min(setSizes)]
	return(unlist(winner))
}