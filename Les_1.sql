-- 1. Напишите запрос для создания таблицы fruits_info с столбцами: id, product, calories, protein, fats, carbohydrates. Для первого и третьего столбца укажите числовой формат, для второго универсальный с размером 30, для остальных столбцов укажите формат числа с плавающей точкой размером 4 символа, 2 из которых будут идти после точки.
CREATE TABLE fruits_info (id INT, product VARCHAR(30), calories INT, protein FLOAT(4,2), fats FLOAT(4,2), carbohydrates FLOAT(4,2));

-- 2. Получите описание структуры таблицы fruits_info, находящейся в базе данных my_base, используя полный путь к таблице
DESCRIBE my_base.fruits_info;

-- 3. Выберите в таблице fruits_info только нечетные столбцы(порядок столбцов начинается с 1, дополнительные фильтры не потребуются)
INSERT INTO fruits_info VALUES (1, "Абрикос", 48, 1.40, 0.39, 9.12); INSERT INTO fruits_info VALUES (2, "Ананас", 52, 0.30, 0.10, 11.80); INSERT INTO fruits_info VALUES (3, "Банан", 96, 1.50, 0.50, 21.00); INSERT INTO fruits_info VALUES (4, "Груша", 57, 0.36, 0.14, 12.13); INSERT INTO fruits_info VALUES (5, "Грейпфрут", 35, 0.70, 0.20, 6.50); INSERT INTO fruits_info VALUES (6, "Киви", 47, 0.80, 0.40, 8.10); INSERT INTO fruits_info VALUES (7, "Манго", 60, 0.82, 0.38, 13.38); INSERT INTO fruits_info VALUES (8, "Мандарин", 53, 0.81, 0.31, 11.54); INSERT INTO fruits_info VALUES (9, "Персик", 45, 0.90, 0.10, 9.50); INSERT INTO fruits_info VALUES (10, "Яблоко", 52, 0.26, 0.17, 11.41);
SELECT id, calories, fats FROM fruits_info;

-- 4. Добавьте к таблице fruits_info новую строку с информацией о малине (калории: 52; белки: 1.20; жиры: 0.65, углеводы: 5.44)
INSERT INTO fruits_info VALUES (11, "Малина", 52, 1.20, 0.65, 5.44);

-- 5. В таблице fruits_info выберите все строчки с фруктами, в которых меньше 50 калорий
SELECT * FROM fruits_info WHERE calories < 50;

-- 6. В таблице fruits_info выберите только уникальные значения в столбце calories
SELECT DISTINCT calories FROM fruits_info;