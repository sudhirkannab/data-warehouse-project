#SQL Data Warehouse & ETL Pipeline

## Project Overview

This project demonstrates how I built a **SQL Server data warehouse and ETL pipeline** using data from CRM and ERP source systems.

The project follows a **Bronze → Silver → Gold** architecture to move raw CSV data through different stages of cleaning, transformation, and preparation for analytics.

The final Gold layer provides customer, product, and sales data that can be used for reporting and business analysis.

## Project Objective

The goal was to transform raw CRM and ERP CSV data into a structured data warehouse that can support **business reporting and analytics.**

The pipeline handles data ingestion, data quality issues, transformation, integration, and dimensional modeling.
## Architecture

```text
CRM CSV Files ──┐
                ├──> Bronze ──> Silver ──> Gold
ERP CSV Files ──┘
```

### Bronze Layer — Raw Data

The Bronze layer stores the source data with minimal transformation.

Data is loaded from CSV files into SQL Server using `BULK INSERT`.

Source systems:

* CRM
* ERP

## Silver Layer — Cleaned Data

The Silver layer cleans and standardizes the raw data.

Some of the transformations include:

* Removing duplicate customer records
* Cleaning names and text using `TRIM()`
* Standardizing gender values
* Standardizing marital status
* Cleaning customer and product keys
* Handling missing and invalid dates
* Correcting invalid sales values
* Deriving missing product prices
* Standardizing country names
* Creating product validity dates using `LEAD()`

## Gold Layer — Analytics Data

The Gold layer provides a business-friendly dimensional model.

It contains:

### Customer Dimension

`gold.dim_customers`

Contains customer information such as:

* Customer ID
* Customer number
* Name
* Country
* Gender
* Marital status
* Birthdate
* Customer creation date

### Product Dimension

`gold.dim_products`

Contains product information such as:

* Product ID
* Product number
* Product name
* Category
* Subcategory
* Product line
* Cost
* Start date

### Sales Fact

`gold.fact_sales`

Contains sales transactions such as:

* Order number
* Product
* Customer
* Order date
* Shipping date
* Due date
* Sales amount
* Quantity
* Price

## ETL Process

The ETL process is implemented using SQL Server stored procedures.

### Bronze Load

`bronze.load_bronze`

Loads raw CRM and ERP CSV data into the Bronze layer.

### Silver Load

`silver.load_silver`

Cleans, validates, standardizes, and transforms the Bronze data before loading it into the Silver layer.


## Key Skills Demonstrated

Through this project, I demonstrated my ability to:

* Design a basic data warehouse architecture
* Build ETL pipelines using SQL
* Load data from multiple source systems
* Clean and transform messy source data
* Handle missing and invalid data
* Deduplicate records
* Combine CRM and ERP data
* Create fact and dimension structures
* Write reusable SQL stored procedures
* Apply SQL window functions
* Prepare data for analytics and reporting

## Project Structure

```text
sql-data-warehouse-project
│
├── README.md
│
├── datasets
│   ├── source_crm
│   └── source_erp
│
└── scripts
    ├── database
    ├── bronze
    ├── silver
    └── gold
```

## How to Run

### 1. Requirements

You need:

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)

### 2. Create the Database

Run:

```text
scripts/database/init_database.sql
```

This creates the `DataWarehouse` database and the Bronze, Silver, and Gold schemas.

### 3. Create Bronze Tables

Run:

```text
scripts/bronze/ddl_bronze.sql
```

### 4. Create the Bronze Load Procedure

Run:

```text
scripts/bronze/load_bronze.sql
```

Update the CSV file paths inside the procedure to match your computer.

Then execute:

```sql
EXEC bronze.load_bronze;
```

### 5. Create and Load the Silver Layer

Run:

```text
scripts/silver/ddl_silver.sql
scripts/silver/load_silver.sql
```

Then execute:

```sql
EXEC silver.load_silver;
```

### 6. Create the Gold Layer

Run:

```text
scripts/gold/ddl_gold.sql
```

The Gold layer creates:

```text
gold.dim_customers
gold.dim_products
gold.fact_sales
```



## Author

**SUDHIR KANNA B**



Skills: SQL • Data Warehousing • ETL • Data Cleaning • Data Modeling

