
# dcast to do opposite of dataframe melt

# mcg here
mcg.for.AB<-dcast(melt.tog.long, teId ~ genotype + generation + rep, 
                  value.var="mcg2", fun.aggregate=sum)


# C + T (coverage proxy) per sample per TE 
melt.tog.long<-data.frame(melt.tog.long, 
                  cplust=as.numeric(as.character(melt.tog.long$ctCount)))

melt.tog.long<-melt.tog.long[,-5]

cov.for.AB<-dcast(melt.tog.long, teId ~ genotype + generation + rep, 
                      value.var='cplust', fun.aggregate=sum)





