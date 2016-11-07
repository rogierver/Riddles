####http://fivethirtyeight.com/features/this-challenge-will-boggle-your-mind/####


download.file("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/dotnetperls-controls/enable1.txt","enable1.txt")
legalwords <- read.csv("enable1.txt", header=F)

legal <- apply(legalwords, 1, as.character)

#Which of the words are of length 2?
c.ind <- which(nchar(legal) == 2)

for(j in 3:20){
  #which words are length j+1?
  n.ind <- which(nchar(legal) == j)
  
  index <- c()
  
  for(i in 1:length(c.ind)){
    #for each word in the current index, find if it can build words in new index
    new.index <- which(grepl(legal[c.ind][i], legal[n.ind]))
    index <- c(index, new.index)
  }
  #unique index of words we need
  indexfinal <- unique(index)
  
  #Index of words that were formed with previous words
  c.ind <- n.ind[indexfinal]
  
  if(length(c.ind) == 0){break & print('No further words could be formed.')}
  
  #If there are less than 100 words that can be formed, print them
  if(length(c.ind) < 100){print(c(j, legal[c.ind]))}
}
