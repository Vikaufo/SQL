# SQL
### DDL and DML operations
- `SELECT` - для получения данных из выбранной таблицы
- `FROM` - table_name
- `SELECT DISTINCT` - для получения только неповторяющихся данных
- `WHERE` - для указания условий/фильтрации, например, name = 'Vika'. Условия: сравнение текста; сравнение численных значений; логические операции AND, OR и NOT
- `GROUP BY` - часто используется с агрегатными функциями, такими как COUNT, MAX, MIN, SUM и AVG, для группировки выходных значений.
- `ORDER BY` - используется для сортировки результатов запроса по убыванию или возрастанию. ORDER BY отсортирует по возрастанию, если не будет указан способ сортировки ASC или DESC
- `HAVING` - было добавлено в SQL по той причине, что WHERE не может использоваться для работы с агрегатными функциями. Пример: SELECT COUNT(course_id), dept_name FROM course GROUP BY dept_name HAVING COUNT(course_id)>1
- `BETWEEN` - для выбора значений данных из определенного промежутка. Могут быть использованы числовые и текстовые значения, а также даты
- `LIKE` - используется в WHERE, чтобы задать шаблон поиска похожего значения. % (ни одного, один или несколько символов); _ (один символ)
-  `IN` - можно указать несколько значений для оператора WHERE. WHERE <col_namen> IN (<value1>, <value2>, …)
- `CREATE` - создания новой таблицы. CREATE table courses (id INT(10) NOT NULL PRIMARY KEY, faculty VARCHAR(55) NULL, number INT(2) NULL)
- `INSERT INTO` - для вставки новых записей в таблицу. INSERT INTO <table_name> (<col_name1>, <col_name2>, <col_name3>, …)
  VALUES (<value1>, <value2>, <value3>, …)
- `UPDATE` - для обновления данных таблицы. UPDATE <table_name> SET <col_name1> = <value1>, <col_name2> = <value2>, ...WHERE <condition>
- `DELETE` - для удаления данных из таблицы. DELETE FROM Customers WHERE Customer_Name='Vika Shablova'
- `DROP` - удаляет таблицу и ее структуру из базы данных. DROP table <table_name>
