library(bnlearn)
library(gRain)

# here are our random variables
var=c("Sci", "Work", "Math", "Eff", "Stat")

# here we describe our network
e=empty.graph(var)
modelstring(e)="[Sci][Work][Math|Sci][Eff|Sci:Work][Stat|Math:Eff]"

plot(e)

# here we provide our conditional probability tables
cptSci=matrix(c(0.75, 0.25), ncol=2, dimnames=list(NULL, c("Like", "Dislike")))
cptSci

cptWork=matrix(c(0.60, 0.40), ncol=2, dimnames=list(NULL, c("High", "Low")))
cptWork

cptMath=c(0.50, 0.25, 0.25, 0.10, 0.40, 0.50)
dim(cptMath)=c(3, 2)
dimnames(cptMath)=list("Math"=c("A", "B", "C"), "Sci"=c("Like", "Dislike"))
cptMath

cptEff=c(0.75, 0.25, 0.85, 0.15, 0.60, 0.40, 0.50, 0.50)
dim(cptEff)=c(2, 2, 2)
dimnames(cptEff)=list("Eff"=c("High", "Low"), "Work"=c("High", "Low"), "Sci"=c("Like", "Dislike"))
cptEff

cptStat = c(0.85, 0.15, 0, 0, 0.15, 0.70, 0.15, 0, 0.01, 0.39, 0.40, 0.20, 0.5, 0.5, 0, 0, 0.10, 0.65, 0.25, 0, 0, 0.25, 0.35, 0.40)
dim(cptStat) = c(4, 3, 2)
dimnames(cptStat) = list("Stat" = c("A", "B", "C", "Fail"), "Math" = c("A", "B", "C"), "Eff" =  c("High", "Low"))
cptStat

# here we get ready for doing inferences
efit=custom.fit(e, dist=list(Sci=cptSci, Work=cptWork, Math=cptMath, Eff=cptEff, Stat=cptStat))
et=compile(as.grain(efit))

# net stores our evidence, for example Stat=A, or Math=B, Sci=Like
net = setEvidence(et, c("Math", "Sci"), c("B", "Like"))
#net = setEvidence(et, c("Stat"), c("A"))

# how likely is this evidence to observe?
pEvidence(net)

# given the evidence, what is P(Stat)
querygrain(net, nodes=c("Stat"))
