-- 1. Получите список всех сотрудников, у которых длина имени больше 5 букв
SELECT * FROM employees WHERE LENGTH(first_name) > 5;

-- 2. Получите список всех сотрудников, зарплата которых кратна 2000
SELECT * FROM employees WHERE MOD(salary, 2000)=0;

-- 3. Выведите последние 2 цифры в номере +7-911-123-45-60
SELECT SUBSTR('+7-911-123-45-60', 15, 2) FROM DUAL;

-- 4. Получите фамилии сотрудников в верхнем регистре, у которых длина фамилии больше 6-ти и длина имени меньше 6-ти
SELECT UPPER(last_name) FROM employees WHERE LENGTH(last_name) > 6 AND LENGTH(first_name) < 6;

-- 5. Выведите последний день текущего месяца (не забудьте про скобки)
SELECT LAST_DAY(SYSDATE()) FROM DUAL;

-- 6. Получите список всех сотрудников, которые отработали в компании больше 50 месяцев*
SELECT * FROM employees WHERE timestampdiff(MONTH, start_date, end_date) > 50;

-- Выведите дату завершения работы, заменив в её значениях все '-' на '.'
SELECT REPLACE(end_date, '-', '.') FROM employees;

-- 8. Выведите имя, last_name, job_id для всех работников в формате:  David AUSTIN it_prog
SELECT CONCAT(first_name, ' ', UPPER(last_name), ' ', LOWER(job_id)) FROM employees;

-- 9. Выведите информацию об именах работников и их зарплатах в таком виде: Neena17000
SELECT CONCAT(first_name, salary) FROM employees;

-- 10. Выведите информацию об имени и фамилии всех работников. Имя должно состоять из 12 символов и если длина имени меньше 12, то после имени дополняйте до 12 символов знаком $. Фамилия должна состоять из 17 символов и если длина фамилии меньше 17, то перед фамилией дополняйте до 17 символов знаком !
SELECT RPAD(first_name, 12, '$'), LPAD(last_name, 17, '!') FROM employees;

-- 11. Выведите имя сотрудника и позицию первой найденной буквы 'a' в его имени
SELECT first_name, INSTR(first_name, 'a') FROM employees;

-- 12.  Выведите на экран текст '!!HELLO! HOW ARE YOU?!!!!!!!!' и тот же текст, но без символа восклицательный знак в начале и конце текста
SELECT '!!HELLO! HOW ARE YOU?!!!!!!!!', TRIM('!' FROM '!!HELLO! HOW ARE YOU?!!!!!!!!') FROM DUAL;

-- 13. Выведите информацию о: зарплате работника, зарплате умноженной на коэффициент 3.1314,округлённый до целого значения вариант умноженной зарплаты,умноженную зарплату без дробной части
SELECT salary, salary*3.1314, ROUND(salary*3.1314), TRUNCATE(salary*3.1314, 0) FROM employees;

-- 14. Выведите информацию о:  дате начала работы сотрудника,дате, которая была через полтора года, после начала работы сотрудника, дате последнего дня в месяце принятия сотрудника на работу
SELECT start_date, ADDDATE(start_date, INTERVAL 18 MONTH), LAST_DAY(start_date)
FROM employees;