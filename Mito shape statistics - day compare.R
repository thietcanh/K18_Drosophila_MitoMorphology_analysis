setwd("D:/Results/2D per Cell")

#loop strain
#loop parameter
#input-day
lines <- list("DC","DC+C","KD","KD+C")
for (line in lines){
  rL <- read.csv(paste("2D",line,"Larvae - per Cell.csv"),header = T)
  r01 <- read.csv(paste("2D",line,"01 - per Cell.csv"),header = T)
  r05 <- read.csv(paste("2D",line,"05 - per Cell.csv"),header = T)
  r10 <- read.csv(paste("2D",line,"10 - per Cell.csv"),header = T)
  r15 <- read.csv(paste("2D",line,"15 - per Cell.csv"),header = T)
  r20 <- read.csv(paste("2D",line,"20 - per Cell.csv"),header = T)
  r25 <- read.csv(paste("2D",line,"25 - per Cell.csv"),header = T)
  r30 <- read.csv(paste("2D",line,"30 - per Cell.csv"),header = T)
  
  attach(rL)
  attach(r01)
  attach(r05)
  attach(r10)
  attach(r15)
  attach(r20)
  attach(r25)
  attach(r30)
  
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
    
    library(lookup)
    ii <- vlookup(i,Parameter,"col1","col2")
    title.graph <- vlookup(i,Parameter,"col1","title.graph")
    y.lab.graph <- vlookup(i,Parameter,"col1","y.lab.graph")
    print(ii)
    print(title.graph)
    print(y.lab.graph)
    
    Larvae <- rL[,ii]
    Fly01 <- r01[,ii]
    Fly05 <- r05[,ii]
    Fly10 <- r10[,ii]
    Fly15 <- r15[,ii]
    Fly20 <- r20[,ii]
    Fly25 <- r25[,ii]
    Fly30 <- r30[,ii]
    
    data.by.days <- data.frame(Y=c(Fly01,Fly05,Fly10,Fly15,Fly20,Fly25,Fly30),
                               days = factor(rep(c("1","5","10","15","20","25","30"), 
                                                 times=c( 
                                                         length(Fly01), 
                                                         length(Fly05), 
                                                         length(Fly10),
                                                         length(Fly15),
                                                         length(Fly20),
                                                         length(Fly25),
                                                         length(Fly30)))))
    data.by.days 
    attach(data.by.days)
    
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
    
    data.mito.sum <- data_summary(data.by.days,varname = "Y",groupnames = "days")
    data.mito.sum
    data.mito.sum$days = as.factor(data.mito.sum$days)
    head(data.mito.sum)
    
    #Draw bar chart
    
    library(ggplot2)
    library(ggsignif)
    library(magrittr)
    library(ggpubr)
    graph <- ggplot(data.mito.sum,  aes(x=factor(days,level = c('\u1ea4\u0075\u0020\u0074\u0072\u00f9\u006e\u0067','1','5','10','15','20','25','30')), y=Y, fill = "cyan")) +
      geom_bar(stat="identity", color="black", 
               position=position_dodge(width=0.2),
               width = 0.8) +
      geom_errorbar(aes(ymin=Y, ymax=Y+sd), width=.2,
                    position=position_dodge(.9)) +
      theme_classic()+
      theme(plot.margin = unit(c(0.2,0.2,0.2,0.2),"cm"))+
      theme(legend.position="none")
    
    #t.test strains
    lookupStrains <- data.frame(j = c(1:6),
                                a=c("1","5","10","15","20","25"),
                                b=c("5","10","15","20","25","30"))
    
    find.max <- c(mean(Fly01)+sd(Fly01),mean(Fly05)+sd(Fly05),mean(Fly10)+sd(Fly10),mean(Fly15)+sd(Fly15),mean(Fly20)+sd(Fly20),mean(Fly25)+sd(Fly25),mean(Fly30)+sd(Fly30))
    pos=max(find.max)
    
    k <- (1:6)
    for(j in k){
      a <- vlookup(j,lookupStrains,"j","a")
      b <- vlookup(j,lookupStrains,"j","b")
      print(a)
      print(b)
      
      x1 <- subset(data.by.days$Y,days==a)
      x2 <- subset(data.by.days$Y,days==b)
      
      if(shapiro.test(x1)$p > 0.05 &
         shapiro.test(x2)$p > 0.05){
        graph<-graph+stat_compare_means(data = data.by.days,
                                        comparisons = list(c(a,b)),
                                        method = "t.test",
                                        symnum.args <- list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1), 
                                                            symbols = c("****", "***", "**", "*", "ns")),
                                        label.y = pos+pos/10*j,
                                        label = "p.signif")
      } else {
        graph<-graph+stat_compare_means(data = data.by.days,
                                        comparisons = list(c(a,b)),
                                        method = "wilcox.test",
                                        symnum.args <- list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1), 
                                                            symbols = c("****", "***", "**", "*", "ns")),
                                        label.y = pos+pos/10*j,
                                        label = "p.signif")
      }
    }
    graph <- graph+labs(title=title.graph,y=y.lab.graph,x=line)+
      scale_y_continuous(expand = expansion(mult = c(0, 0.05)))+
      theme(legend.background = element_rect(fill = "transparent"),
            legend.box.background = element_rect(fill = "transparent"),
            panel.background = element_rect(fill = "transparent"),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            plot.background = element_rect(fill = "transparent",
                                           color = NA))
    print(graph)
    ggsave(paste(i,line,".png"),path = "D:/Results/Graph/Mito by days/resize3x4 except larvae",bg = "white",width=3,height=4)
  }
}
