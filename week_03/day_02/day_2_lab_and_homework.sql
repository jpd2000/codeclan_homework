/* Question 1.
 
(a). 	Find the first name, last name and team name of employees who are members of teams.*/

SELECT
	employees.first_name,
	employees.last_name,
	teams.name AS team
FROM employees INNER JOIN teams
ON employees.team_id = teams.id;



/*(b). 	Find the first name, last name and team name of employees who are members of teams and are enrolled in the pension scheme.*/

SELECT
	employees.first_name,
	employees.last_name,
	teams.name AS team,
	employees.pension_enrol
FROM employees INNER JOIN teams
ON employees.team_id = teams.id
WHERE pension_enrol IS TRUE;



/*(c). 	Find the first name, last name and team name of employees who are members of teams, 
-- 		where their team has a charge cost greater than 80.*/

SELECT 
	employees.first_name,
	employees.last_name,
	teams.name AS team,
	teams.charge_cost,
	CAST (charge_cost AS INTEGER)
FROM employees INNER JOIN teams
ON employees.team_id = teams.id
WHERE charge_cost > '80';
/* Produces the required table kinda...but it's empty :( */



/* Question 2.
 (a). 	Get a table of all employees details, together with their local_account_no and local_sort_code, if they have them.*/

SELECT
	employees.first_name,
	employees.last_name,
	pay_details.local_account_no,
	pay_details.local_sort_code
FROM employees INNER JOIN pay_details
ON employees.team_id = pay_details.id
ORDER BY last_name;


/*(b). 	Amend your query above to also return the name of the team that each employee belongs to.*/

SELECT
	employees.first_name,
	employees.last_name,
	pay_details.local_account_no,
	pay_details.local_sort_code,
	teams.name AS team
FROM 
	(employees INNER JOIN pay_details
	ON employees.team_id = pay_details.id)
INNER JOIN teams
ON employees.team_id = teams.id
ORDER BY last_name;



/* Question 3.
(a). 	Make a table, which has each employee id along with the team that employee belongs to.*/

SELECT
	employees.id AS employee_id,
	teams.name AS team
FROM employees INNER JOIN teams
ON employees.team_id = teams.id;



/* (b). Breakdown the number of employees in each of the teams.*/

SELECT
	teams.name AS team,
	COUNT(teams.name) AS num_employees
FROM employees INNER JOIN teams
ON employees.team_id = teams.id
GROUP BY teams.id
ORDER BY teams.id;



/*(c). 	Order the table above by so that the teams with the least employees come first.*/

SELECT
	teams.name AS team,
	COUNT(teams.name) AS num_employees
FROM employees INNER JOIN teams
ON employees.team_id = teams.id
GROUP BY teams.id
ORDER BY num_employees ASC;



/* Question 4.
(a). 	Create a table with the team id, team name and the count of the number of employees in each team.*/

SELECT
	teams.id AS team_id,
	teams.name AS team_name,
	COUNT(teams.name) AS num_employees
FROM employees INNER JOIN teams
ON employees.team_id = teams.id
GROUP BY teams.id
ORDER BY teams.id;



/*(b).  The total_day_charge of a team is defined as the charge_cost of the team multiplied by the number of employees in the team. 
		Calculate the total_day_charge for each team.*/

SELECT
	teams.id AS team_id,
	teams.name AS team_name,
	charge_cost,
	COUNT(teams.name) AS num_employees
	COUNT (num_employees * charge_cost) AS total_day_charge
FROM employees INNER JOIN teams
ON employees.team_id = teams.id
GROUP BY teams.charge_cost
ORDER BY total_day_charge;

/* Doesnt work */


/*(c).  How would you amend your query from above to show only those teams with a total_day_charge greater than 5000?*/


/*2 	Extension


Question 5.
 
		How many of the employees serve on one or more committees?*/



/*Question 6.

		How many of the employees do not serve on a committee?*/
