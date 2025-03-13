library("ggplot2")
library("dplyr")

df <- read.csv("Crime_Data_from_2020_to_Present.csv")

df <- df %>%
  select(-c(1, 8, 17, 18, 19, 20, 25, 26))


# Convert 'DATE OCC' column to Date format
df$DATE.OCC <- as.Date(df$DATE.OCC, format = "%m/%d/%Y")

# Create 'Day', 'Month', and 'Year' columns
df$Day <- format(df$DATE.OCC, "%A")
df$Month <- format(df$DATE.OCC, "%B")
df$Year <- format(df$DATE.OCC, "%Y")


# Define a function to convert 'TIME OCC' to time format
convert_to_time <- function(value) {
  hours <- as.integer(value %/% 100)
  minutes <- as.integer(value %% 100)
  return(paste0(formatC(hours, width = 2, format = "d", flag = "0"), ":", 
                formatC(minutes, width = 2, format = "d", flag = "0")))
}

# Apply the 'convert_to_time' function to 'TIME OCC' column
df$TIME.OCC <- lapply(df$TIME.OCC, convert_to_time)



# Convert 'TIME OCC' to character and pad with leading zeros
df$TIME.OCC <- format(df$TIME.OCC, format = "%H%M")

# Drop columns by specifying the column indices to keep
df <- df[, -c(1, 2)]



# Filter rows where 'Year' is greater than 2022
df <- df[df$Year > 2022, ]

# Filter rows where 'Month' is equal to 'February'
df <- df[df$Month == 'February', ]

# Define values1 for filling missing values
values1 <- list('Crm Cd 2' = 0, 'Crm Cd 3' = 0, 'Crm Cd 4' = 0)

# Fill missing values using values1
clean_df <- df
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

# Drop rows with missing values in specified columns

clean_df2 <- clean_df2[!is.na(clean_df2$Premis.Cd), ]
clean_df2 <- clean_df2[!is.na(clean_df2$Premis.Desc), ]
# Drop repeat columns

clean_df2 <- clean_df2 %>%
  select(-c(22, 23, 24))

# Extract the 'LAT' and 'LON' columns into a data frame 'lat_long'
lat_long <- clean_df2[c('LAT', 'LON')]

# Extract 'LAT' and 'LON' into separate vectors 'lat' and 'longg'
lat <- clean_df2$LAT
longg <- clean_df2$LON

# Set xlim and ylim for the plot
xlim <- c(-119, -118)
ylim <- c(33, 35)

# Create a scatter plot
plot(longg, lat, xlim = xlim, ylim = ylim)

# Load the dbscan package if not already loaded
library(dbscan)

# Convert 'lat_long' data frame to a matrix
X <- as.matrix(lat_long)

# Run DBSCAN clustering
eps <- 0.01
min_samples <- 15
# Run DBSCAN clustering
dbscan_result <- dbscan(X, eps = eps, minPts = min_samples)


# Get the dimensions of the resulting cluster assignments
cluster_assignments <- dbscan_result$cluster
n_clusters <- length(unique(cluster_assignments))

# Add cluster labels to the data frame
clean_df2$cluster <- cluster_assignments

# Calculate the counts of unique values in the 'cluster' column
cluster_counts <- table(clean_df2$cluster)

# Print the cluster counts
print(cluster_counts)

library(plotly)

# Create a scatter plot with color-coded clusters
plot <- plot_ly(data = clean_df2, x = ~longg, y = ~lat, color = ~cluster) %>%
  add_markers() %>%
  layout(title = "Clusturing after DBSCAN")

# Show the plot
plot


#Silhoutte score

library(fpc)

dist_matrix <- dist(X)

silhoutte_score <- cluster.stats(dist_matrix, cluster_assignments)$avg.silwidth

print(silhoutte_score)

                






