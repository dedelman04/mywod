wods <- read_delim("wods.txt", delim="|", col_names=FALSE)

tables <- read_csv("structure.txt", col_names=FALSE)

clean_tabs <- tables[tables$X1 %like% "CREATE TABLE",]

tab_names <- clean_tabs %>% separate(col=X1, into=c("Keep", NA),
                                        sep="[:punct:]") %>%
  separate(col="Keep", c(NA, NA, "TabName", sep=" ")) %>% .$TabName
