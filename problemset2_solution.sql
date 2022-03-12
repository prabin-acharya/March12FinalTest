SELECT
    d.Name AS "Department", e.Name AS "Employee", e.Salary AS "Salary"
FROM
    Employee e
JOIN
    Department d ON e.DepartmentId = d.Id
--  employee whose salary is among top three(i.e.count of salary more then its should be less then 3)
WHERE
    (SELECT COUNT(DISTINCT Salary)
    FROM Employee
    WHERE Salary > e.Salary AND e.DepartmentId = DepartmentId
    ) < 3
ORDER BY d.Name,e.Salary DESC
;

--  Department | Employee | Salary 
-- ------------+----------+--------
--  IT         | Max      |  90000
--  IT         | Joe      |  85000
--  IT         | Randy    |  85000
--  IT         | Will     |  70000
--  Sales      | Henry    |  80000
--  Sales      | Sam      |  60000
-- (6 rows)