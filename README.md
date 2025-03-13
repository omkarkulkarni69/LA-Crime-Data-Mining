
# **Mining LA Crime Data for Identifying Safe Spots**

## **📌 Project Overview**  
This project analyzes **Los Angeles crime data (2020-2023)** using **data mining and machine learning techniques** to identify **crime hotspots and safe zones**. The dataset is sourced from the **Los Angeles Police Department (LAPD)** via [Data LA](https://data.lacity.org/Public-Safety/Crime-Data-from-2020-to-Present/2nrs-mtv8).  

By leveraging **clustering, classification, and predictive analytics**, uncovered:  
1. **The safest & most dangerous areas in LA**  
2. **Peak crime times and high-crime months**  
3. **Most frequently committed crimes**  
4. **Crime trend predictions using machine learning**  
5. **Patterns in victim demographics & repeat offenders**  

📄 **Full Report**: [Download PDF Summary](https://github.com/omkarkulkarni69/LA-Crime-Data-Mining/blob/4e75c9ecc1b5c5b4b6b94d3331dc59b7fd95657e/LA_Crime_Analysis_Report.pdf)  

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
📄 **See Full Visualizations in the Report**: [Download Here](https://github.com/omkarkulkarni69/LA-Crime-Data-Mining/blob/4e75c9ecc1b5c5b4b6b94d3331dc59b7fd95657e/LA_Crime_Analysis_Report.pdf)  

---

### **3️⃣ Classification & Prediction Models**  
1. **Decision Tree** → Predicted crime type based on location, time, and victim details  
2. **Linear & Logistic Regression** → Modeled likelihood of crime occurrence in specific areas  

📌 **Decision Tree Classification Results**  
📄 **View Decision Tree in Report**: [Download PDF](https://github.com/omkarkulkarni69/LA-Crime-Data-Mining/blob/4e75c9ecc1b5c5b4b6b94d3331dc59b7fd95657e/LA_Crime_Analysis_Report.pdf)  

---

### **4️⃣ Geospatial & Temporal Analysis**  
1. **Crime heatmaps using Latitude & Longitude**  
2. **Time-series analysis for seasonal crime trends**  
3. **Weekday vs Weekend crime variation**  

📌 **Peak Crime Hours Analysis**  
📄 **See Crime Trends & Graphs in the Report**: [Download Here](https://github.com/omkarkulkarni69/LA-Crime-Data-Mining/blob/4e75c9ecc1b5c5b4b6b94d3331dc59b7fd95657e/LA_Crime_Analysis_Report.pdf)  

---

📂 Code Structure & Files
📌 Python Notebooks
1️⃣ DM_Part-1.ipynb
Purpose: Data exploration, cleaning, and feature engineering.
Contents:
✔️ Data preprocessing (handling missing values, feature extraction).
✔️ Exploratory Data Analysis (EDA).
✔️ Initial insights on crime frequency and victim demographics.
📌 Usage: Run this first to prepare the dataset before applying machine learning models.

2️⃣ FirstModel.ipynb
Purpose: Implementation of Logistic Regression and evaluation metrics.
Contents:
✔️ Logistic Regression for crime type classification.
✔️ Performance evaluation.
📌 Usage: Use this to test Logistic Regression on the dataset.

3️⃣ SecondModel.ipynb
Purpose: Implementation of Decision Tree classification with confusion matrix analysis.
Contents:
✔️ Decision Tree Classifier to predict crime categories.
✔️ Aggregated confusion matrix for model performance comparison.
📌 Usage: Builds on FirstModel, adding Decision Tree and deeper evaluation.

4️⃣ FourthModel.ipynb
Purpose: DBSCAN clustering for identifying crime hotspots.
Contents:
✔️ DBSCAN clustering implementation on crime data.
✔️ Identifies high-crime zones based on density.
📌 Usage: Dedicated notebook for DBSCAN clustering.

5️⃣ K_Means_Algorithm (1).ipynb
Purpose: Dedicated notebook for K-Means clustering analysis.
Contents:
✔️ Finding the optimal number of clusters (Elbow Method).
✔️ Crime clustering based on spatial and temporal patterns.
📌 Usage: Used specifically for clustering analysis.

6️⃣ DBSCAN_Trial.ipynb
Purpose: Experimentation with DBSCAN clustering.
Contents:
✔️ Testing different epsilon (ε) and min-sample values.
✔️ Crime cluster visualization on LA city map.
📌 Usage: Used to explore non-linear crime clusters.

📌 R Scripts
7️⃣ DBSCAN.R
Purpose: Implement DBSCAN clustering in R for crime hotspots.
📌 Usage: Alternative clustering analysis using R instead of Python.

8️⃣ DT.R
Purpose: Initial implementation of Decision Tree classifier in R.
✔️ Training Decision Tree on crime data.
✔️ Evaluating classification accuracy.
📌 Usage: R-based alternative to crime type prediction.

9️⃣ DT2ndAttempt.R
Purpose: A refined second attempt at Decision Tree modeling in R.
✔️ Adjusted parameters for better model performance.
✔️ Feature selection & improved classification accuracy.
📌 Usage: Builds upon DT.R with improved accuracy.

🔟 DT.RData & DTree.RData
Purpose: Serialized models storing trained Decision Trees.
📌 Usage: Used for reloading models without retraining.

📄 PDF Summary Report
📄 Download Full Report: LA_Crime_Analysis_Report.pdf
🔹 Includes Key Findings, Visualizations & Model Performance.
---

## **🔑 Key Findings**  

1. **Crime Peaks at Night**: **Most crimes occur between 6 PM - 11 PM** with a sharp decline in early mornings.  
2. **High-Crime vs Low-Crime Areas**: Downtown LA & certain police districts report **higher crime rates**, while suburbs remain relatively safer.  
3. **Most Frequent Crimes**: **Theft & Assault** are the most common, with noticeable spikes in holiday months.  
4. **Weekend vs Weekday Trends**: Violent crimes **increase on weekends**, while property crimes remain constant throughout the week.  

📄 **Detailed Insights in Report**: [Download PDF](https://github.com/omkarkulkarni69/LA-Crime-Data-Mining/blob/4e75c9ecc1b5c5b4b6b94d3331dc59b7fd95657e/LA_Crime_Analysis_Report.pdf)  

---

## **🛠 Tools & Technologies**  
1. **Programming Languages**: Python (Google Colab) & R (RStudio)  
2. **Libraries Used**:  
- `pandas`, `numpy`, `matplotlib`, `seaborn` (EDA & Visualization)  
- `scikit-learn` (K-Means, Decision Tree, Logistic Regression)  
- `folium` (Geospatial Crime Mapping)  
3. **Data Sources**: Los Angeles Open Data Portal  

---
