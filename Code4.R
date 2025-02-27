library(dplyr)
myData=read.csv("Downloads:/Iris.csv",header=TRUE,sep=",")
myData
is.na(myData)
view(myData)



write.csv(myData, "/Users/rahatrihan/Desktop/myData.csv", row.names = FALSE)

myData=read.csv("/Users/rahatrihan/Desktop/Iris.csv")
View


# Load the Iris dataset
myData = read.csv("/Users/rahatrihan/Desktop/Iris.csv")

# Write the dataset to a CSV file without row names
write.csv(myData, "/Users/rahatrihan/Desktop/myData.csv", row.names = TRUE)
myData
is.na(myData)

colSums(is.na(myData))

# Check for missing values in a specific column, e.g., "Sepal.Length"
missing_values <- is.na(myData$Sepal.Length)

# Display the rows with missing values
missing_rows <- myData[missing_values, ]

# Print the rows with missing values
print(missing_rows)


# Count missing values in each column of the dataset
missing_counts <- colSums(is.na(myData$SepalLengthCm))

# Print the count of missing values for each column
print(missing_counts)



lapply(myData,function(col) which(is.na(col)))


which(is.na(myData$SepalLengthCm))

remove=na.omit(myData)
remove




