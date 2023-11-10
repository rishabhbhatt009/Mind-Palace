
## FAQ
1. [Add questions]()
2. [Execution Hierarchy](#execution-hierarchy)
3. [Common Table Expression](#common-table-expression)
4. [Pivot Table](Notes/SQL-Notes/pivoting-tables.md)

<hr>

## Execution Hierarchy 
The **order of execution** of clauses within a query. This can be useful when optimizing a query. 

Order of Execution :
1. FROM
2. JOIN + ON
3. WHERE
4. GROUP BY
5. aggregation Functions
6. HAVING
7. window functions
8. SELECT 
9. DISTINCT
10. set operations (UNION/INTERSECT/EXCEPT)
11. ORDER BY
12. OFFSET
13. LIMIT

<hr>

## Common Table Expression
- A Common Table Expression (CTE) is a temporary result set that is defined within a SELECT, INSERT, UPDATE, or DELETE statement in SQL
- CTEs are similar to derived tables or subqueries, but they offer some advantages such as : 
  - better readability, 
  - improved performance, and 
  - the ability to reference the CTE multiple times in the same query.
- A CTE is defined using the `WITH` clause followed by a subquery that defines the CTE. 
- The subquery can reference columns from the tables in the query, and can also reference other CTEs defined in the same `WITH` clause. Once defined, the CTE can be referenced in the same query by its name, as if it were a table.

```sql
WITH cte_sales AS 
(
  SELECT customer_id, SUM(sale_amount) as total_sales
  FROM sales
  GROUP BY customer_id
)

SELECT customer_name, total_sales
FROM customers
JOIN cte_sales ON customers.customer_id = cte_sales.customer_id
ORDER BY total_sales DESC;
```

