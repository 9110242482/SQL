-- Выведите информацию об имени, фамилии, id работы и зарплате для всех работников
SELECT first_name, last_name, job_id, salary FROM employees;

-- 2. Выведите информацию о id работника, имени, дате окончания работы, зарплате сниженной на 1000
SELECT employee_id, first_name, end_date, salary - 1000 FROM employees;

-- 3. Выведите информацию об имени и фамилии работников через пробел в одном столбце
SELECT CONCAT(first_name," ",last_name) FROM employees;

-- 4. Выведите столбец с уникальными зарплатами среди работников. Столбец на выводе назовите Only unique salary
SELECT DISTINCT salary AS "Only unique salary" FROM employees;

-- 5. Выведите первые 3 столбца в таблице. Столбцы на выводе назовите: ID, FIRST_NAME, LAST NAME
SELECT employee_id AS ID, first_name AS FIRST_NAME, last_name AS "LAST NAME" FROM employees;

-- 6. Выведите столбец с фамилиями и столбец в котором в днях подсчитано суммарное время работы сотрудника с фамилией "Walker"
SELECT last_name, DATEDIFF(end_date, start_date) FROM employees WHERE last_name = 'Walker';

-- 7. Выведите в один столбец и строчку предложение: What's the capital of Madagascar? , используя один из двух способов работы с одинарными кавычками.
SELECT "What's the capital of Madagascar?" FROM DUAL;

-- 8. Выведите в один столбец и строчку предложение: What's the capital of Madagascar? , используя, отличный от предыдущего примера, способ работы с одинарными кавычками.
SELECT 'What''s the capital of Madagascar?' FROM DUAL;

-- 9. Выведите в один столбец и строчку количество минут в сутках
SELECT 24*60 FROM DUAL;

-- 10. Подкорректируйте запрос, чтобы он стал рабочим: SELECT employee_id, first_name	FROM employees	WHERE job_id = AD_SUP;
SELECT employee_id, first_name FROM employees WHERE job_id = 'AD_SUP';

-- 11. Подкорректируйте запрос, чтобы он стал рабочим: CREATE TABLE names(employee_name VARCHAR(20), number INT, employee info VARCHAR(20));
CREATE TABLE `names`(employee_name VARCHAR(20), `number` INT, `employee info` VARCHAR(20));

-- 12. Подкорректируйте запрос, чтобы он стал рабочим: SELECT * FROM employees;WHERE salary < '24000'ORDER BY DESC salary;
SELECT * FROM employees WHERE salary < 24000 ORDER BY salary DESC;