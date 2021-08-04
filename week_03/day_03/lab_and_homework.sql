--MVP

--Q1
SELECT
	employees
FROM
	employees
WHERE salary IS NULL AND grade IS NULL;


--Q2
SELECT
	department,
	CONCAT (first_name, ' ', last_name) AS full_name
FROM employees
ORDER BY department, full_name;


--Q3
SELECT *
FROM employees
WHERE last_name LIKE 'A%'
ORDER BY salary DESC NULLS LAST
LIMIT 10;


--Q4
SELECT 
  department, 
  COUNT(*) AS started_2003
FROM employees 
WHERE start_date BETWEEN '2003-01-01' AND '2003-12-31'
GROUP BY department;



--Q5
SELECT
	department,
	fte_hours,
	COUNT (*) AS fte_total
FROM 
	employees
GROUP BY department, fte_hours
ORDER BY department;


--Q6
SELECT
	pension_enrol,
	COUNT (*) AS fte_total
FROM 
	employees
GROUP BY pension_enrol;


--Q7
SELECT *
FROM employees
WHERE department = 'Accounting' AND pension_enrol IS FALSE
ORDER BY salary DESC NULLS LAST
LIMIT 1;


--Q8
SELECT
	COUNT(id) as num_employees,
	country
FROM employees
GROUP BY country
HAVING > '30';



--Q9
SELECT 
	first_name,
	last_name,
	fte_hours,
	salary,
	COUNT(fte_hours * salary) AS effective_yearly_salary
FROM employees
HAVING COUNT(*) > 30000;



--Q10
SELECT *
FROM teams INNER JOIN employees 
ON teams.id = team_id
WHERE teams.id IN (7,8)
ORDER BY name;


--Q11
SELECT 
	first_name,
	last_name,
	local_tax_code
FROM employees INNER JOIN pay_details 
ON employees.id = pay_details.id
WHERE local_tax_code IS NULL;


--Q12
SELECT *
   COUNT(48 * 35) * CAST(t.charge_cost AS INT - salary) AS expected_profit
FROM employees AS e INNER JOIN teams AS t
ON e.team_id = t.id;


--Q13
SELECT
	first_name,
	last_name,
	salary
FROM employees
WHERE country = 'Japan';


--Q14
SELECT 
	first_name,
	Last_name,
	department
FROM employees
WHERE first_name IS NULL
GROUP BY department
HAVING >= 2;




