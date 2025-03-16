# MySQL to BigQuery Change Data Capture (CDC) using Datastream on GCP

This project demonstrates how to set up Change Data Capture (CDC) from a MySQL instance on Google Cloud Platform (GCP) to a BigQuery dataset using Datastream. The project covers the creation of a MySQL instance, configuring Datastream for CDC, setting up BigQuery, and testing the CDC process by inserting and updating data.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Step 1: Create a MySQL Instance on GCP](#step-1-create-a-mysql-instance-on-gcp)
- [Step 2: Configure Datastream for CDC](#step-2-configure-datastream-for-cdc)
- [Step 3: Create a Database and Table in MySQL](#step-3-create-a-database-and-table-in-mysql)
- [Step 4: Insert and Update Data to Test CDC](#step-4-insert-and-update-data-to-test-cdc)
- [Step 5: Verify Data in BigQuery](#step-5-verify-data-in-bigquery)
- [Conclusion](#conclusion)

---

## Prerequisites

- A Google Cloud Platform (GCP) account
- Google Cloud SDK installed and configured
- MySQL Workbench or any MySQL client tool
- BigQuery enabled in your GCP project
- Datastream API enabled

---

## Step 1: Create a MySQL Instance on GCP

1. Navigate to **Cloud SQL** in the GCP Console.
2. Click **Create Instance** → Select **MySQL**.
3. Configure the instance:
   - Set a **Instance ID** (e.g., `mysql-instance`)
   - Choose **MySQL Version**
   - Set **Region and Zone**
   - Configure **Username and Password**
4. Click **Create** and wait for the instance to be ready.

![Create MySQL Instance](https://github.com/abhira15/ChangeDataCapture-Mysql-BigQuery/blob/5bc631c218925d89b54635a790c6f643909a0e6c/MySQLInstance.png)

---

## Step 2: Configure Datastream for CDC

1. Navigate to **Datastream** in the GCP Console.
2. Click **Create Stream**.
3. Choose **Source** as MySQL and enter the MySQL instance details.
4. Set up the **Destination** as BigQuery.
5. Configure the stream to capture CDC events.
6. Click **Create** to start streaming changes.

![Datastream Setup](https://github.com/abhira15/ChangeDataCapture-Mysql-BigQuery/blob/5bc631c218925d89b54635a790c6f643909a0e6c/DataStream.png)

---

## Step 3: Create a Database and Table in MySQL

1. Open **MySQL Workbench** and connect to the MySQL instance.
2. Run the following SQL commands to create a database and table:
3. Verify that the table has been created.

![MySQL Workbench Table Creation](https://github.com/abhira15/ChangeDataCapture-Mysql-BigQuery/blob/5bc631c218925d89b54635a790c6f643909a0e6c/Workbench.png)

---

## Step 4: Insert and Update Data to Test CDC

1. Insert sample data into the table:

```sql
INSERT INTO country (name, capital, language) 
VALUES 
    ('United States', 'Washington, D.C.', 'English'),
    ('France', 'Paris', 'French'),
    ('Japan', 'Tokyo', 'Japanese'),
    ('India', 'New Delhi', 'Hindi'),
    ('Brazil', 'Brasília', 'Portuguese');
```

2. Update a record to trigger CDC:

```sql
UPDATE country 
SET capital = 'Mumbai' 
WHERE country_id = 4;
```

3. Verify that the changes have been captured by Datastream.

---

## Step 5: Verify Data in BigQuery

1. Navigate to **BigQuery** in the GCP Console.
2. Open the dataset where Datastream is writing the changes.
3. Run a query to check the CDC changes:

```sql
SELECT * FROM `employee-data-project-452714.rp_mysqlcountry_info.country`
ORDER BY timestamp DESC;
```

4. Verify that the changes from MySQL are reflected in BigQuery.

![BigQuery CDC Verification](https://github.com/abhira15/ChangeDataCapture-Mysql-BigQuery/blob/master/BigQuery.png)

---

## Conclusion

This project successfully demonstrates how to set up a Change Data Capture (CDC) pipeline from MySQL to BigQuery using Google Cloud's Datastream. By following these steps, you can track changes in a MySQL database and analyze them in BigQuery in real-time.

For further improvements, consider:
- Automating the setup using Terraform
- Implementing additional transformations using Dataflow
- Monitoring and alerting with Cloud Monitoring

---

## Author
[Abhishek Awasarmal]  
[8788495333]

---
