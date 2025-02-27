install.packages("rvest")
install.packages("stringr")
library(rvest)
library(stringr)

url <- "https://en.prothomalo.com/international/south-asia/s93mpidt19"
webpage <- read_html(url)

text_data <- webpage %>%
  html_nodes("p") %>%    
  html_text()

print(text_data)

install.packages("tm")
library(tm)

corpus <- Corpus(VectorSource(text_data))

inspect(corpus)

corpus <- tm_map(corpus, content_transformer(tolower)) 
print(corpus)
corpus <- tm_map(corpus, removePunctuation)           
corpus <- tm_map(corpus, removeNumbers)                
corpus <- tm_map(corpus, stripWhitespace)             

install.packages("tokenizers")
library(tokenizers)

tokens <- tokenize_words(as.character(text_data))
print(tokens)


corpus <- tm_map(corpus, removeWords, stopwords("en"))


install.packages("SnowballC")
library(SnowballC)

corpus <- tm_map(corpus, stemDocument)


install.packages("textstem")
library(textstem)

lemmatized <- lemmatize_words(as.character(corpus))
print(lemmatized)

library(tm)
corpus <- Corpus(VectorSource(text_data))

expand_contractions <- function(text) {
  text <- gsub("can't", "cannot", text)
  text <- gsub("won't", "will not", text)
  text <- gsub("'re", " are", text)
  text <- gsub("'ve", " have", text)
  text
}

corpus <- tm_map(corpus, content_transformer(expand_contractions))

install.packages("stringi")
library(stringi)

remove_emojis <- function(text) {
  text <- stri_replace_all_regex(text, "[\U0001F600-\U0001F64F]", "")
  text
}

corpus <- tm_map(corpus, content_transformer(remove_emojis))

install.packages("hunspell")
library(hunspell)

check_spelling <- function(text) {
  words <- unlist(strsplit(text, "\\s+"))
  corrected <- hunspell_check(words)
  suggestions <- hunspell_suggest(words[!corrected])
  return(suggestions)
}

spelling_suggestions <- check_spelling(as.character(corpus[[1]]))
print(spelling_suggestions)

inspect(corpus)
