## used for managing data within a database.

1. **SELECT**: Retrieves data from a database. It's used to query and fetch data from one or more tables.

   ```sql
   SELECT column1, column2 FROM table_name WHERE condition;
   ```

2. **INSERT**: Adds new records or rows into a table.

   ```sql
   INSERT INTO table_name (column1, column2) VALUES (value1, value2);
   ```

3. **UPDATE**: Modifies existing records in a table.

   ```sql
   UPDATE table_name SET column1 = value1 WHERE condition;
   ```

4. **DELETE**: Removes records from a table.

   ```sql
   DELETE FROM table_name WHERE condition;
   ```

5. **MERGE** (Starting from MySQL 8.0): Performs insert, update, or delete operations on a target table based on the results of a join with a source table.

   ```sql
   MERGE INTO target_table USING source_table ON condition
   WHEN MATCHED THEN
   UPDATE SET column1 = value1
   WHEN NOT MATCHED THEN
   INSERT (column1, column2) VALUES (value1, value2)
   ```

6. **REPLACE**: Replaces rows in a table. If the row exists, it will be replaced. If not, a new row will be inserted.

   ```sql
   REPLACE INTO table_name (column1, column2) VALUES (value1, value2);
   ```
