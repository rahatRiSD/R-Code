# Install necessary packages if not already installed
install.packages(c("tm", "textclean", "qdap", "hunspell", "SnowballC"))

# Load libraries
library(tm)
library(textclean)
library(qdap)
library(hunspell)
library(SnowballC)


# Input the given data as raw text
text_data <- "The International Criminal Court's chief prosecutor on Wednesday asked judges to grant an arrest warrant for Myanmar's junta chief Min Aung Hlaing over alleged crimes against humanity committed against Rohingya Muslims.
Karim Khan's request to the court's Hague-based judges is the first application for an arrest warrant against a high-level Myanmar government official in connection with abuses against the Rohingya people.
After an extensive, independent and impartial investigation, my office has concluded that there are reasonable grounds to believe that Senior General and Acting President Min Aung Hlaing... bears criminal responsibility for crimes against humanity,Khan said in a statement.
This included crimes of deportation and persecution, allegedly committed between 25 August and 31 December 2017, Khan added.

Myanmar's junta rejected the prosecutor's move, saying that as the country is not a member of the court, the statements of the ICC have never been recognised.
The ICC prosecutor in 2019 opened a probe into suspected crimes committed against the Rohingya in Myanmar's restive Rakhine state in 2016 and 2017, that prompted the exodus of 750,000 of the Muslim minority in the southeast Asian country to neighbouring Bangladesh.
About one million Rohingya now live in sprawling camps near the Bangladesh border city of Cox's Bazaar. Many of those who left accuse the Myanmar military of mass killings and rapes.

'More will follow'
Khan said the alleged crimes were committed by Myanmar's armed forces, the Tatmadaw, supported by the national and border police as well as non-Rohingya citizens.

This is the first application for an arrest warrant against a high-level Myanmar government official, Khan said.
More will follow, warned the prosecutor.
Myanmar has been racked by conflict between the military and various armed groups opposed to its rule since the army ousted Aung San Suu Kyi's elected government in February 2021.

The junta is reeling from a major rebel offensive last year that seized a large area of territory, much of it near the border with China.
Earlier this month, Min Aung Hlaing told China's Premier Li Qiang that the military was ready for peace if armed groups would engage, according to an account of the meeting in Myanmar state media.

'Cycle of abuses'
A military crackdown in Myanmar in 2017 sent hundreds of thousands of Rohingya fleeing into neighbouring Bangladesh, many with harrowing stories of murder, rape and arson.
Rohingya who remain in Myanmar are denied citizenship and access to healthcare and require permission to travel outside their townships.
Min Aung Hlaing -- who was head of the army during the crackdown -- has dismissed the term Rohingya as imaginary.
ICC judges must now decide whether to grant the arrest warrants. If granted, the 124 members of the ICC would theoretically be obliged to arrest the junta chief if he travelled to their country.
China, a major ally and arms supplier of Myanmar's ruling junta, is not an ICC member.

Khan's request comes just days after the ICC issued arrest warrants for Israeli Prime Minister Benjamin Netanyahu, his ex defence minister and a top Hamas leader over the war in Gaza.
Rights groups applauded Khan's Myanmar move, saying it was an important step toward breaking the cycle of abuses and impunity that has long been a key factor in fuelling the military's mass violations.
The judges will rule on the prosecutor's request, but ICC member countries should recognise this action as a reminder of the court's critical role when other doors to justice are closed,said Maria Elena Vignoli, a senior international lawyer Human Rights Watch.
Opening its doors in 2002, the Hague-based ICC is an independent court, set up to investigate and prosecute those accused of the world's worst crimes."

# Store text in a character vector
text_data <- as.character(text_data)

# Text Cleaning: Remove unwanted characters, numbers, and extra spaces
clean_text <- function(text) {
  text <- gsub("[[:punct:]]", " ", text)  # Remove punctuation
  text <- gsub("[0-9]", "", text)         # Remove numbers
  text <- gsub("[[:space:]]+", " ", text) # Remove extra spaces
  return(text)
}

# Stop Words Removal
remove_stopwords <- function(text) {
  stopwords <- stopwords("en")  # Get English stop words
  tokens <- unlist(strsplit(text, " "))
  tokens <- tokens[!tokens %in% stopwords]
  return(paste(tokens, collapse = " "))
}

# Stemming
apply_stemming <- function(text) {
  words <- unlist(strsplit(text, " "))
  stemmed_words <- wordStem(words, language = "en")
  return(paste(stemmed_words, collapse = " "))
}

# Spell Checking
spell_check <- function(text) {
  words <- unlist(strsplit(text, " "))
  corrected_words <- sapply(words, function(w) {
    suggestions <- hunspell_suggest(w)[[1]]
    if (length(suggestions) > 0) return(suggestions[1]) else return(w)
  })
  return(paste(corrected_words, collapse = " "))
}

# Apply preprocessing steps
processed_text <- sapply(text_data, function(text) {
  text <- clean_text(text)                     # Step 1: Text Cleaning
  text <- tolower(text)                        # Step 2: Normalization
  text <- remove_stopwords(text)               # Step 3: Stop Words Removal
  text <- apply_stemming(text)                 # Step 4: Stemming
  text <- spell_check(text)                    # Step 5: Spell Checking
  return(text)
})

# Output preprocessed text
print(processed_text)

# Install SnowballC if not already installed
if (!requireNamespace("SnowballC", quietly = TRUE)) {
  install.packages("SnowballC")
}

# Load SnowballC library
library(SnowballC)

# Save the cleaned text to a file
writeLines(processed_text, "preprocessed_text.txt")


# Install hunspell if not already installed
if (!requireNamespace("hunspell", quietly = TRUE)) {
  install.packages("hunspell")
}

# Load hunspell library
library(hunspell)


# Define the spell-checking function
spell_check <- function(text) {
  words <- unlist(strsplit(text, " "))  # Split text into individual words
  corrected_words <- sapply(words, function(w) {
    suggestions <- hunspell::hunspell_suggest(w)[[1]]  # Get suggestions
    if (length(suggestions) > 0) return(suggestions[1]) else return(w)  # Choose the first suggestion
  })
  return(paste(corrected_words, collapse = " "))  # Recombine words into a sentence
}


# Example pipeline with all preprocessing steps
processed_text <- sapply(text_data, function(text) {
  text <- clean_text(text)                     # Step 1: Text Cleaning
  text <- tolower(text)                        # Step 2: Normalization
  text <- remove_stopwords(text)               # Step 3: Stop Words Removal
  text <- apply_stemming(text)                 # Step 4: Stemming
  text <- spell_check(text)                    # Step 5: Spell Checking
  return(text)
})

# Output processed text
print(processed_text)

writeLines(processed_text, "preprocessed_text.txt")

# Install required packages
install.packages("tokenizers")
# Load the tokenizers library
library(tokenizers)


# Input text data
text_data <-"intern criminal curt S chef prosecutors Wednesday 
as jug Grant rarest warrant Myanmar S juntas chef Min sung ha allege 
rime humane commit roaring Muslim Tarim Khan S request curt S hag vase jug firs
applicant rarest warrant hi level Myanmar governs office connect anus roaring people
extend in depend impart investing office conclude reasons round belie Senior general 
ACT preside Min sung ha bare criminal respond rime humane Khan dais statement include 
rime depot persecute allege commit august deceive Khan AD Myanmar S juntas reject prosecutors 
S moves day country member curt statement ICC never recognizes ICC prosecutors pone prove suspect 
rime commit roaring Myanmar S restive ranching state prompt Exodus Muslim minors Southeast Asian 
country neighbor Bangladesh on million roaring NOW vile sprawls vamp bear Bangladesh border cit Cox 
S bazaar main felt accuse Myanmar military mass chill pare quill follow Khan dais allege rime commit
Myanmar S ram for tarmacadam support Nation border police quell non roaring citizen firs applicant 
rarest warrant hi level Myanmar governs office Khan dais quill follow earn prosecutors Myanmar tack 
conflicts military carious ram groups oppose lure sin arm outs sung San usu KY S elect governs 
febrile juntas reel Major rebel offend lats tear swiz lag area territory mute bear border 
China earlier moth Min sung ha dolt China S premier lee ganglia military read pea ram groups 
engage accord account meet Myanmar state Media cycle anus military crackdown Myanmar nest h
undred thousands roaring flee neighbor Bangladesh main harrow satori murder pare parson roaring 
remains Myanmar dine citizenship access healthcare require permits ravel outdid townships Min 
sung ha Head arm crackdown dismiss teem roaring imaginary ICC jug mist NOW diced whether Grant 
rarest warrant Grant member ICC thereto oblige rarest juntas chef ravel country China Major all 
ram supplier Myanmar S lure juntas ICC member Khan S request cone juts Day ICC 
issue rarest warrant raiser prim monist Benjamin planetary e defend monist pot hams 
dealer weir Gaza rift groups applaud Khan S Myanmar moves day imports steep towards breach 
cycle anus impugn Long Key actor fuel military S mass viola jug quill lure prosecutors S 
request ICC member country recognizes cation reminds curt S critic lore odor justice cloche 
dais maria Elena violin Senior intern layer humane rift swatch pone odor hag vase ICC in 
depend curt est investing prosecute accuse word S wort rime" 


# Tokenize text into sentences
sentence_tokens <- tokenize_sentences(text_data)
print("Sentence Tokenization:")
print(sentence_tokens)






