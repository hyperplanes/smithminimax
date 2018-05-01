getVoteShares=function(data_df,candidates=NULL){
	if(is.null(candidates)){
		candidates=setdiff(names(data_df),'voterId')
	}
	votes=matrix(nrow=length(candidates),ncol=length(candidates),dimnames=list(candidates,candidates))
	for(row in 1:length(candidates)){
		for(col in 1:length(candidates)){
			A=candidates[row]
			B=candidates[col]
			if(A==B){
				votes[row,col]=NA
			}else{
				votesForA=sum(ifelse(data_df[,A]<data_df[,B],1,0),na.rm=TRUE)
				votesForB=sum(ifelse(data_df[,A]>data_df[,B],1,0),na.rm=TRUE)
				votes[row,col]=votesForA/(votesForA+votesForB)
			}
		}
	}
	return(votes)
}