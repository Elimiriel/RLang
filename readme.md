# RLang

* Pro: performance
* Cons: hard to sync to the web
* Development
  * [R studio](https://posit.co/download/rstudio-desktop/) is the basic IDE: requires [R conversation interpreter](https://cran.rstudio.com)
  * MSVC plugin settings
* MSVC: .net framework 7.* and set system path are required

## env settings

soft-wrap: limit contents in width, no scrollbar

install.packages("name")

## Basic Grammar/Concepts

library(pack): include/import

### var declaration

types: numeric, string(auto in def)

* name<-var
* name=var is not recommended; = is put var into functions
* c(ielements:eelements), seq(iel:eel, by=interval)
* list(key=value, ....)

### Dataframe

Tabled structed data like Excel and DB

### Operation

* =-*/: applied to all each corelated ind elements

### function

print(var) | var: like python interpreter

function grammar forms are simillar to Excel, but name could be diff

* mean(tvar)): ave
* sum()
* var(): distrivution
* paste(data, collapse=saparator)
* view(): show data as visual table

#### ggplot2

* qplot(data, x=colname, y=colname): default: counts
* (var) mpq: example data
* view(data): table viewer
* basic analyze: label non-ordinary if data are out of standard distribution

#### readxl

* read_excel(relative_path, col_names): force read all 1 row as colnames, all 2+ rows are data in default(col_names=T)
  * only data if col_names is F
  * pick a sheet in multiple sheets, add sheet=#num_order
* read_csv
* read_sav
* read_txt

#### writexl

* write_{filetype}(dataframe or list(each will be sheets), path)

## Basic Data Manipulation

## Analysis
