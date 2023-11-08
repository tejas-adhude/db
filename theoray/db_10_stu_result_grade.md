```sql
-- Create a function to convert marks to grades
DELIMITER //

CREATE FUNCTION CalculateGrade(marks INT) RETURNS VARCHAR(10)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE grade VARCHAR(10);

    IF marks >= 90 THEN
        SET grade = 'A';
    ELSEIF marks >= 80 THEN
        SET grade = 'B';
    ELSEIF marks >= 70 THEN
        SET grade = 'C';
    ELSEIF marks >= 60 THEN
        SET grade = 'D';
    ELSE
        SET grade = 'F';
    END IF;

    RETURN grade;
END//

DELIMITER ;
```

1. **DETERMINISTIC**: This attribute means that the function always produces the same output given the same input. This is important for consistency and predictability. For instance, if the function is given the same marks for a student, it should always return the same grade.

2. **NO SQL**: This signifies that the function doesn’t interact with the database at all. It doesn't read or modify data. The function is self-contained and relies solely on input arguments.

3. **READS SQL DATA**: This indicates that the function reads data but doesn’t modify it. It's essential for functions that only retrieve information from the database but don't change anything.