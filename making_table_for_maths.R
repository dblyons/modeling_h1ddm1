
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


# get TE length
el<-read.table(file='/kingsley_1/3-analysis/bsseq/intermediate_file/met1/length.txt')
names(el)[10]='teLength'
names(el)[11]='ID'
el<-el[,c(10,11)]



write.table(cov.for.AB.with.len, "/kingsley_1/3-analysis/bsseq/intermediate_file/for_AB/coverage_with_length.forAB.txt", sep="\t", 
            row.names=FALSE, col.names=TRUE, quote=FALSE)

# remove all but >2kbp for AB's ease?  i sent it to her, not sure if needed
mcg.for.AB.w.met1.long<-mcg.for.AB.w.met1.long[mcg.for.AB.w.met1.long$teLength>2000,]

write.table(mcg.for.AB.w.met1.long[,c(1:64)], 
            "/kingsley_1/3-analysis/bsseq/intermediate_file/for_AB/
            mcg_met1_added.forAB.gt2000bp.txt", sep="\t", row.names=FALSE, 
            col.names=TRUE, quote=FALSE)
