# Install necessary packages if not already installed
if (!require(topicmodels)) install.packages("topicmodels")
if (!require(tm)) install.packages("tm")
if (!require(SnowballC)) install.packages("SnowballC")

# Load the libraries
library(tm)
library(SnowballC)
library(topicmodels)

# Define the text paragraph
text <- "Lionel Andrés Messi, widely regarded as one of the greatest football players in history, has mesmerized fans worldwide with his extraordinary talent, skill, and passion for the game. Born on June 24, 1987, in Rosario, Argentina, Messi's journey from a young boy with a dream to a global icon is nothing short of inspiring.

Messi's football journey began at a tender age when he joined his local club, Newell's Old Boys. His prodigious talent was evident early on, but he faced a significant challenge: a growth hormone deficiency that threatened his career. Determined to succeed, Messi moved to Spain at the age of 13 to join FC Barcelona, a club that offered to cover his medical treatment. This decision marked the beginning of an unparalleled career.

During his time at Barcelona, Messi shattered records and redefined the sport. With over 670 goals in more than 770 appearances, he became the club's all-time leading scorer. Messi's ability to dribble past defenders with ease, deliver pinpoint passes, and score breathtaking goals earned him numerous accolades, including seven Ballon d'Or awards, a record in football history. His partnership with players like Xavi and Iniesta created a golden era for Barcelona, culminating in multiple UEFA Champions League titles and domestic triumphs.

In 2021, Messi made a historic move to Paris Saint-Germain (PSG) after spending over two decades at Barcelona. Despite the transition, his brilliance on the field remained evident, showcasing his adaptability and enduring class. Messi's international career also reached its pinnacle in 2021 when he led Argentina to victory in the Copa América, finally achieving a major trophy with his national team.

Off the pitch, Messi is known for his humility and philanthropy. Through the Leo Messi Foundation, he supports access to education and healthcare for vulnerable children worldwide. His dedication to using his platform for good further solidifies his status as a role model.

Lionel Messi's legacy extends beyond football. He embodies perseverance, excellence, and the power of dreams. From his magical performances on the pitch to his impactful contributions off it, Messi continues to inspire millions, proving that greatness is achieved through hard work, resilience, and an unwavering love for what you do."

# Create a corpus
corpus <- Corpus(VectorSource(text))

# Preprocess the text
corpus <- tm_map(corpus, content_transformer(tolower))    # Convert to lowercase
corpus <- tm_map(corpus, removePunctuation)              # Remove punctuation
corpus <- tm_map(corpus, removeNumbers)                  # Remove numbers
corpus <- tm_map(corpus, removeWords, stopwords("english")) # Remove stopwords
corpus <- tm_map(corpus, stemDocument)                   # Perform stemming
corpus <- tm_map(corpus, stripWhitespace)                # Remove extra whitespaces

# Create the Document-Term Matrix
dtm <- DocumentTermMatrix(corpus)

# Remove sparse terms
dtm_sparse <- removeSparseTerms(dtm, 0.95)

# Perform LDA with 2 topics
lda_model <- LDA(dtm_sparse, k = 4, control = list(seed = 1234))

# Examine the terms associated with each topic
topics <- terms(lda_model, 10)  # Top 10 terms per topic
print("Top Terms in Each Topic:")
print(topics)

# Examine topic distribution for the document
topic_probabilities <- posterior(lda_model)$topics
print("Topic Probabilities for the Document:")
print(topic_probabilities)

# Visualize the topics (if needed, install 'LDAvis' package)
if (!require(LDAvis)) install.packages("LDAvis")
library(LDAvis)

# Prepare data for visualization
json <- createJSON(
  phi = posterior(lda_model)$terms, 
  theta = topic_probabilities, 
  doc.length = rowSums(as.matrix(dtm_sparse)), 
  vocab = colnames(as.matrix(dtm_sparse)), 
  term.frequency = colSums(as.matrix(dtm_sparse))
)

# Run the visualization
serVis(json)
