## Pivoting Tables

```sql
SELECT salesperson,
SUM (CASE WHEN product = 'Product A' THEN sales ELSE 0 END) AS 'Product A',
SUM (CASE WHEN product = 'Product B' THEN sales ELSE 0 END) AS 'Product B',
SUM (CASE WHEN product = 'Product C' THEN sales ELSE 0 END) AS 'Product C'
FROM sales
GROUP BY salesperson
;
```

![image](resources/pivot_result.png)
