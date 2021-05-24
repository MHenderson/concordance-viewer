concordance <- function(corpus, search_term, left = -50, right = 50) {
  x <- corpus %>%
    corpus::corpus_frame() %>%
    corpus::text_locate(search_term) %>%
    dplyr::mutate(
      before = as.character(before) %>% stringr::str_sub(start = left),
      instance = as.character(instance),
      after = as.character(after) %>% stringr::str_sub(end = right)
    )
  x$title <- as.factor(corpus$title[as.numeric(x$text)])
  x$author <- as.factor(corpus$author[as.numeric(x$text)])
  return(x %>% dplyr::select(title, before, instance, after, author))
}
