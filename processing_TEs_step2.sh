######  filter out TEs with no coverage using grep -v NA
####### then upload filtered table
#######
together<-read.table(file="/kingsley_1/3-analysis/bsseq/intermediate_file/tmp/filt.htes.wba", header=TRUE)
#######


melt.together<-melt(together, id=c('id'))


#
# isolate TE id
melt_thing0<-str_split_fixed(melt.together$id, '(=|;)', 3)
melt.together<-data.frame(melt.together, teId=melt_thing0[,2]) 

# variable is name stuff, pull out parts here
melt_thing1<-str_split_fixed(melt.together$variable, '(\\.|_)', 4)
melt.together<-data.frame(melt.together, genotype=melt_thing1[,1], 
                          generation=melt_thing1[,2], 
                          rep=melt_thing1[,3] )
#
#value is all the values we need
melt_thing2<-str_split_fixed(melt.together$value, '(,|=|;)', 14)
melt.together<-data.frame(melt.together,   mcg=melt_thing2[,3], 
                           ctCount=melt_thing2[,13], 
                          teStart=melt_thing2[,1], teEnd=melt_thing2[,2] )

melt.together<-transform(melt.together, teLength=as.numeric(as.character(teEnd))-as.numeric(as.character(teStart)))


genNum<-c(as.numeric(str_split_fixed(melt.together$generation, 'f', 2)[,2])-1)
melt.together<-data.frame(melt.together, genNum=genNum)

## we generally don't consider extremely short TEs and they will create problems due to intrinsic noisy-ness
melt.tog.long<-melt.together[as.numeric(as.character(melt.together$teLength))>250,]

melt.tog.long<-data.frame(melt.tog.long, mcg2=as.numeric(as.character(melt.tog.long$mcg)))

## cleaning up
melt.tog.long<-melt.tog.long[,-c(1:3,8,10,11)]
