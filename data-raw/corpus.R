
library(dhlawrencer)
library(gutenbergr)
library(tidyverse)
library(corpus)

lawrence_corpus <- lawrence_books() %>%
  group_by(book) %>%
  summarise(
    text = paste(text, collapse = " ")
  )

eliot_corpus <- gutenberg_corpus(c(145, 550, 6688))

saveRDS(lawrence_corpus, file = here::here("data", "lawrence_corpus.rds"))
saveRDS(eliot_corpus, file = here::here("data", "eliot_corpus.rds"))
