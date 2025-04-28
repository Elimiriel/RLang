library(ggplot2);
#view(mpq);

# p77#
stud<-c(80, 60, 70, 50, 90);
alavg=mean(stud);
print(alavg);

# dataframe
name=c("John", "Mary", "Tom", "Jane");
english=c(90, 80, 70, 60);
math=c(50, 60, 100, 20);
class=c(1, 1, 2, 2);
df_midterm=data.frame(row.names=name, english, math);# if x(row.names) is not set, then rows are as nums. inside, use =
df_midterm$class<-class;#adding a column to the data frame
#scoretable<-df_midterm+class;#inserting is possible
escore=df_midterm$english;#col selection: should be reviewed due to 'operator invalid for atomic vectors'
namesum=df_midterm[1, 2]+df_midterm[1, 3];#row selection: like indexing, start from 1
print(df_midterm);

# p87
products<-c("사과", "딸기", "수박");
prices<-c(1800, 1500, 3000);
amounts<-c(24, 38, 13);
dftable=data.frame(row.names=products, prices, amounts);
dim(dftable$products)<-c(4, 1)
dim(dftable$prices)<-c(4, 1)
dim(dftable$amounts)<-c(4, 1)
dftable$prices[4]=mean(dftable$prices);#dynamic adjustment like dftable$prices[4]=mean(dftable$prices); is not possible
dftable$amounts[4]=mean(dftable$amounts);
print(dftable);