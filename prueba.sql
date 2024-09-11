#ejercicio 1
SELECT emp_no, first_name, last_name, gender, hire_date 
FROM employees 
WHERE hire_date >= 2000-01-01
LIMIT 10;

#ejercicio2

SELECT e.emp_no, e.first_name, e.last_name, s.salario_max
FROM employees e
JOIN (
	SELECT emp_no, MAX(salary) AS salario_max
	FROM salaries
	GROUP BY emp_no
) s ON e.emp_no = s.emp_no 
LIMIT 10;

#ejercicio3
SELECT e.emp_no, e.first_name, e.last_name, s.salario_prom
FROM employees e
JOIN (
	SELECT emp_no, AVG(salary) AS salario_prom
	FROM salaries
	GROUP BY emp_no
) s ON e.emp_no = s.emp_no 
LIMIT 10;


#ejercicio4
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN (
	SELECT de.emp_no, de.dept_no, d.dept_no, d.dept_name
	FROM 	dept_emp de
	INNER JOIN departments D ON de.dept_no = d.dept_no
	GROUP BY de.emp_no 
) d
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no

;

SELECT de.emp_no, de.dept_no, d.dept_no, d.dept_name
	FROM 	dept_emp de
	INNER JOIN departments D ON de.dept_no = d.dept_no
	GROUP BY de.emp_no 
