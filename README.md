# smithminimax

Overview
--------

This is an attempt to provide an R implementation of the smith-minimax criterion of picking the winner of an election by preference-ballot. 

Usage
-----

Hold an election where voters rank the `N` candidates in order from 1 for their most prefered candidate, to `N>1` for their least prefered candidate. The `smithMinimax` takes an `N` by `N` matrix of the cartesian product of the candidates, with each cell giving the share, of those who indicated a preference, who prefered the row candidate over the column candidate. The return value is a vector subset of the smith set that satisfies the minimax criterion. If the vector is not atomic, this indicates a tie.

```R
winner=smithMinimax(votes)
```

The `smithMinimax` optionally takes a `candidates` argument supplying a subset of all candidates to be considered. By default it considers each column of the `votes` matrix to be a candidate.

```R
#pick the first place winner from all candidates in votes matrix
winner=smithMinimax(votes)

#pick a second place winner
winner2=smithMinimax(votes,setdiff(colnames(votes),winner))
```

Use the `getVoteShare` method to calculate a `votes` matrix from raw voter data. The method takes a `data_df` argument that is a dataframe where each candidate has a column, each voter has a row, and the cells indicate the voter's rank for each candidate, with 1 being the most prefered and `N` being the least prefered. Unranked candidates can be entered as `NA` and treated as non-response in pairwise votes, or can be filled in with the value `N` and treated as tied for that voter's least prefered candidate. By default, `getVoteShare` assumes that every column that isn't `voterId` as a candidate. Optionally, you can pass a vector the names of the columns that are candidates as the `candidates` argument.

```R
#assumes every column of data_df except voterId is a candidate
votes=getVoteShares(data_df)

#explicitly specify which columns are candidates
votes=getVoteShares(data_df,candidates)
```

Installation
------------

Every function has it's own file in the `src` directory, and you will need to load them first, before calling `getVoteShares` or `smithMinimax`. For example this script loads the five required files using relative paths from the `test` directory:

```R
source('../src/getAllSets.r')
source('../src/getSmithSet.r')
source('../src/getVoteShares.r')
source('../src/calcMinimax.r')
source('../src/smithMinimax.r')
```

