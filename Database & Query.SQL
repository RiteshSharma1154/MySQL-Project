-- Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(100),
    department_id INT,
    -- Additional attributes as needed
);

-- Department table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    -- Additional attributes as needed
);

-- Payroll table
CREATE TABLE Payroll (
    payroll_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10, 2),
    payment_method VARCHAR(50),
    -- Additional attributes as needed
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- Leave table
CREATE TABLE Leaves (
    leave_id INT PRIMARY KEY,
    employee_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    -- Additional attributes as needed
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- Tax table
CREATE TABLE Tax (
    tax_id INT PRIMARY KEY,
    employee_id INT,
    tax_amount DECIMAL(10, 2),
    -- Additional attributes as needed
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- Bonus table
CREATE TABLE Bonus (
    bonus_id INT PRIMARY KEY,
    employee_id INT,
    bonus_amount DECIMAL(10, 2),
    -- Additional attributes as needed
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- Insurance table
CREATE TABLE Insurance (
    insurance_id INT PRIMARY KEY,
    employee_id INT,
    insurance_type VARCHAR(100),
    -- Additional attributes as needed
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);




---Add Employee:
DELIMITER //
CREATE PROCEDURE AddEmployeeWithSampleData()
BEGIN
    -- Sample employee data
    DECLARE emp_name VARCHAR(255);
    DECLARE emp_role VARCHAR(100);
    DECLARE dept_id INT;
    
    SET emp_name = 'John Doe';
    SET emp_role = 'Software Engineer';
    SET dept_id = 1; -- Assuming department ID 1 is for the IT department
    
    -- Insert employee into Employee table
    INSERT INTO Employee (name, role, department_id) 
    VALUES (emp_name, emp_role, dept_id);
    
    -- Add more sample data
    SET emp_name = 'Alice Smith';
    SET emp_role = 'HR Manager';
    SET dept_id = 2; -- Assuming department ID 2 is for the HR department
    
    INSERT INTO Employee (name, role, department_id) 
    VALUES (emp_name, emp_role, dept_id);
END //
DELIMITER ;


---Update Employee:
DELIMITER //
CREATE PROCEDURE UpdateEmployeeWithSampleData()
BEGIN
    -- Sample employee data
    DECLARE emp_id INT;
    DECLARE new_name VARCHAR(255);
    DECLARE new_role VARCHAR(100);
    DECLARE new_dept_id INT;
    
    SET emp_id = 1; -- Assuming employee ID 1 exists
    SET new_name = 'Jane Smith';
    SET new_role = 'Senior Software Engineer';
    SET new_dept_id = 2; -- Assuming department ID 2 is for the HR department
    
    -- Update employee information
    UPDATE Employee 
    SET name = new_name, 
        role = new_role, 
        department_id = new_dept_id 
    WHERE employee_id = emp_id;
END //
DELIMITER ;


---Delete Employee:
DELIMITER //
CREATE PROCEDURE DeleteEmployeeWithSampleData()
BEGIN
    -- Sample employee data
    DECLARE emp_id INT;
    
    SET emp_id = 1; -- Assuming employee ID 1 exists
    
    -- Delete employee from Employee table
    DELETE FROM Employee WHERE employee_id = emp_id;
END //
DELIMITER ;


---Apply Leave:
DELIMITER //
CREATE PROCEDURE ApplyLeaveWithSampleData()
BEGIN
    -- Sample leave application data
    DECLARE emp_id INT;
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    
    SET emp_id = 1; -- Assuming employee ID 1 exists
    SET start_date = '2024-04-15';
    SET end_date = '2024-04-20';
    
    -- Apply leave for employee
    INSERT INTO Leaves (employee_id, start_date, end_date, status)
    VALUES (emp_id, start_date, end_date, 'Pending');
END //
DELIMITER ;


Provide Bonus:
DELIMITER //
CREATE PROCEDURE ProvideBonusWithSampleData()
BEGIN
    -- Sample bonus data
    DECLARE emp_id INT;
    DECLARE bonus_amount DECIMAL(10, 2);
    
    SET emp_id = 1; -- Assuming employee ID 1 exists
    SET bonus_amount = 500.00; -- Sample bonus amount
    
    -- Provide bonus to employee
    INSERT INTO Bonus (employee_id, bonus_amount)
    VALUES (emp_id, bonus_amount);
END //
DELIMITER ;


--Add Insurance:
DELIMITER //
CREATE PROCEDURE AddInsuranceWithSampleData()
BEGIN
    -- Sample insurance data
    DECLARE emp_id INT;
    DECLARE insurance_type VARCHAR(100);
    
    SET emp_id = 1; -- Assuming employee ID 1 exists
    SET insurance_type = 'Health Insurance'; -- Sample insurance type
    
    -- Add insurance for employee
    INSERT INTO Insurance (employee_id, insurance_type)
    VALUES (emp_id, insurance_type);
    
    -- Add more sample insurance data
    SET emp_id = 2; -- Assuming employee ID 2 exists
    SET insurance_type = 'Life Insurance'; -- Sample insurance type
    
    INSERT INTO Insurance (employee_id, insurance_type)
    VALUES (emp_id, insurance_type);
END //
DELIMITER ;
