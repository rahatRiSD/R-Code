library(dplyr)
stats=data.frame(player=c('A','B','C','D','A','B'),
                 runs=c(100,200,400,6,5656,100),
                 wickets=c(17,29,NA,5,2,17))

distinct(stats)

distinct(stats,player, .keep_all = TRUE)
distinct(stats,player, .keep_all = FALSE)

# Define the ELU function
elu <- function(x, alpha) {
  ifelse(x >= 0, x, alpha * (exp(x) - 1))
}

# Input range
x <- seq(-5, 5, length.out = 500)

# Different values of alpha
alpha_values <- c(0.5, 1.0, 2.0,3.0)

# Plot the ELU function for each alpha
plot(x, elu(x, alpha_values[1]), type = "l", col = "red", lwd = 2,
     ylim = c(-2, 5), xlab = "Input (x)", ylab = "Output (ELU(x))",
     main = "ELU Activation Function for Different Alpha Values")
lines(x, elu(x, alpha_values[2]), col = "blue", lwd = 2)
lines(x, elu(x, alpha_values[3]), col = "green", lwd = 2)

# Add a legend
legend("topright", legend = c("alpha = 0.5", "alpha = 1.0", "alpha = 2.0","alpha = 3.0"),
       col = c("red", "blue", "green","yellow"), lwd = 2)



arrange(stats,runs,player)
arrange(stats,desc(runs))

rename(stats,runs_scored=runs)
select(stats,player,wickets)


# Install and load dplyr
install.packages("dplyr")
library(dplyr)

# Create an example data frame
df <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Age = c(24, 30, 22, 35, 28),
  Score = c(88, 95, 76, 85, 90)
)

df

# Add new columns with mutate
df_mutate <- df %>%
  mutate(
    Age_in_10_Years = Age + 10, # Add 10 to current Age
    Score_Category = ifelse(Score >= 90, "High", "Moderate") # Categorize Score
  )

print(df_mutate)

# Create a new data frame with only the specified columns
df_transmute <- df %>%
  transmute(
    Name,
    Age_in_10_Years = Age + 10,
    Score_Category = ifelse(Score >= 90, "High", "Moderate")
  )

print(df_transmute)

summarise(df_transmute,min(Age_in_10_Years))


write.csv(myData, "/Users/rahatrihan/Desktop/myData.csv", row.names = FALSE)

myData=read.csv("/Users/rahatrihan/Desktop/Iris.csv")
View(myData)





# Summarize with dplyr
df_summary <- df %>%
  summarize(
    Average_Age = mean(Age),              # Calculate mean of Age
    Max_Score = max(Score),               # Find maximum Score
    Total_Records = n()                   # Count the number of rows
  )

print(df_summary)




