setwd("D:/Results/2D per Cell")

library(lookup)           
list.of.day <- list("\u1ea4\u0075\u0020\u0074\u0072\u00f9\u006e\u0067",
                    "\u0052\u0075\u1ed3\u0069 1 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                    "\u0052\u0075\u1ed3\u0069 5 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                    "\u0052\u0075\u1ed3\u0069 10 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                    "\u0052\u0075\u1ed3\u0069 15 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                    "\u0052\u0075\u1ed3\u0069 20 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                    "\u0052\u0075\u1ed3\u0069 25 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                    "\u0052\u0075\u1ed3\u0069 30 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069")
list.of.day
lookup.day <- data.frame(listday = c("\u1ea4\u0075\u0020\u0074\u0072\u00f9\u006e\u0067",
                                     "\u0052\u0075\u1ed3\u0069 1 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                                     "\u0052\u0075\u1ed3\u0069 5 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                                     "\u0052\u0075\u1ed3\u0069 10 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                                     "\u0052\u0075\u1ed3\u0069 15 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                                     "\u0052\u0075\u1ed3\u0069 20 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                                     "\u0052\u0075\u1ed3\u0069 25 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069",
                                     "\u0052\u0075\u1ed3\u0069 30 \u006e\u0067\u00e0\u0079\u0020\u0074\u0075\u1ed5\u0069"),
                         code.day = c("Larvae","01","05","10","15","20","25","30"))

for(d in list.of.day){
  print(d)
  day <- vlookup(d,lookup.day,"listday","code.day")
  print(day)
  
  #File input
  dc = read.csv(paste("2D DC",day,"- per Cell.csv"),header = T)
  dcc = read.csv(paste("2D DC+C",day,"- per Cell.csv"),header = T)
  kd = read.csv(paste("2D KD",day,"- per Cell.csv"),header = T)
  kdc = read.csv(paste("2D KD+C",day,"- per Cell.csv"),header = T)
  #OUTPUT
  savepath <- paste("D:/Results/Graph/Mito",day)
  
  attach(dc)
  attach(dcc)
  attach(kd)
  attach(kdc)
  
  library(lookup)
  
  x <- list("Mean Area","Mean Perimeter","Aspect Ratio","Form Factor","Branches","Mean Branch Length","Branch Junctions","Branch End Points")
  Parameter <- data.frame(col1 = c("Mean Area","Mean Perimeter","Aspect Ratio","Form Factor","Branches","Mean Branch Length","Branch Junctions","Branch End Points"),
                          col2 = c(4,6,7,8,10,13,15,17),
                          title.graph = c("\u0044\u0069\u1ec7\u006e\u0020\u0074\u00ed\u0063\u0068\u0020\u0074\u0072\u0075\u006e\u0067\u0020\u0062\u00ec\u006e\u0068",
                                          "\u0043\u0068\u0075\u0020\u0076\u0069\u0020\u0074\u0072\u0075\u006e\u0067\u0020\u0062\u00ec\u006e\u0068",
                                          "\u0054\u1ef7\u0020\u006c\u1ec7\u0020\u0074\u0072\u1ee5\u0063\u0020\u0028\u0041\u0073\u0070\u0065\u0063\u0074\u0020\u0072\u0061\u0074\u0069\u006f\u0029",
                                          "\u0110\u1ed9\u0020\u0074\u0072\u00f2\u006e\u0020\u0028\u0046\u006f\u0072\u006d\u0020\u0066\u0061\u0063\u0074\u006f\u0072\u0029",
                                          "\u0053\u1ed1\u0020\u006c\u01b0\u1ee3\u006e\u0067\u0020\u006e\u0068\u00e1\u006e\u0068",
                                          "\u0110\u1ed9\u0020\u0064\u00e0\u0069\u0020\u006e\u0068\u00e1\u006e\u0068\u0020\u0074\u0072\u0075\u006e\u0067\u0020\u0062\u00ec\u006e\u0068",
                                          "\u0053\u1ed1\u0020\u006c\u01b0\u1ee3\u006e\u0067\u0020\u006e\u00fa\u0074\u0020\u0067\u0069\u0061\u006f\u0020\u0063\u00e1\u0063\u0020\u006e\u0068\u00e1\u006e\u0068",
                                          "\u0053\u1ed1\u0020\u006c\u01b0\u1ee3\u006e\u0067\u0020\u0111\u1ea7\u0075\u0020\u006d\u00fa\u0074"),
                          y.lab.graph = c("\u0044\u0069\u1ec7\u006e\u0020\u0074\u00ed\u0063\u0068\u0020\u0028\u00b5\u006d\u00B2\u0029",
                                          "\u0043\u0068\u0075\u0020\u0076\u0069\u0020\u0028\u00b5\u006d\u0029",
                                          "",
                                          "",
                                          "\u0053\u1ed1\u0020\u006e\u0068\u00e1\u006e\u0068\u002f\u0074\u0079\u0020\u0074\u0068\u1ec3",
                                          "\u0043\u0068\u0069\u1ec1\u0075\u0020\u0064\u00e0\u0069\u0020\u006d\u1ed7\u0069\u0020\u006e\u0068\u00e1\u006e\u0068\u0020\u0028\u00b5\u006d\u0029",
                                          "\u0053\u1ed1\u0020\u006e\u00fa\u0074\u0020\u0067\u0069\u0061\u006f\u002f\u0074\u0079\u0020\u0074\u0068\u1ec3",
                                          "\u0053\u1ed1\u0020\u0111\u1ea7\u0075\u0020\u006d\u00fa\u0074\u0020\u006e\u0068\u00e1\u006e\u0068\u002f\u0074\u0079\u0020\u0074\u0068\u1ec3"))
  Parameter
  
  for (i in x){
    print(i)
    
    
    ii <- vlookup(i,Parameter,"col1","col2")
    title.graph <- vlookup(i,Parameter,"col1","title.graph")
    y.lab.graph <- vlookup(i,Parameter,"col1","y.lab.graph")
    print(ii)
    print(title.graph)
    print(y.lab.graph)
    
    DC <- dc[,ii]
    DCC <- dcc[,ii]
    KD <- kd[,ii]
    KDC <- kdc[,ii]
    
    data.mito <- data.frame(Y=c(DC, DCC, KD, KDC),
                            strains = factor(rep(c("DC", "DC+C", "KD", "KD+C"), 
                                                 times=c(length(DC), 
                                                         length(DCC), 
                                                         length(KD), 
                                                         length(KDC)))))
    data.mito 
    attach(data.mito)
    
    #descriptive statistics:
    
    #+++++++++++++++++++++++++
    # Function to calculate the mean and the standard deviation
    # for each group
    #+++++++++++++++++++++++++
    # data : a data frame
    # varname : the name of a column containing the variable
    #to be summariezed
    # groupnames : vector of column names to be used as
    # grouping variables
    data_summary <- function(data, varname, groupnames){
      require(plyr)
      summary_func <- function(x, col){
        c(mean = mean(x[[col]], na.rm=TRUE),
          sd = sd(x[[col]], na.rm=TRUE))
      }
      data_sum<-ddply(data, groupnames, .fun=summary_func,
                      varname)
      data_sum <- rename(data_sum, c("mean" = varname))
      return(data_sum)
    }
    
    data.mito.sum <- data_summary(data.mito,varname = "Y",groupnames = "strains")
    data.mito.sum
    data.mito.sum$strains = as.factor(data.mito.sum$strains)
    head(data.mito.sum)
    
    
    
    
    
    aov.data <- aov(Y~strains,data=data.mito)
    
    
    
    #Mean comparation by ANOVA or Kruskal-Wallis test
    if(shapiro.test(resid(aov.data))$p.value > 0.050){
      if(fligner.test(Y~as.factor(strains),data = data.mito)$p.value > 0.05){
        aov.p <- anova(aov.data)$Pr
        print("One-way ANOVA")
        print(paste("AOV P.value = ",aov.p))
      } else {
        library(onewaytests)
        aov.p <- bf.test(Y~strains, data.mito)$p.value
        print("Brown-Forsythe test")
        print(paste("AOV P.value = ",aov.p))
      }
    } else {
      aov.p <- kruskal.test(Y~strains, data.mito)$p.value
      print("Kruskal-Wallis test")
      print(paste("AOV P.value = ",aov.p))
    }
    
    aov.p
    
    #Draw bar chart
    
    library(ggplot2)
    library(ggsignif)
    library(magrittr)
    library(ggpubr)
    graph <- ggplot(data.mito.sum,  aes(x=strains, y=Y, fill = strains)) +
      geom_bar(stat="identity", color="black", 
               position=position_dodge(width=0.2),
               width = 0.8) +
      geom_errorbar(aes(ymin=Y, ymax=Y+sd), width=.2,
                    position=position_dodge(.9)) +
      theme_classic()+
      theme(plot.margin = unit(c(0.2,0.2,0.2,0.2),"cm"))+
      theme(legend.position="none")
    
    #t.test strains
    lookupStrains <- data.frame(j = c(1:4),
                                a=c("DC","KD","DC","DC"),
                                b=c("DC+C","KD+C","KD","KD+C"))
    
    find.max <- c(mean(DC)+sd(DC),mean(KD)+sd(KD),mean(DCC)+sd(DCC),mean(KDC)+sd(KDC))
    pos=max(find.max)
    
    
    library(lookup)
    
    k <- (1:4)
    for(j in k){
      a <- vlookup(j,lookupStrains,"j","a")
      b <- vlookup(j,lookupStrains,"j","b")
      print(a)
      print(b)
      
      x1 <- subset(data.mito$Y,strains==a)
      x2 <- subset(data.mito$Y,strains==b)
      
      if(shapiro.test(x1)$p > 0.05 &
         shapiro.test(x2)$p > 0.05){
        graph<-graph+stat_compare_means(data = data.mito,
                                        comparisons = list(c(a,b)),
                                        method = "t.test",
                                        symnum.args <- list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1), 
                                                            symbols = c("****", "***", "**", "*", "ns")),
                                        label.y = pos+pos/10*j,
                                        label = "p.format")
      } else {
        graph<-graph+stat_compare_means(data = data.mito,
                                        comparisons = list(c(a,b)),
                                        method = "wilcox.test",
                                        symnum.args <- list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1), 
                                                            symbols = c("****", "***", "**", "*", "ns")),
                                        label.y = pos+pos/10*j,
                                        label = "p.format")
      }
    }
    graph <- graph+labs(title=title.graph,y=y.lab.graph,x=d)+
      scale_y_continuous(expand = expansion(mult = c(0, 0.05)))+
      theme(legend.background = element_rect(fill = "transparent"),
            legend.box.background = element_rect(fill = "transparent"),
            panel.background = element_rect(fill = "transparent"),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            plot.background = element_rect(fill = "transparent",
                                           color = NA))
    print(graph)
    ggsave(paste(i,"formatted Pvalue.png"),path = savepath,bg = "white",width=3,height=4)
    
  }
}