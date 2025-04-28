library(readxl);
library(ggplot2);
library(writexl);
#excl_load=read_excel("data0425\\excel_exam.xlsx", sheet="Sheet1", col_names=TRUE, col_types=NULL, na="", skip=0);
#print(excl_load);
#write.csv(excl_load, file="data0425\\excel_exam.csv", fileEncoding="UTF-8");
excl_load=read_excel("data0425\\selfgen_rand.xlsx", sheet=1);
excl_load2=read_excel("data0425\\selfgen_rand.xlsx", sheet=2);
framed=data.frame(excl_load, excl_load2[2:ncol(excl_load2)], row.names = excl_load[[1]]);
cstdevs<-rep(0, ncol(framed));
rstdevs<-rep(0, ncol(framed));
for(i in 1:ncol(framed)) {
    cstdevs[i]<=sd(framed[1:nrow(framed), i]);
    rstdevs[i]<-sd(framed[i, 1:ncol(framed)]);
    }
outlist<-list(framed_data=framed, col_stdev=data.frame(cstdevs), row_stdev=data.frame(rstdevs));

write_xlsx(outlist, "data0425\\selfgen_analysis.xlsx");