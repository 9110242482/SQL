-- 1. Получите выборку по job_id с минимальной и максимальной зарплатой, с самой ранней и самой поздней датой начала работы и с количеством сотрудников, проведите сортировку по количеству сотрудников по убыванию
SELECT job_id, MIN(salary), MAX(salary), MIN(start_date), MAX(start_date), COUNT(*) FROM employees GROUP BY job_id ORDER BY COUNT(*) DESC;

-- 2. Отобразите информацию о первой букве имени сотрудника и количество имен, которые начинаются с этой буквы. Выведите только те строки, где количество имен начинающихся с одинаковой буквы больше 1 и отсортируйте по количеству по убыванию. Используйте одну из функций предыдущих уроков*
SELECT SUBSTR(first_name, 1,1) AS first_char, COUNT(*) FROM employees GROUP BY first_char HAVING COUNT(*) > 1 ORDER BY 2 DESC;

-- 3. Выведите job_id, зарплату и количество сотрудников, у которых один и тот же job_id и они получают одинаковую зарплату
SELECT job_id, salary, COUNT(*) FROM employees GROUP BY job_id, salary;

-- 4. Выведите название дня недели и количество сотрудников, которых приняли на работу в этот день
SELECT date_format(start_date, '%W') AS hire_date, COUNT(*) FROM employees GROUP BY hire_date;

-- 5. Выведите job_id, где работает больше 3 сотрудников и сумма их зарплат больше 25000
SELECT job_id FROM employees GROUP BY job_id HAVING COUNT(*) > 3 AND SUM(salary) > 25000;

-- 6. Выведите информацию о job_id и округленную среднюю зарплату работников для каждого job_id
SELECT job_id, ROUND(AVG(salary)) FROM employees GROUP BY job_id;

-- 7. Отобразите фамилии и все job_id, у которых средняя длина фамилий сотрудников больше или равна 6
SELECT last_name, job_id FROM employees GROUP BY job_id HAVING AVG(LENGTH(last_name)) >=6;

-- 8. Отобразите список менеджеров, у которых больше 1 сотрудника
SELECT manager_id, COUNT(*) FROM employees GROUP BY manager_id HAVING COUNT(*) > 1;

-- 9. Выведите информацию о manager_id, job_id, максимальную и минимальную зарплату для всех сочетаний manager_id - job_id, где средняя зарплата больше 8000
SELECT manager_id, job_id, MAX(salary), MIN(salary) FROM employees GROUP BY manager_id, job_id HAVING AVG(salary) > 8000;

-- 10. Получить список manager_id, у которых средняя зарплата всех его подчиненных не получающих комиссионные, находится в промежутке от 5000 до 10000
SELECT manager_id FROM employees WHERE commision IS NULL GROUP BY manager_id HAVING AVG(salary) BETWEEN 5000 AND 10000;

-- 11. Отобразите среднюю зарплату по всем job_id без дробной части
SELECT ROUND(AVG(salary)) FROM employees GROUP BY job_id;