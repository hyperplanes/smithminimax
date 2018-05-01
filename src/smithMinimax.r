smithMinimax=function(votes,candidates=colnames(votes)){
	return(calcMinimax(getSmithSet(candidates,votes),votes))
}