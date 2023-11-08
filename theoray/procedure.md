Stored procedures in MySQL are precompiled SQL statements that are stored on the database server and can be called and executed by applications or users. They are used to encapsulate and manage a set of SQL queries and logic, providing a more efficient and organized way to perform database operations. Here are some key points about stored procedures:

1. **Creation**: Stored procedures are created using the `CREATE PROCEDURE` statement in MySQL. They can include SQL statements, control structures (like loops or conditional statements), variables, input and output parameters, and more complex logic.

    Example of creating a simple stored procedure:

    ```sql
    DELIMITER //
    CREATE PROCEDURE GetCustomerDetails (IN customerID INT)
    BEGIN
        SELECT * FROM customers WHERE id = customerID;
    END //
    DELIMITER ;
    ```

2. **Parameters**: Stored procedures can have input, output, or input-output parameters. These parameters allow values to be passed into the procedure, and sometimes returned from it.

    Example of a procedure with an input parameter:

    ```sql
    CREATE PROCEDURE UpdateProductPrice (IN productID INT, IN newPrice DECIMAL(10,2))
    BEGIN
        UPDATE products SET price = newPrice WHERE id = productID;
    END
    ```


Example of calling the `GetCustomerDetails` procedure:

```sql
CALL GetCustomerDetails(123);
```

1. **IN Parameters**: These are used to pass values into the stored procedure. They are read-only within the procedure, meaning they can't be modified within the procedure. They act as input values.

   Example of an `IN` parameter:

   ```sql
   CREATE PROCEDURE GetProductDetails (IN productID INT)
   BEGIN
       SELECT * FROM products WHERE id = productID;
   END
   ```

2. **OUT Parameters**: These parameters allow the stored procedure to pass values back to the calling program or environment. They act as output values.

   Example of an `OUT` parameter:

   ```sql
   CREATE PROCEDURE GetProductCount (OUT totalProducts INT)
   BEGIN
       SELECT COUNT(*) INTO totalProducts FROM products;
   END
   ```

3. **INOUT Parameters**: These parameters act as both input and output. They allow values to be passed into the procedure and modified within the procedure, with the modified values being returned to the calling program or environment.

   Example of an `INOUT` parameter:

   ```sql
   CREATE PROCEDURE IncreaseProductPrice (INOUT productPrice DECIMAL(10,2), IN increaseAmount DECIMAL(10,2))
   BEGIN
       SET productPrice = productPrice + increaseAmount;
   END
   ```

To call a stored procedure with parameters, you provide the appropriate values in the `CALL` statement. For example:

```sql
CALL GetProductDetails(5); -- Calling a procedure with an IN parameter

CALL GetProductCount(@total); -- Calling a procedure with an OUT parameter and storing the result in variable @total

SET @price = 50.00;
CALL IncreaseProductPrice(@price, 10.00); -- Calling a procedure with an INOUT parameter
```

## If you want to drop (delete) the entire stored procedure itself, you can use the DROP PROCEDURE statement:

```sql
DROP PROCEDURE IF EXISTS DeleteEmployeesByDepartment;
```