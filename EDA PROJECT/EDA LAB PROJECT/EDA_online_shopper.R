
if (!require("readxl")) install.packages("readxl")
library(readxl)
# Load your dataset 
data <- read_excel("C:/Users/izzul/Desktop/online_shoppers_intention.csv.xlsx")

# Initial Inspection
head(data)           # Display the first few rows
str(data)            # Check data types (numeric, character, etc.)
summary(data)        # Statistical summary
colSums(is.na(data)) # Check for missing data

# Explore Categories
# We will check 'VisitorType' and 'Month'
unique(data$VisitorType)
table(data$VisitorType)
table(data$Revenue)  # See how many people actually bought something

# Histogram (Distribution of Exit Rates)
hist(data$ExitRates,
     main = "Distribution of Exit Rates",
     xlab = "Exit Rate Score",
     col = "pink",
     border = "white")

# Boxplot (Adapted to Shopping Metrics)
# We look at Bounce Rates, Exit Rates, and Page Values
boxplot(data[, c("BounceRates", "ExitRates", "PageValues")],
        main = "Boxplot of Shopping Metrics",
        col = c("red", "green", "blue"),
        outline = FALSE) # 'outline=FALSE' hides extreme outliers for better view

# Barplot ( Visitor Type Count)
barplot(table(data$VisitorType),
        main = "Visitor Type Count",
        xlab = "Type of Visitor",
        ylab = "Count",
        col = "purple",
        border = "black")

# Scatterplot  Bounce Rates vs Exit Rates
# These two variables usually have a strong relationship
plot(data$BounceRates, data$ExitRates,
     main = "Bounce Rates vs Exit Rates",
     xlab = "Bounce Rate",
     ylab = "Exit Rate",
     col = "blue",
     pch = 19) # pch=19 makes the dots solid

# Scatterplot (Page Values vs Exit Rates)
# Higher page values usually mean lower exit rates
plot(data$PageValues, data$ExitRates,
     main = "Page Values vs Exit Rates",
     xlab = "Page Value",
     ylab = "Exit Rate",
     col = "darkgreen",
     pch = 16)