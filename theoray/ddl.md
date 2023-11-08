## used for defining or modifying the structure of a database or schema.

1. **CREATE TABLE:** It is used to create a new table in the database.

    ```sql
    CREATE TABLE table_name (
        column1 datatype,
        column2 datatype,
        column3 datatype,
        ...
    );
    ```

2. **DROP TABLE:** Deletes a table and its data from the database.

    ```sql
    DROP TABLE table_name;
    ```

3. **ALTER TABLE:** Modifies an existing table by adding, modifying, or dropping columns.

    ```sql
    ALTER TABLE table_name
    ADD column_name datatype;

    ALTER TABLE table_name
    MODIFY column_name datatype;

    ALTER TABLE table_name
    DROP COLUMN column_name;
    ```

4. **TRUNCATE TABLE:** Removes all records from a table without removing the table itself.

    ```sql
    TRUNCATE TABLE table_name;
    ```

5. **CREATE INDEX:** Creates an index on a table, which can improve the speed of data retrieval.

    ```sql
    CREATE INDEX index_name
    ON table_name (column1, column2, ...);
    ```

6. **DROP INDEX:** Removes an existing index from the database.

    ```sql
    DROP INDEX index_name;
    ```

7. **CREATE DATABASE:** Creates a new database.

    ```sql
    CREATE DATABASE database_name;
    ```

8. **DROP DATABASE:** Deletes an existing database and all its associated tables, data, indexes, and other objects.

    ```sql
    DROP DATABASE database_name;
    ```

9. **RENAME TABLE:** Changes the name of a table.

    ```sql
    RENAME TABLE old_table_name TO new_table_name;
    ```
