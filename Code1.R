print("Hello world")

#While looop
i=1
while(i<6){
  print(i)
  i=i+1
  if(i==4){
    break
  }
}

i=0
while(i<6){
  i=i+1
  if(i==5){
    next
  }
  print(i)
}

#For Loop

for(x in 0:15){
  print(x)
}

week = c('Sunday',
          'Monday',
          'Tuesday',
          'Wednesday',
          'Thursday',
          'Friday',
          'Saturday')

# using for loop to iterate
# over each string in the vector
for (day in week)
{

  # displaying each string in the vector
  print(day)
}

for(x in 1:4){
  for(y in 1:5){
    print(x*y)
  }
}

for(x in 1:4){
  for(y in 1:5){
    print(x+y)
  }
}

# Create a list of numbers
my_list <- list(1, 2, 3, 4, 5)

# Loop through the list and print each element
for (i in seq_along(my_list)) {
  current_element <- my_list[[i]]
  print(paste("The current element is:", current_element))
}
#Function

a=c(1,2,3,4,4,5,5,-5)
b=c("one","Two","khan")
c=c(TRUE,TRUE,FALSE,TRUE)

min(a)
max(a)
mean(a)
sd(a)
nchar(b)
c
vec=c(2,4,4,5,1,7,3,6,78)
vec+3
vec*3
vec-3

sort(vec)
mam=c('B','A','K','M')
sort(mam)

my_vector <- c(5, 2, 9, 1, 7)
sorted_vector <- sort(my_vector, decreasing = FALSE)
print(sorted_vector)

#Access Vector

X=c(12,34,54,76,13)
X[2:4]
X[1:5]

X <- c(12, 34, 54, 76, 13)
result <- X[c(2, 4)]
print(result)

# Creating a 3x3 matrix with elements 1 to 9
my_matrix <- matrix(11:40, nrow = 5, ncol = 6)
print(my_matrix)

# Define the polynomial coefficients
# For y = 2x^3 - 4x^2 + 3x - 5, coefficients are c(-5, 3, -4, 2)
coefficients <- c(-5, 3, -4, 2)

# Generate x values
x <- seq(-10, 10, by = 0.1)

# Evaluate the polynomial at each x value
y <- polyval(coefficients, x)

# Plot the polynomial
plot(x, y, type = "l", col = "blue", lwd = 2,
     main = "Polynomial Plot: y = 2x^3 - 4x^2 + 3x - 5",
     xlab = "x", ylab = "y")
install.packages("pracma")


library(pracma)

# Define the polynomial coefficients
coefficients <- c(2, -4, 3, -5)  # for y = 2x^3 - 4x^2 + 3x - 5

# Generate x values
x <- seq(-10, 10, by = 0.1)

# Evaluate the polynomial at each x value
y <- polyval(coefficients, x)

# Plot the polynomial
plot(x, y, type = "l", col = "blue", lwd = 2,
     main = "Polynomial Plot: y = 2x^3 - 4x^2 + 3x - 5",
     xlab = "x", ylab = "y")



my_matrix[2,]
my_matrix[2,3]

#Array
my_matrix <- array(11:40,c(3,4,3))
my_matrix

my_matrix <- matrix(11:40, nrow = 5, ncol = 6)

#Data Frame


my_data <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  Score = c(88, 92, 85)
)
print(my_data)


Name = c("Alice", "Bob", "Charlie")
Age = c(25, 30, 35)
Score = c(88, 92, 85)
ID=c(1,2,3)
Data=data.frame(ID,Name,Age,Score)
Data

Id=c(1,2,3,4,5)
house_member=c("Rahat","Shifat","Shishir","Ifty","Tasin")
Blood_type=c('A+',"O+","A-","AB+","O+")
Semester=c(10,3,3,4,8)
Wages=c("1500tk","1400tk","1800tk","1500tk","1900tk")
Data_list=data.frame(Id,house_member,Blood_type,Semester,Wages)

Data_list
Laptoop_name=c("HP","Macbook","Dell","MSC","Vivobook")
Data_list$Laptoop_name=Laptoop_name
Data_list


# Initial data
Id <- c(1, 2, 3, 4, 5)
house_member <- c("Rahat", "Shifat", "Shishir", "Ifty", "Tasin")
Blood_type <- c("A+", "O+", "A-", "AB+", "O+")
Semester <- c(10, 3, 3, 4, 8)
Wages <- c("1500tk", "1400tk", "1800tk", "1500tk", "1900tk")
Laptop_name <- c("HP", "Macbook", "Dell", "MSC", "Vivobook")

# Creating the initial data frame
Data_list <- data.frame(Id, house_member, Blood_type, Semester, Wages, Laptop_name)

# Generating additional 100 members
# For simplicity, we will use sample data for new members
set.seed(123)  # Setting seed for reproducibility
new_Id <- 6:105
new_house_member <- paste("Member", new_Id)  # Generating names like "Member 6", "Member 7", etc.
new_Blood_type <- sample(c("A+", "O+", "A-", "AB+", "B+"), 100, replace = TRUE)
new_Semester <- sample(1:10, 100, replace = TRUE)
new_Wages <- paste0(sample(1200:2000, 100, replace = TRUE), "tk")
new_Laptop_name <- sample(c("HP", "Macbook", "Dell", "MSC", "Vivobook"), 100, replace = TRUE)

# Creating the new data frame with 100 additional rows
new_members <- data.frame(Id = new_Id, 
                          house_member = new_house_member, 
                          Blood_type = new_Blood_type, 
                          Semester = new_Semester, 
                          Wages = new_Wages, 
                          Laptop_name = new_Laptop_name)

# Combining the original and new data
Data_list <- rbind(Data_list, new_members)

# Displaying the updated data frame
Data_list



#---------------------------------------------------------------------------










