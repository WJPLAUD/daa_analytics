install.packages("dplyr")
install.packages("rvest")

library(rvest)
library(dplyr)

#download selector gadget for your web browser

link = "https://www.imdb.com/search/title/?title_type=feature&num_votes=250000,&sort=moviemeter,desc"
page = read_html(link)

# webscrapping titles, years, ratings, and synopsis
name = page %>% html_nodes(".lister-item-header a , #top_ad") %>% html_text()
year = page %>% html_nodes("#top_ad , .text-muted.unbold") %>% html_text()
rating = page %>% html_nodes(".ratings-imdb-rating strong , #top_ad") %>% html_text()
synopsis = page %>% html_nodes(".ratings-bar+ .text-muted") %>% html_text()

movies = data.frame(name, year, rating, synopsis, stringsAsFactors = FALSE)
write.csv(movies, "movies.csv")
