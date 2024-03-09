# specifying the path 
path = "C:/Users/veera/OneDrive/Desktop/Data Visualization Using R/Data Visualization Using R/Datasets/Sport car price.csv"

# reading contents of csv file 
data  =  read.csv(path) 

# contents of the csv file 
print (data)

# Display the first few rows of the dataset
head(data)

# Display the last few rows of the dataset
tail(data)

# Display the structure of the dataset (data types of variables)
str(data)

# Summary statistics of numerical variables
summary(data)

# Check for missing values in the dataset
any(is.na(data))

install.packages("ggplot2")
# Load necessary libraries
library(ggplot2)

# Check the names of columns in the dataset
names(data)

# Replace any spaces in column names with underscores
names(data) <- gsub(" ", "_", names(data))

# Verify the corrected column names
names(data)

# Now, let's try creating the visualizations again
install.packages("dplyr")
library(dplyr)

data$Price <- as.numeric(gsub("[^0-9.]", "", data$Price))
# Check the structure of the Price column again
str(data$Price)

# Calculate total price for each CarMake
car_make_totals <- data %>%
  group_by(CarMake) %>%
  summarise(Total_Price = sum(Price))

# Sort the data by total price in descending order and select the top 10 CarMake
top_15_car_make <- car_make_totals %>%
  arrange(desc(Total_Price)) %>%
  head(15)

# Filter the original dataset to include only the top 10 CarMake
data_top_15 <- data %>%
  filter(CarMake %in% top_15_car_make$CarMake)

# Create the first plot (Barplot of Car Make vs. Price)
ggplot(data_top_15, aes(x = CarMake, y = Price, fill = CarMake)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 15 Car Make vs. Price", x = "Car Make", y = "Price (in USD)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_discrete(name = "Car Make")

                                                              #@Veeraboina_Sai_Ganesh
                                                  


