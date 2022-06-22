-- 1. Отобразите всю информацию в результате объединения таблицы с сотрудниками с таблицей истории работ сотрудников по условию совпадения номера сотрудника и номера департамента
SELECT * FROM employees AS e INNER JOIN job_history AS jh ON(e.employee_id = jh.department_id);

-- 2. Отобразите информацию только об имени региона и названии страны в результате объединения таблицы регионов и страны по их полному совпадению столбцов
SELECT region_name, country_name FROM regions NATURAL JOIN countries;

-- 3. Отобразите всю информацию в результате объединения таблицы стран и таблицы с их локациями по условию совпадения общего столбца, используя USING
SELECT * FROM countries INNER JOIN locations USING(country_id);

-- 4. Отобразите информацию только об имени, фамилии сотрудника, его названии текущей работы, его названии прошлой работы в результате объединения таблицы с сотрудниками и таблицы истории работ сотрудников по условию совпадения общего столбца с номером сотрудника. Столбец с текущей работой назовите new, с предыдущей назовите previous
SELECT first_name, last_name, e.job_id AS new, jh.job_id AS previous FROM employees AS e INNER JOIN job_history AS jh ON(e.employee_id = jh.employee_id);

-- 5. Отобразите только имя, фамилию сотрудника, название страны, выполнив перекрестное соединение для таблицы с сотрудниками и таблицей со странами
SELECT first_name, last_name, country_name FROM employees CROSS JOIN countries;

-- 6. Отобразите всю информацию в результате левого объединения таблицы с сотрудниками с таблицей истории работ сотрудников по условию совпадения общего столбца с номером сотрудника
SELECT * FROM employees AS e LEFT JOIN job_history AS jh ON(e.employee_id = jh.employee_id);

-- 7. Отобразите всю информацию в результате полного объединения таблицы стран и таблицы локаций по условию совпадения их id
SELECT * FROM countries AS c LEFT JOIN locations AS l ON(c.country_id = l.country_id)
UNION
SELECT * FROM countries AS c RIGHT JOIN locations AS l ON(c.country_id = l.country_id);

-- 8. Отобразите только имя, фамилию, название работы сотрудника, где его зарплата будет больше минимальной зарплаты всех сотрудников с комиссионными*
SELECT first_name, last_name, job_id FROM employees WHERE salary > (SELECT MIN(salary) FROM employees WHERE commision IS NOT NULL);

-- 9. Отобразите всю информацию в результате объединения таблицы стран и таблицы с их локациями по условию совпадения общего столбца, отобразите только те строчки, в которых НЕ будет содержаться 'CA', 'US' *
SELECT * FROM countries INNER JOIN locations USING(country_id) WHERE country_id NOT IN ('CA', 'US');

-- 10. Отобразите информацию о country_id таблицы с локациями, общее количество таких строчек в результате объединения таблицы со странами с таблицей с локациями по условию совпадения country_id и далее с таблицей регионов по условия совпадения номера региона, сгруппировав по country_id таблицы с локациями, отсортировав по количеству по возрастанию*
SELECT locations.country_id, COUNT(*) FROM locations
INNER JOIN countries AS CON USING (country_id)
INNER JOIN regions AS REG USING (region_id)
GROUP BY locations.country_id ORDER BY 2;