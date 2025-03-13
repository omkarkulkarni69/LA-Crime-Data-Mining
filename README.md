
# **Mining LA Crime Data for Identifying Safe Spots**

## **📌 Project Overview**  
This project analyzes **Los Angeles crime data (2020-2023)** using **data mining and machine learning techniques** to identify **crime hotspots and safe zones**. The dataset is sourced from the **Los Angeles Police Department (LAPD)** via [Data LA](https://data.lacity.org/Public-Safety/Crime-Data-from-2020-to-Present/2nrs-mtv8).  

By leveraging **clustering, classification, and predictive analytics**, uncovered:  
1. **The safest & most dangerous areas in LA**  
2. **Peak crime times and high-crime months**  
3. **Most frequently committed crimes**  
4. **Crime trend predictions using machine learning**  
5. **Patterns in victim demographics & repeat offenders**  

📄 **Full Report**: [Download PDF Summary](https://github.com/your-repo/docs/LA_Crime_Analysis_Report.pdf)  

---

## **🗄 Dataset Information**  
📍 **Source**: [Los Angeles Open Data Portal](https://data.lacity.org/)  
📊 **Size**: **788,768 records** (28 attributes)  
📅 **Timeframe**: **2020 - 2023** (Analyzing 2023)  

### **🔑 Key Attributes**  
- **Crime Type & Description**  
- **Date & Time of Crime Occurrence**  
- **Victim Details (Age, Gender, Ethnicity)**  
- **Weapon Used & Crime Status**  
- **Location (Latitude & Longitude) for Mapping**  

---

## **🔍 Methodology & Techniques**  
Applied multiple **machine learning and clustering algorithms** to analyze crime patterns:

### **1️⃣ Data Preprocessing & Cleaning**  
1. **Handled missing/null values**  
2. **Extracted crime timestamps & location data**  
3. **Removed duplicates & irrelevant attributes**  
4. **Feature engineering for time-series trends**  

### **2️⃣ Clustering Algorithms for Crime Hotspots**  
1. **K-Means Clustering** → Grouped crimes into **21 LAPD Police Districts**  
2. **DBSCAN (Density-Based Clustering)** → Identified **high-density crime zones**  

📌 **Visualizing Crime Hotspots**  
📄 **See Full Visualizations in the Report**: [Download Here](https://github.com/your-repo/docs/LA_Crime_Analysis_Report.pdf)  

---

### **3️⃣ Classification & Prediction Models**  
1. **Decision Tree** → Predicted crime type based on location, time, and victim details  
2. **Linear & Logistic Regression** → Modeled likelihood of crime occurrence in specific areas  

📌 **Decision Tree Classification Results**  
📄 **View Decision Tree in Report**: [Download PDF](https://github.com/your-repo/docs/LA_Crime_Analysis_Report.pdf)  

---

### **4️⃣ Geospatial & Temporal Analysis**  
1. **Crime heatmaps using Latitude & Longitude**  
2. **Time-series analysis for seasonal crime trends**  
3. **Weekday vs Weekend crime variation**  

📌 **Peak Crime Hours Analysis**  
📄 **See Crime Trends & Graphs in the Report**: [Download Here](https://github.com/your-repo/docs/LA_Crime_Analysis_Report.pdf)  

---

## **📂 Code Structure & Files**  

This section outlines the primary notebooks and scripts included in this repository, detailing their specific purposes and analyses.

### **1️⃣ DM_Part-1.ipynb**
- **Purpose**: Data exploration, cleaning, and feature engineering.
- **Key Tasks**:
  - Data preprocessing (handling missing values, feature extraction).
  - Exploratory Data Analysis (EDA).
  - Initial insights on crime frequency and victim demographics.
- **Run this first** to prepare the dataset before applying machine learning models.

### **2️⃣ DM_Part-2.ipynb**
- **Purpose**: Machine learning application for clustering and prediction.
- **Key Tasks**:
  - **K-Means & DBSCAN clustering** to detect crime hotspots.
  - **Decision Tree & Logistic Regression** to classify crime types.
  - **Visualization of key trends** (heatmaps, classification results).
- **Use this after preprocessing the data in DM_Part-1**.

### **3️⃣ DBSCAN_Trial.ipynb**
- **Purpose**: Experimentation with DBSCAN clustering.
- **Key Tasks**:
  - Testing different epsilon (`ε`) and min-sample values.
  - Crime cluster visualization on LA city map.

### **4️⃣ KMeans_Clustering.ipynb**
- **Purpose**: Implementation of K-Means clustering.
- **Key Tasks**:
  - Optimal cluster selection using **Elbow Method**.
  - Understanding crime segmentations.

### **5️⃣ Crime_Trend_Analysis.ipynb**
- **Purpose**: Analyze trends in crime data over time.
- **Key Tasks**:
  - Seasonal patterns, monthly variations.
  - Forecasting crime trends.

📄 **More Details in Report**: [Download PDF](https://github.com/your-repo/docs/LA_Crime_Analysis_Report.pdf)  

---

## **🔑 Key Findings**  

1. **Crime Peaks at Night**: **Most crimes occur between 6 PM - 11 PM** with a sharp decline in early mornings.  
2. **High-Crime vs Low-Crime Areas**: Downtown LA & certain police districts report **higher crime rates**, while suburbs remain relatively safer.  
3. **Most Frequent Crimes**: **Theft & Assault** are the most common, with noticeable spikes in holiday months.  
4. **Weekend vs Weekday Trends**: Violent crimes **increase on weekends**, while property crimes remain constant throughout the week.  

📄 **Detailed Insights in Report**: [Download PDF](https://github.com/your-repo/docs/LA_Crime_Analysis_Report.pdf)  

---

## **🛠 Tools & Technologies**  
1. **Programming Languages**: Python (Google Colab) & R (RStudio)  
2. **Libraries Used**:  
- `pandas`, `numpy`, `matplotlib`, `seaborn` (EDA & Visualization)  
- `scikit-learn` (K-Means, Decision Tree, Logistic Regression)  
- `folium` (Geospatial Crime Mapping)  
3. **Data Sources**: Los Angeles Open Data Portal  

---
