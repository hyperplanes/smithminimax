calcMinimax=function(smithset,votes){
	if(length(smithset)==1){
		return(smithset[1])
	}
	worstDefeat=NULL
	for(i in 1:length(smithset)){
		candidate=smithset[i]
		notcandidate=setdiff(smithset,candidate)
		worstDefeat[i]=min(votes[candidate,notcandidate])
	}
	return(smithset[worstDefeat==max(worstDefeat)])
}