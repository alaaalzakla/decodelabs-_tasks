# Task 1: Data Cleaning

## Overview

This task focuses on cleaning and preparing the raw dataset (`Dataset for Data Analytics.xlsx`) for further analysis.

---

## Data Cleaning Process

The following steps were performed to ensure data quality:

- **Missing Values**: Checked using `isnull().sum()`. Missing values were found only in the Coupon column and were properly handled by creating a new boolean column `is_coupon` (True/False).
- **Duplicate Records**: Checked using `duplicated().sum()`. No duplicates were found in the dataset.
- **Outlier Detection**: Performed statistical analysis and visual inspection (boxplots) on key numerical columns (Quantity, Price, Total Price). **No significant outliers** were detected.
- **Verification**: Manually recalculated and validated the `Total Price` column — it was found to be **100% accurate**.
- **Column Management**: Removed noisy and irrelevant columns that do not contribute to the analysis.
- **Feature Engineering**:
  - Created `is_coupon` column (True/False)
  - Extracted `Year` and `Month` from the date column
- **Data Types**: Reviewed and confirmed appropriate data types for all columns.

---

## Summary

After thorough cleaning and validation, the dataset is now **clean, consistent, and ready** for exploratory data analysis and visualization.

No major data quality issues were present in the original dataset.

---

**Prepared for:** Task 1 - Data Cleaning  
**Date:** June 2026

