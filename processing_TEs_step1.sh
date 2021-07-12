##
## all TE methylation files' suffix = wba (window-by-annotation)
## this loads each of 63 TE mCG tables 
## and pulls out TE ID, meth score, c+t (coverage proxy), and TE length
## printing square table of all hetero TEs to disk
## whereby you remove those TEs with any "NA" (which are TEs with no coverage)
## using grep -v "NA" in > out

filenames<-list.files("/kingsley_1/3-analysis/bsseq/intermediate_file/",
                      pattern='wba$', full.names = TRUE)

h1 <- lapply(filenames, read.table)

resultlis<-list()

for (i in 1:length(filenames)) {  
  
  resultlis[[i]]<-data.frame(paste(h1[[i]][,4],h1[[i]][,5],h1[[i]][,6],h1[[i]][,9], sep=","))
  thing<-str_split_fixed(basename(filenames[i]), '(\\.)', 3)
  
  
  names(resultlis[[i]])[1]<-paste(thing[,1],thing[,2],thing[,3])
  #names(resultlis[[i]])[2]<-paste(thing[,1],thing[,2],"cov")
  
}

together<-do.call(cbind, resultlis)

# id is entire 9th col of random file since all same - pare down next
together<-data.frame(id=h1[[1]][,9],  together)


#
##
####
#######
#remove those TEs in which there is no cov for one or more samples
######
write.table(together, "/kingsley_1/3-analysis/bsseq/intermediate_file/tmp/unfilt.htes.wba", sep="\t", 
            row.names=FALSE, col.names=TRUE, quote=FALSE)
