smithMinimax=function(candidates,votes){
	return(calcMinimax(getSmithSet(candidates,votes),votes))
}