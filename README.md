# ETL-Project - Monash Data Analytics Bootcamp
---

## Background

We are interested in looking at the specific locations of fast food chains in the US and various socio-economic measures like median level of income, unemployment rate etc. in those very locations. By transforming two different datasets that have a common point: Zip Code Tabulation Area (ZCTA), we hope that our database will allow analysts to draw insights on the potential link between low-socio economic status communities, the location of fast food chains as well as obesity levels across the US.

## Project Report

For further details in any of the following steps and our project potential and limitations, please refer to our **[report](report/report.docx) and the notebooks for each part**.

## Extract

1/ US Census Bureau Demographic Data
Use census API wrapper to retrieve data from the [American Community Survey 5-Year Data (2009-2018)](https://www.census.gov/data/developers/data-sets/acs-5year.html) based on zip code tabulation area (zcta).
**Please refer to [our notebook](01_extract_census/01_extract_census.ipynb).**
   
2/ Fast Food Restaurants Across America 
This dataset was extracted from [Kaggle](https://www.kaggle.com/datafiniti/fast-food-restaurants/) and it came in the form of a downloadable CSV.
**Please refer to [our notebook](01_extract_restaurant/01_extract_restaurant.ipynb).**

3/ Zip Code to ZCTA Cross Walk
This dataset was extracted from UDS Mapper and it came in the form of a downloadable CSV.
**Please refer to [our notebook](01_extract_zip_zcta/01_extract_zip_zcta.ipynb).**

All of the input csv files can be found [here](00_input/).

## Transform

Please refer to the following notebooks:

* **[US Census Data Transformation](02_transform_census/02_transform_census.ipynb)**

* **[Fast Food Chain Data Transformation](02_transform_restaurant/02_transform_restaurant.ipynb)**

* **[Zip to ZCTA Data Transformation](02_transform_zip_zcta/02_transform_zip_zcta.ipynb)**

After our data analysis and transformation, we come up with this ERD and [schema](03_load/03_load.ipynb) before loading data to the PostgreSQL database.

![ERD](report/ERD.png)

## Load

**Please refer to [our notebook](03_load/03_load.ipynb).

---
We make no claims as the ownership of the data. Hence, please do what you'd love with the data but credit the appropriate people.

