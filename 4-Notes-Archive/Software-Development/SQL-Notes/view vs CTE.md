# View v/s Common Table Expression (CTE)

----
View 
- **virtual table** based on the result-set of an SQL statement, **essentially a saved query** that can be used as a regular table. 
- **does not store data itself**, it's a saved query that pulls data from the underlying tables, therefore changes made to base table are reflected automatically 
- views are **persistent** and can be used in subsequent queries
- improve readability and organization of complex queries
- you can add **permissions** to present specific data to certain users without giving them access to the underlying base tables.

```sql
CREATE VIEW example_view AS
SELECT column1, column2
FROM table_name
WHERE condition;
```

----
Common Table Expression (CTE)
- **temporary result set** that is defined within the **execution scope of a single statement**. Therefore are **not persistent** and disappear after statement is run.
- help in **breaking down complex queries** into simpler forms, making SQL scripts more readable and maintainable
- CTEs can be **recursive**, allowing them to reference themselves, which is useful for querying hierarchical or tree-structured data

```sql
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT * FROM cte_name;
```

----