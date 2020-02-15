#' ---
#' title: "Rolling Stone 500 - sales data"
#' output: html_notebook
#' ---
#' 
#' This script uses the [_Rolling Stone's_ 500 Greatest Albums of All Time](https://en.wikipedia.org/wiki/Rolling_Stone%27s_500_Greatest_Albums_of_All_Time) (2012 version) to generate a fake sales order.
#' 
#' Data source is 
#' 
#' * https://data.world/notgibs/rolling-stones-top-500-albums
#' 
#' * download link https://query.data.world/s/sc4hbemuc4htolfcah7fs7l2oukegq
#' 
#' 
## ----setup---------------------------------------------------------------

library(tidyverse)

library(glue)
library(lubridate)


#' 
#' 
#' ## Read data
#' 
## ------------------------------------------------------------------------

albumlist <- read_csv("data/albumlist.csv")

albumlist50 <- albumlist %>%
  filter(Number < 51)

#albumlist50

# fix genre (note: these categories are accurate, not precise)

genre_rev <- c("classic rock", "classic rock", "classic rock", "classic rock", "classic rock", 
               "soul-r&b-funk", "classic rock", "punk-new wave", "classic rock", "classic rock", 
               "rock & roll", "jazz", "classic rock", "classic rock", "classic rock",
               "classic rock", "alternative", "rock", "classic rock", "soul-r&b-funk",
               "rock & roll", "blues", "classic rock", "soul-r&b-funk", "soul-r&b-funk",
               "rock", "alternative", "classic rock", "classic rock", "folk rock",
               "folk rock", "classic rock", "punk-new wave", "classic rock", "rock", 
               "folk rock", "rock", "blues", "rock & roll", "classic rock", 
               "punk-new wave", "classic rock", "rock", "punk-new wave", "classic rock",
               "reggae", "jazz", "rap", "rock", "rock & roll")

albumlist50 <- cbind(genre_rev, albumlist50)

albumlist50 <- albumlist50 %>%
  mutate(price =
           case_when(
             genre_rev == "classic rock" ~ 5.99,
             genre_rev == "rock" ~ 6.49,
             genre_rev == "jazz" ~ 6.99,
             genre_rev == "blues" ~ 6.99,
             TRUE ~ 7.99
           ))

#albumlist50 %>%
#  group_by(genre_rev) %>%
#  tally()


#' 
#' ## _add price, accurate genre_
#' 
#' 
#' ## Generate customer (store) ID table
#' 
#' Note: store list is defunct record retailers, active in the 80s and 90s, from [Wikipedia List of defunct Canadian companies](https://en.wikipedia.org/wiki/List_of_defunct_Canadian_companies#Consumer_retail,_including_grocery)
#' 
#' * HMV was left off, as it was an international brand that was late to the market
#' 
## ------------------------------------------------------------------------

chainlist <- c("A&A", "A&B", "Kelly's", "Sam The Record Man")
regionlist <- c("north", "east", "south", "west")

ndf = 10

storelist <- data.frame(
  store.id = 100:(ndf+99),
  chain = sample(chainlist, ndf, replace = TRUE),
  region = sample(regionlist, ndf, replace = TRUE, prob = c(0.4, 0.3, 0.2, 0.1))
  )

storelist <-
storelist %>%
  mutate(store.id = as.character(glue('X{store.id}')))

#storelist


#' 
#' ## Create order
#' 
#' ### order date
#' 
#' https://cran.r-project.org/web/packages/lubridate/vignettes/lubridate.html
#' 
## ----orderdate_fun-------------------------------------------------------

jan01 <- ymd("2019-01-01")

startdate <- as_date(floor_date(jan01, "year"))
enddate <- as_date(ceiling_date(jan01, "year") - days(1))

daterange <- tibble(orderdate = as_date(c(startdate:enddate)))
daterange2 <- as_date(c(startdate:enddate))

orderdate_fun <- function(){ 
daterange %>%
  sample_n(1) %>%
  pull(orderdate) 
}  

#orderdate <- orderdate_fun()
#orderdate

#order_final %>%
#  mutate(orderdate = orderdate)


#' 
## ----order_mean_fun------------------------------------------------------

# assign order volume based on quarter (derived from month)
#
#order_qtr <- quarter(orderdate)
#order_qtr
#
#order_mean <- case_when(
#  order_qtr == 1 ~ 4,
#  order_qtr == 4 ~ 6,
#  TRUE ~ 5
#)
#
#order_mean

order_mean_fun <- function(orderdate){
  order_qtr <- quarter(orderdate)
  order_mean <- case_when(
    order_qtr == 1 ~ 4,
    order_qtr == 4 ~ 6,
    TRUE ~ 5
  )
}


#' 
#' 
## ----store_order_fun-----------------------------------------------------

store_order <- function(){ 
storelist %>%
  sample_n(1) %>%
  pull(store.id) 
}  

#order_final %>%
#  mutate(store.id = store_1())



#' 
#' 
#' ### album_order_fun
#' 
## ----album_order_fun-----------------------------------------------------

album_order_fun <- function(...){
#  orderdate <- orderdate
#  store.id <- store.id
  sample_n(albumlist50, 1) %>%
    select(Artist, Album, price) %>%
  mutate(format = sample(c("lp", "cass"), 1, prob = c(0.33, 0.67)),
         qty = rpois(1, 4))
  
#  ,
#         orderdate = `orderdate`,
#         store.id = `store.id`)
}


# TEST
#album_order_fun()



#' 
#' 
#' ### multiples
#' 
## ------------------------------------------------------------------------
# TEST

store.id <- storelist %>%
  sample_n(1) %>%
  pull(store.id) 

orderdate <- as_date(sample(daterange2, 1))


n = rpois(1, 7)
order_final <- data.frame(Artist = as.character(),
                          Album = as.character(),
                          price = as.double(),
                          format = as.character(),
                          qty = as.integer(),
                          orderdate = as_date(as.character()),
                          store.id = as.character(),
                          stringsAsFactors = FALSE)  
#ls.str(order_final)
#rbind(order_final, order_fun())
#orderdate <- orderdate_fun()
#store.id <- store_order()  


for(i in 1:n){
  order_final[i, ] <- album_order_fun()
}

order_final


#' 
#' 
#' 
## ------------------------------------------------------------------------

order_fun <- function(...){
  
  store.id <- storelist %>%
    sample_n(1) %>%
    pull(store.id) 

  orderdate <- as_date(sample(daterange2, 1))
  
  order_qtr <- quarter(orderdate)
  order_mean <- case_when(
    order_qtr == 1 ~ 4,
    order_qtr == 4 ~ 6,
    TRUE ~ 5
  )
  
  
  n = rpois(1, order_mean)
  
  order_final <- data.frame(Artist = as.character(),
                            Album = as.character(),
                            price = as.double(),
                            format = as.character(),
                            qty = as.integer(),
                            orderdate = as_date(as.character()),
                            store.id = as.character(),
                            stringsAsFactors = FALSE)
  for(i in 1:n){
    order_final[i, ] <- album_order_fun()
    }
  order_final
  }



#' 
#' run an order
#' 
## ------------------------------------------------------------------------

order_fun()


#' 
#' 
#' # next!
#' 
#' * nest this inside a tibble with the store.id and date fields
#' 
#' https://tidyr.tidyverse.org/reference/nest.html
#' 
#' https://rstudio-education.github.io/tidyverse-cookbook/transform-tables.html 
#' 
#' 
#' 
#' 
#' 
#' * next that inside a bigger object
#' 
#' 
#' 
#' 
#' 
