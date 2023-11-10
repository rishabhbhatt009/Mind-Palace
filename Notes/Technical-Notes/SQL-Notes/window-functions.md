## Window Functions 
- Unlike aggregation functions with `GROUP BY` do not collapse rows     
- Window functions are performed on the result set after JOIN, WHERE, GROUP BY, and HAVING clauses and before ORDER BY, LIMIT and SELECT DISTINCT.


### Syntax :

```sql
--- normal syntax
SELECT col_name1, col_name2 ...
WINDOW_FUNC (<col name>) OVER ( 
    PARTITION BY <col name> 
    ORDER BY <col name> 
    <windoe frame>
    ) AS <alias>
FROM table_name
;


--- named windows
SELECT col_name1, col_name2 ...
WINDOW_FUNC (<col name>) OVER window_name
FROM table_name
WHERE <condition>
GROUP BY col_name ...
HAVING <condition>
--- window definition
WINDOW window_name AS ( 
    PARTITION BY <col name> 
    ORDER BY <col name> 
    <windoe frame>
    ) AS <alias>
ORDER BY col_name 
;
```

Note : `PARTITION BY`, `ORDER BY`, and `window frame` definition are all optiona

### Window Functions :
- [Aggregate Functions](Notes/SQL-Notes/!SQL.md#aggregation-functions) 
  - all aggregation functions which were defined can be used as window functions

- Analytic Functions 
  - `FIRST_VALUE (col name)`
  - `LAST_VALUE (col name)`
  - `NTH_VALUE (col name, N)`
  - `LEAD (col name, N, default value)`
  - `LAG (col name, N, default value)`
  - `NTILE (N)` : N = 10 ~ deciling. Divides into N equal groups 

- Ranking Functions 
  - `ROW_NUMBER ( )` : add row number 
  - `RANK ( )` : tied value get same rank, skip rank after tied ranks
  - `DENSE_RANK ( )` : tied value get same rank, next sequential rank after tied ranks

- Distribution Functions
  - `PERCENT_RANK ( )` : the percentile ranking number of a row—a value in [0, 1] interval:  (rank - 1) / (total number of rows - 1)
  - `CUME_DIST ( )` : represents the number of rows with values less than or equal to that row’s value divided by the total number of rows

### PARTITION BY 
- divides the rows into partitions to which the function is applied 
- Default Partition: with no PARTITION BY clause, the entire result set is the partition

### ORDER BY
- specifies order of the rows inside the partitions
- Default ORDER BY: with no ORDER BY clause, the order of rows within each partition is arbitrary

### Window Frame
- window_frame : `ROWS | RANGE | GROUPS` `BETWEEN` lower_bound `AND` upper_bound
- The bounds can be any of the five options:
  - `UNBOUNDED PRECEDING`
  - `n PRECEDING`
  - `CURRENT ROW`
  - `n FOLLOWING`
  - `UNBOUNDED FOLLOWING`
- As of 2020, GROUPS is only supported in PostgreSQL 11 and up.


<hr>

### Using aggregation functions in window format 
```sql
SELECT sale_id, customer_id, sale_amount, sale_date, 
SUM(sale_amount) OVER (PARTITION BY customer_id ORDER BY sale_date) AS cumulative_sales
FROM sales
;
```

