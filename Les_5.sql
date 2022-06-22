-- 1. Преобразите число 20210710 в дату
SELECT CONVERT(20210101, DATE) from dual;

-- 2. Получите список всех сотрудников у которых в имени есть буква 'b' (без учета регистра).
SELECT * FROM employees WHERE LOWER(first_name) LIKE '%b%';

-- 3. Отобразите сегодняшнюю дату в формате: 19th February 2021
SELECT date_format(SYSDATE(), '%D %M %Y') from dual;

-- 4. Явно преобразите текст '7.776544' в число с дробной частью и выведите значение с позиции 3, чтобы в результате получилось 777; используйте nested  *
SELECT SUBSTR(CONVERT(7.776544, DECIMAL(7,3)), 3);

-- 5. Выведите на экран имя сотрудника, дату начала работы по условию: что дата начала должна быть больше или равна 2005 году, если это так, тогда третьим столбцом должно выводиться сообщение 'ok'
SELECT first_name, start_date, CASE 
WHEN start_date >= '2005.01.01' THEN 'ok' 
END FROM employees;

-- 6. Выведите фамилию сотрудника, его комиссионные, зарплату– если комиссионные есть тогда в последнем столбце с названием 'bonus' выводится их значение умноженное на зарплату, в другом случае выводится сообщение 'no' (попробуйте НЕ использовать conditional function)
SELECT last_name, commision, salary, IFNULL(commision*salary, 'no') AS bonus FROM employees;

-- 7. Выведите имя сотрудника, и значение комиссионных если оно присутствует, если нет, то id его менеджера, если и оно отсутствует, то его job_id (попробуйте НЕ использовать conditional function)
SELECT first_name, COALESCE(commision, manager_id, job_id) FROM employees;

-- 8. Выведите имя сотрудника, его зарплату, а также уровень зарплаты каждого сотрудника: Меньше 4500 считается Low level, Больше или равно 4500 и меньше 9000 считается Normal level, Больше или равно 9000 считается High level
SELECT first_name, salary, CASE 
WHEN salary < 4500 THEN 'Low level' 
WHEN salary >= 4500 AND salary < 9000 THEN 'Normal level' 
WHEN salary >= 9000 THEN 'High level' 
END FROM employees;

-- 9. Выведите имя, фамилию сотрудника и оценку суммы длины его имени и фамилии по принципу: если сумма длины имени и фамилии сотрудника 10, то выводится сообщение 'Short', если 12 то 'Normal', если 15 то 'Long' в других случаях выводится 'Unknown'
SELECT first_name, last_name, CASE LENGTH(first_name) + LENGTH(last_name)
WHEN 10 THEN 'Short'
WHEN 12 THEN 'Normal'
WHEN 15 THEN 'Long'
ELSE 'Unknown'
END FROM employees;

-- 10. Выведите имя сотрудника, его зарплату, а также уровень того, насколько у сотрудника хорошие условия: *BAD: зарплата меньше 7000 и отсутствие комиссионных; NICE зарплата между 7000 и 12000 или, если присутствуют комиссионные; GOOD: зарплата больше или равна 15000; Столбец с оценкой уровня назовите Work conditions
SELECT first_name, salary, CASE
WHEN salary < 7000 AND commision IS NULL THEN 'BAD'
WHEN salary BETWEEN 7000 AND 12000 OR commision IS NOT NULL THEN 'Nice'
WHEN salary >= 15000 THEN 'GOOD'
END AS 'Work conditions' FROM employees;