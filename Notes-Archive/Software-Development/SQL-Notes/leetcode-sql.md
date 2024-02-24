# Database Practice Questions 

### [1795. Rearrange Products Table](https://leetcode.com/problems/rearrange-products-table/description/)
How to stack in SQL using `UNION` and `CASE WHEN`

<img src="./resources/Screenshot%202023-05-13%20002749.png" alt="app-screen" width=50%>

### [1179. Reformat Department Table](https://leetcode.com/problems/reformat-department-table/description/)
<img src="./resources/Screenshot 2023-05-13 014302.png" width=70%>



### No FULL JOINS in MySQL 
We can implement OUTER JOIN in MySQL by taking a LEFT JOIN and RIGHT JOIN UNION.
```sql
SELECT * FROM Employees LEFT JOIN Salaries USING(employee_id)
UNION 
SELECT * FROM Employees RIGHT JOIN Salaries USING(employee_id)
```


    