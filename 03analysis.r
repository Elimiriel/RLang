library(magrittr)
library(dplyr);
library(readxl);
library(ggplot2);
library(writexl);
# dplyr: data preprocessor. else, lots of hard works waits.
#filter() # filter rows by condition
#select() # select columns by condition
#mutate() # add new columns by condition
#arrange() # sort rows by condition
#summarise() # summarise data by condition
#group_by() # group data by condition
#rename() # rename columns by condition


# Analysis
csvread<-read.csv("data0425/csv_exam.csv", header=TRUE, fileEncoding="UTF-8-BOM");
#obj as row, var as column # nolint: semicolon_linter.

#head(csvread, n=6) # show the first 6(default) rows of the data frame
#tail(csvread, n=6) # show the last 6(default) rows of the data frame

#print(csvread) # print the data frame
#cat(csvread) # print the data frame
#View(csvread) # open the data frame in a new tab
#str(csvread) # show the data type structure of the data frame
#summary(csvread) # show the summary of the data frame: min, max, mean, median, 1st and 3rd quartiles(1/4, 3/4: 보간), and number of missing values by column
View(csvread);
str(csvread);
summary(csvread);

#dim(csvread) # show the dimensions of the data frame
#names(csvread) # show the names of the columns in the data frame
#colnames(csvread) # show the column names of the data frame
#rownames(csvread) # show the row names of the data frame
#nrow(csvread) # show the number of rows in the data frame
#ncol(csvread) # show the number of columns in the data frame
#length(csvread) # show the length of the data frame
dim(csvread);

#as.data.frame() # convert a list to a data frame: rowvalues are declared and indexed
mpg=data.frame(ggplot2::mpg);
#dataset: subdata of dataframe
df_rw<-data.frame(data1=c(1, 2, 1), data2=c(2, 3, 2));
#copied var to keep the original data frame
df_new<-df_rw;

df_new<-rename(df_new, v2=data2, v1=data1); # rename the columns of the data frame

#calculations: by element
df_new$varsum<-df_new$v2+df_new$v1; # add the two columns of the data frame, and store the result in a new column: generated var

mpg$avgcost<-(mpg$cty+mpg$hwy)/2;
summary(mpg$avgcost);

hist=hist(mpg$avgcost, breaks=10, col="red", xlab="avgcost", ylab="Frequency", main="Histogram of avgcost"); # histogram of the average cost
#ggplot(mpg$hist);
# condition to col, and condition to row
mpg$cond1<-ifelse(mpg$avgcost>20, "high", "low"); # add a new column to the data frame: high or low
mpg$grade<-ifelse(mpg$avgcost>30, "A", 
                    ifelse(mpg$avgcost>20, "B", ifelse(mpg$avgcost>10, "C", "D")));
table(mpg$cond1);
#ggplot2(mpg$cond1);

category <- c("product", "price", "sold", "stock")
a <- c("A", 1000, 30, 70)
b <- c("B", 1500, 20, 50)
c <- c("C", 800, 50, 30)
d <- c("D", 2000, 10, 90)
e <- c("E", 500, 100, 10)
sales_data <- rbind(a, b, c, d, e)
colnames(sales_data) <- category
sales <- as.data.frame(sales_data)
sales$price <- as.numeric(sales$price)
sales$sold <- as.numeric(sales$sold)
sales$stock <- as.numeric(sales$stock)
sales$total <- sales$price * sales$sold
sales$stock_status <- ifelse(sales$stock > 20, "Enough", "Low")
summary(sales$total)
#hist(sales$total)

category <- c("id", "area(m^{2})", "price(10000KRW)", "floors")
apt1 <- c("1", 85, 45000, 10)
apt2 <- c("2", 60, 30000, 5)
apt3 <- c("3", 120, 60000, 15)
apt4 <- c("4", 45, 25000, 3)
apt5 <- c("5", 100, 50000, 12)
apartments <- as.data.frame(rbind(apt1, apt2, apt3, apt4, apt5))
colnames(apartments) <- category

# convert area to pyeong
#apartments$"area(평)" <- apartments$"area(m^{2})" * 0.3025
apartments$plevel <- ifelse(apartments$"area(m^{2})" > 50000, "high", "normal")
apartments$flevel <- ifelse(apartments$floors > 10, "high", "normal")

summary(apartments$price)
#hist(as.numeric(apartments$price))

#rm(list=ls()) # remove all objects from the environment
#filtering: less $ use
#`%>%`
#sessionInfo() # show the information of the session
exam2 <- read.csv("data0425/csv_exam.csv", header = TRUE, fileEncoding = "UTF-8-BOM")
# Pipe operator: %>%. Connect the output of one function 
# to the input of another function.
class1 <- exam2 %>% dplyr::filter(exam2$class == 1)
classe <- exam2 %>% dplyr::filter(exam2$class != 1)
#logical characteristics: ==, !=, >, <, >=, <=, &, |
# %in%: condition in a set/list, like python
sel1<-select(class1, math, english) # select columns by condition
sel2<-select(class1, -math) # select columns by condition: except math
#or
sel1<-class1 %>% select(math, english) # select columns by condition
sel2<-class1 %>% select(-math) # select columns by condition: except math

sel3 <- exam2 %>%
    filter(`class` == 1) %>%
    select(english)
sel3<-exam2 %>% 
    select(`class`==1) %>%
    select(english)

sel4<-exam2 %>% 
    head(select(id, math), 10)

#adding var by dplyr
sel5<-exam2 %>% 
    mutate(total=math+english+science) %>% 
    select(id, total) # add a new column to the data frame: total and save id and total into sel5
sel6<-exam2 %>%
    mutate(spass=ifelse(science>=6, "pass", "fail")) %>%
    head()

library(magrittr)
library(dplyr);
library(readxl);
library(ggplot2);
library(writexl);
id<-c(1:5);
name<-c("Alice", "Bob", "Charlie", "David", "Eve");
math<-c(90, 70, 95, 60, 88);
english<-c(85, 80, 70, 90, 88);

studentss<-data.frame(id, name, math, english);
studentss<-studentss %>%
    mutate(avg_ME=sum(math, english)/2);
studentss<-studentss %>%
    mutate(grade=ifelse(avg_ME>=90, "A", 
                 ifelse(avg_ME>=80, "B", 
                        ifelse(avg_ME>=70, "C", 
                               ifelse(avg_ME>=60, "D", "F")))));
out=studentss %>%
    filter(grade=="C") %>%
    select(id, name, avg_ME, grade);
print(out); # show the data frame in a new tab

name=c("Alice", "Bob", "Charlie", "David", "Eve");
department=c("Computer Science", "Physics", "Mathematics", "Chemistry", "Biology");
korean=c(95, 85, 100, 90, 80);
english=c(88, 78, 85, 92, 84);
math=c(90, 75, 98, 85, 89);
professor=c("Prof. Lee", "Prof. Kim", "Prof. Kim", "Prof. Park", "Prof. Choi");
studentsss<-data.frame(name, department, korean, english, math, professor);
kmaxp<-studentsss %>%
    filter(korean==max(korean)) %>%
    select(name, professor);
print(kmaxp);
pkemin<-studentsss%>%
    filter(english==min(english)) %>%
    select(name, professor);
print(pkemin);


#is.data.frame(csvread) # check if the object is a data frame
#is.matrix(csvread) # check if the object is a matrix
#is.vector(csvread) # check if the object is a vector
#is.list(csvread) # check if the object is a list
#is.factor(csvread) # check if the object is a factor
#is.numeric(csvread) # check if the object is a numeric
#is.integer(csvread) # check if the object is an integer
#is.character(csvread) # check if the object is a character
#is.logical(csvread) # check if the object is a logical
#is.complex(csvread) # check if the object is a complex
#is.raw(csvread) # check if the object is a raw
#is.na(csvread) # check if the object is NA
#is.nan(csvread) # check if the object is NaN
#is.infinite(csvread) # check if the object is infinite
#is.finite(csvread) # check if the object is finite
#is.null(csvread) # check if the object is NULL
#isTRUE(csvread) # check if the object is TRUE
#isFALSE(csvread) # check if the object is FALSE
#isTRUEorFALSE(csvread) # check if the object is TRUE or FALSE
