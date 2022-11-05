
-- Deliverable 1: The Number of Retiring Employees by Title 

SELECT e.emp_no,
		e.first_name, 
		e.last_name, 
		ti.title, 
		ti.from_date, 
		ti.to_date	
INTO retirement_titles

FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

ORDER BY e.emp_no;

-- DISTINCT 

SELECT DISTINCT ON (r.emp_no) 
	r.emp_no,
	r.first_name,
	r.last_name,
	r.title
INTO unique_titles
FROM retirement_titles as r
ORDER BY r.emp_no, r.to_date DESC;

-- COUNT

SELECT COUNT(u.title), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY count DESC;


-- Deliverable 2: The Employees Eligible for the 

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	d.from_date,
	d.to_date,
	t1.title
INTO mentorship_eligibility 
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as t1
ON (e.emp_no = t1.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (d.to_date  = '9999-01-01')  
ORDER BY e.emp_no, to_date DESC;  


