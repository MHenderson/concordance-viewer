concordance <- function(corpus, search_term, left = -50, right = 50) {
  x <- corpus %>%
    corpus_frame() %>%
    text_locate(search_term) %>%
    mutate(
      before = as.character(before) %>% str_sub(start = left),
      instance = as.character(instance),
      after = as.character(after) %>% str_sub(end = right)
    )
  x$title <- as.factor(corpus$title[as.numeric(x$text)])
  x$author <- as.factor(corpus$author[as.numeric(x$text)])
  return(x %>% select(title, before, instance, after, author))
}
