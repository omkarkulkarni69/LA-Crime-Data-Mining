library("ggplot2")
library("dplyr")

df <- read.csv("Crime_Data_from_2020_to_Present.csv")

df <- df[, !names(df) %in% c("AREA", "Date.Rptd", "Premis.Cd", "Weapon.Used.Cd", "Status")]

#Predicitng crime type based on other details

library(lubridate)

# Conve# Convert DATE_OCC column to a datetime object
df$DATE.OCC <- strptime(df$DATE.OCC, format = "%d/%m/%Y")

# Filter rows based on date conditions
df$DATE.OCC <- as.Date(df$DATE.OCC)

# Filter rows based on date conditions
df2 <- df %>%
  filter(format(DATE.OCC, "%Y-%m") == '2023-01' | format(DATE.OCC, "%Y-%m") == '2023-08')

summary(df2)

# Define values1 for filling missing values
values1 <- list('Crm Cd 2' = 0, 'Crm Cd 3' = 0, 'Crm Cd 4' = 0)

# Fill missing values using values1
clean_df <- df2
clean_df[is.na(clean_df$`Crm Cd 2`), 'Crm Cd 2'] <- values1$`Crm Cd 2`
clean_df[is.na(clean_df$`Crm Cd 3`), 'Crm Cd 3'] <- values1$`Crm Cd 3`
clean_df[is.na(clean_df$`Crm Cd 4`), 'Crm Cd 4'] <- values1$`Crm Cd 4`

# Drop rows with missing values in specified columns
clean_df <- clean_df[!is.na(clean_df$Crm.Cd.1), ]
clean_df <- clean_df[!is.na(clean_df$Mocodes), ]

# Define values2 for filling missing values
values2 <- list('Vict Sex' = 'X', 'Vict Descent' = 'X')

# Fill missing values using values2
clean_df2 <- clean_df
clean_df2$Vict.Sex[is.na(clean_df2$Vict.Sex)] <- values2$Vict.Sex
clean_df2$Vict.Descent[is.na(clean_df2$Vict.Descent)] <- values2$Vict.Descent

# Replace 'H' with 'X' in 'Vict Descent' column
clean_df2$Vict.Descent[clean_df2$Vict.Descent == 'H'] <- 'X'

#Remove unnecessary columns
clean_df2 <- clean_df2 %>%
  select(-c(24, 25, 26))

clean_df2 <- clean_df2 %>%
  select(-c(21))

clean_df3 <- clean_df2

library(dplyr)



# Function to convert four-digit integer to time
convert_to_time <- function(value) {
  # Convert to character and pad with leading zeros if needed
  value_str <- sprintf("%04d", value)
  
  # Parse the time as HHMM
  time <- strptime(value_str, format = "%H%M")
  
  # Format the time as HH:MM
  time_formatted <- format(time, format = "%H:%M")
  
  return(time_formatted)
}



# Apply the conversion function to TIME OCC column
clean_df3$TIME.OCC <- sapply(clean_df3$TIME.OCC, convert_to_time)


# Convert DATE OCC and TIME OCC columns to appropriate formats if needed
clean_df3$DATE.OCC <- as.Date(clean_df3$DATE.OCC, format = "%Y-%m-%d")
clean_df3$TIME.OCC <- as.character(clean_df3$TIME.OCC)  # Convert to character



# Merge DATE OCC and TIME OCC columns into a single datetime column
clean_df3$Datetime <- as.POSIXct(paste(clean_df3$DATE.OCC, clean_df3$TIME.OCC), format = "%Y-%m-%d %H:%M")

# Display the updated DataFrame
print(clean_df3)

# Drop columns at index positions 1, 2, 3, and 20
clean_df3 <- clean_df3 %>%
  select(-c(1, 2, 3, 20))

# Add a new 'WEEKDAY' column
clean_df3$WEEKDAY <- as.character(weekdays(clean_df3$Datetime))

# Add a new 'HOUR' column
clean_df3$HOUR <- substr(as.character(clean_df3$Datetime), 12, 13)

# Display the updated DataFrame
print(clean_df3)

# Drop the 'Datetime' column
clean_df3 <- clean_df3 %>%
  select(-Datetime)

# Create a new data frame with selected columns
clean_df3 <- clean_df3 %>%
  select(
    LAT, LON, Crm.Cd, Crm.Cd.2, Crm.Cd.3, Crm.Cd.4, Vict.Age,
    Mocodes, WEEKDAY, AREA.NAME, Rpt.Dist.No, Crm.Cd.Desc, Premis.Desc, HOUR,
    Weapon.Desc, Vict.Descent, Vict.Sex, Part.1.2
  )

# Split the 'Mocodes' column by spaces and create a list of values
mocodes_list <- strsplit(clean_df3$Mocodes, " ")



# Create a data frame of dummy variables
mocodes_dummies <- as.data.frame(matrix(0, nrow = nrow(clean_df3), ncol = length(unique(unlist(mocodes_list)))))
colnames(mocodes_dummies) <- unique(unlist(mocodes_list))



# Populate the dummy variables
for (i in 1:nrow(mocodes_dummies)) {
  mocodes_dummies[i, unlist(mocodes_list[[i]])] <- 1
}



# Display the created dummy variables
print(mocodes_dummies)

# Merge the data frames based on the row index
df_final <- merge(clean_df3, mocodes_dummies, by = 0)

# Rename the 'Row.names' column (which corresponds to the row index) to 'index'
colnames(df_final)[1] <- 'index'

# Drop the 'index' column
df_final <- df_final %>%
  select(-index)

# Display the final data frame
print(df_final)

# Combine CRM_CD2, CRM_CD3, and CRM_CD4 columns into a single column
df_final$Crm.Cd.2 <- paste(df_final$Crm.Cd.2, df_final$Crm.Cd.3, df_final$Crm.Cd.4, sep = " ")

# Drop CRM_CD3 and CRM_CD4 columns
df_final <- df_final %>%
  select(-Crm.Cd.3, -Crm.Cd.4)

# Display the updated data frame
print(df_final)

library(tidyr)

# Create dummy variables from the 'CRM_CD2' column
crime_codes_dummies <- df_final %>%
  separate_rows(Crm.Cd.2, sep = " ") %>%
  pivot_wider(names_from = Crm.Cd.2, values_from = Crm.Cd.2, values_fn = length, values_fill = 0)

# Drop columns containing "nan" or "NA" in the name
crime_codes_dummies <- crime_codes_dummies %>%
  select(-matches("nan|NA", ignore.case = TRUE))

# Create a temporary index column for both data frames
df_final$index <- seq_len(nrow(df_final))
crime_codes_dummies$index <- seq_len(nrow(crime_codes_dummies))

# Merge the data frames based on the 'index' column
df_final2 <- merge(df_final, crime_codes_dummies, by = "index")

# Remove the extra 'index' column
df_final2 <- df_final2 %>%
  select(-index)

# Load required packages
library(caret)
library(dplyr)

# Columns to create dummy variables for
cols_to_dummify <- c('Vict_Age', 'AREA_NAME', 'Rpt.Dist.No', 'Premis_Desc',
                     'Weapon_Desc', 'Vict_Descent', 'Vict_Sex', 'Part.1.2', 'WEEKDAY', 'HOUR')

# Create a new data frame for dummy variables
df_final3 <- df_final2
colnames(df_final2)

# Select only the columns to keep
df_final2 = df_final2[columns_to_keep]
# Loop through each column and create dummy variables
for (col in cols_to_dummify) {
  dummy_col <- as.data.frame(model.matrix(~ . - 1, data = df_final2[col]))
  colnames(dummy_col) <- paste(col, colnames(dummy_col), sep = "_")
  df_final3 <- cbind(df_final3, dummy_col)
}

# Drop specified columns
cols_to_drop <- c('Mocodes', 'CRM_CD2')
df_final3 <- df_final3 %>%
  select(-one_of(cols_to_drop))

#Shuffling the data
# Load libraries
library(caret)
library(randomForest)
library(adabag)
library(e1071)
library(party)
library(rpart)
library(pROC)
library(corrplot)
library(rattle)
library(randomForest)
library(class)
library(kernlab)

# Set a random seed for reproducibility
set.seed(9)

# Shuffle the data (equivalent to random_state=9 in Python)
df_final3 <- df_final3[sample(nrow(df_final3)), ]

# Separate the target column
target <- df_final3$Crm.Cd.Desc.x
df_final3 <- df_final3[, !(names(df_final3) %in% c("Crm.Cd.x"))]

# Split the dataset into training and testing sets
set.seed(7)  # Equivalent to random_state=7 in Python
splitIndex <- createDataPartition(target, p = 0.8, list = FALSE)

#Training
X_train <- df_final3[splitIndex, ]
X_test <- df_final3[-splitIndex, ]
y_train <- target[splitIndex]
y_test <- target[-splitIndex]

#Decision Tree
# Load the required library
library(rpart)

# Create a decision tree classifier with Gini criterion
clf_gini <- rpart(y_train ~ ., data = X_train, method = "class", parms = list(split = "gini"))

# Make predictions on the test data
gini_predict <- predict(clf_gini, X_test, type = "class")
