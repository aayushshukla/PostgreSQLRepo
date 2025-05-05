/*
    A trigger in PostgreSQL is a database object that automatically executes a specified function 
	in response to certain events (like INSERT, UPDATE, DELETE, or TRUNCATE) on a table or view.

Triggers are commonly used for:

	Enforcing business rules
	Auditing changes
	Validating data
	Cascading operations

Types of Triggers in PostgreSQL
	1. Timing
	BEFORE: Trigger fires before the operation (can modify data).
	
	AFTER: Trigger fires after the operation (good for logging).
	
	INSTEAD OF: Used with views to simulate updates on them.

2. Events
	INSERT
	UPDATE
	DELETE
	TRUNCATE

3. Scope
	FOR EACH ROW: Trigger fires once per row affected.
	FOR EACH STATEMENT: Trigger fires once per SQL statement, regardless of rows affected.

CREATE TRIGGER trigger_name
{BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
ON table_name
[FOR EACH ROW | FOR EACH STATEMENT]
EXECUTE FUNCTION trigger_function_name();


NEW
	Represents the new row being inserted or updated.
	Available in: BEFORE INSERT, AFTER INSERT, BEFORE UPDATE, AFTER UPDATE, INSTEAD OF INSERT, INSTEAD OF UPDATE.

Use NEW when:
   Validating or modifying inserted/updated values.
   Logging or acting upon new values.


OLD
	Represents the existing row before it was updated or deleted.
	
	Available in: BEFORE UPDATE, AFTER UPDATE, BEFORE DELETE, AFTER DELETE, INSTEAD OF UPDATE, INSTEAD OF DELETE.
 Use OLD when:
	Comparing changes (e.g., OLD.title != NEW.title)
	Logging what was deleted or changed
	Archiving deleted data

Rules and practices 


	  Use BEFORE triggers to validate or modify data before writing to the table.
	   Use AFTER triggers for logging and audit trails, as the operation has succeeded.
	    Avoid long or complex operations inside triggers — they can slow down transactions.
	     Always return NEW or OLD from the trigger function depending on the type:
	   RETURN NEW; for INSERT or UPDATE
	    RETURN OLD; for DELETE

Test thoroughly: Trigger bugs are often hard to trace because they're invisible unless something goes wrong.


*/

select * from employees;


  -- Function to check hire date before inserting new employee
CREATE OR REPLACE FUNCTION trg_check_hire_date()
RETURNS TRIGGER AS $$
BEGIN
    -- Raise an error if hire_date is before 1990
    IF NEW.hire_date < DATE '1990-01-01' THEN
        RAISE EXCEPTION 'Hire date must be after 1990.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

	-- Trigger that calls the above function before any insert
	CREATE TRIGGER before_insert_employee  -- trigger execute
	BEFORE INSERT ON Employees
	FOR EACH ROW
	EXECUTE FUNCTION trg_check_hire_date();

insert into employees (employee_id,last_name,first_name,title,hire_date) values (10,'Shukla','Aayush','Trainer','1989-01-01'); -- event
insert into employees (employee_id,last_name,first_name,title,hire_date) values (10,'Shukla','Aayush','Trainer','1992-01-01');




   -- Table to store logs of title changes
CREATE TABLE EmployeeTitleChanges (
    log_id SERIAL PRIMARY KEY,
    employee_id INT,
    old_title VARCHAR(100),
    new_title VARCHAR(100),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Function to log old and new titles if they differ
CREATE OR REPLACE FUNCTION trg_log_title_change()
RETURNS TRIGGER AS $$
BEGIN
    -- Log the change only if the title has changed
    IF OLD.title IS DISTINCT FROM NEW.title THEN
        INSERT INTO EmployeeTitleChanges (employee_id, old_title, new_title)
        VALUES (OLD.employee_id, OLD.title, NEW.title);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

	-- Trigger that runs after any update on Employees table
	CREATE TRIGGER after_title_update
	AFTER UPDATE ON Employees
	FOR EACH ROW
	EXECUTE FUNCTION trg_log_title_change();


update employees set title='Sr.Trainer' where employee_id=10

select * from  EmployeeTitleChanges


    -- Archive table to keep a record of deleted employees
CREATE TABLE DeletedEmployeesArchive (
    employee_id INT,
    first_name TEXT,
    last_name TEXT,
    title TEXT,
    hire_date DATE,
    city TEXT,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Function to insert deleted employee data into archive table
CREATE OR REPLACE FUNCTION trg_archive_employee()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO DeletedEmployeesArchive (
        employee_id, first_name, last_name, title, hire_date, city
    ) VALUES (
        OLD.employee_id, OLD.first_name, OLD.last_name, OLD.title, OLD.hire_date, OLD.city
    );
    RETURN OLD;
	END;
	$$ LANGUAGE plpgsql;
	
	-- Trigger that activates after a row is deleted from Employees
	CREATE TRIGGER after_employee_delete
	AFTER DELETE ON Employees
	FOR EACH ROW
	EXECUTE FUNCTION trg_archive_employee();


   delete from employees where employee_id=10

   select * from DeletedEmployeesArchive



-- Create a view showing only usa employees
CREATE VIEW ActiveEmployees AS
SELECT * FROM Employees WHERE country = 'USA';

-- Function to handle insert on the view by inserting into the base table
CREATE OR REPLACE FUNCTION trg_insert_active_employee()
RETURNS TRIGGER AS $$
BEGIN
    -- Insert into Employees with is_active set to TRUE
    INSERT INTO Employees (
      employee_id,  first_name, last_name, title, hire_date, city, country
    ) VALUES (
     New.employee_id,  NEW.first_name, NEW.last_name, NEW.title, NEW.hire_date, NEW.city, 'USA'
    );
    RETURN NULL; -- Must return NULL for INSTEAD OF triggers
END;
$$ LANGUAGE plpgsql;

-- INSTEAD OF INSERT trigger for the view
CREATE TRIGGER instead_of_insert_active_employee
INSTEAD OF INSERT ON ActiveEmployees
FOR EACH ROW
EXECUTE FUNCTION trg_insert_active_employee();


SELECT * FROM Employees;

insert into ActiveEmployees (employee_id,last_name,first_name,title,hire_date,city) values (10,'Shukla','Aayush','Trainer','1991-01-01','Delhi'); 

