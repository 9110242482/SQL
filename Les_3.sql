-- 1. Получите список всех сотрудников с зарплатой НЕ равной 4800
SELECT * FROM employees WHERE salary != 4800;

-- 2. Выведите всю информацию для сотрудников с идентификатором больше 105 и с зарплатой меньшей или равной 10000
SELECT * FROM employees WHERE employee_id > 105 AND salary <= 10000;

-- 3. Получите список всех сотрудников, у которых идентификатор менеджера равен 203 или 205
SELECT * FROM employees WHERE manager_id IN (203,205);

-- 4. Получите список всех сотрудников, у которых в имени вторая буква 'e',  а последняя букв равна 'n'
SELECT * FROM employees WHERE first_name LIKE '_e%n';

-- 5. Получите список всех сотрудников с идентификатором 108 или 111, у которых есть значение в commision. Отсортируйте строки по столбцу с зарплатой(возрастающий порядок), используя его порядковый номер
SELECT * FROM employees WHERE employee_id IN (108,111) AND commision IS NOT NULL ORDER BY 5;

-- 6. Получите список всех сотрудников, у которых в имени содержатся минимум 2 буквы 'n'
SELECT * FROM employees WHERE first_name LIKE '%n%n%';

-- 7. Получите список всех сотрудников, у которых длина имени больше 4 букв
SELECT * FROM employees WHERE first_name LIKE '_____%';

-- 8. Получите список всех сотрудников, у которых зарплата находится в промежутке от 4000 до 24000 (включительно), нет бонуса (комиссионных) и в job_id содержатся следующие варианты: FI_MGR, AD_MARKET, ST_CLERK
SELECT * FROM employees WHERE salary BETWEEN 4000 AND 24000 AND commision IS NULL AND job_id IN('FI_MGR', 'AD_MARKET', 'ST_CLERK');

-- 9. Получите список всех сотрудников у которых в job_id содержится символ '%' (# таких значений в таблице нет, но запрос выполнится и отобразит пустую таблицу)
SELECT * FROM employees WHERE job_id LIKE '%\%%';

-- 10. Выведите информацию о job_id, имени и зарплате для работников, employee_id которых больше или равен 104 и job_id не равен IT_PROG. Отсортируйте строки по имени (убывающий порядок)
SELECT job_id, first_name, salary FROM employees WHERE employee_id >= 104 AND job_id != 'IT_PROG' ORDER BY first_name DESC;