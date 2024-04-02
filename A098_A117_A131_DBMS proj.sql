CREATE DATABASE DBMS;
USE DBMS;

CREATE TABLE Vehicle (
    vehicle_id INT PRIMARY KEY,
    make VARCHAR(30),
    model_name VARCHAR(30),
    year INT,
    mileage DECIMAL(10, 2),
    transmission VARCHAR(30),
    engine_type VARCHAR(30),
    color VARCHAR(30),
    acquisition_date DATE,
    acquisition_cost DECIMAL(10, 2),
    list_price DECIMAL(10, 2),
    stock_status VARCHAR(30)
);
INSERT INTO Vehicle VALUES 
(1, 'Honda', 'Accord', 2018, 30000, 'Automatic', 'Gasoline', 'Blue', '2023-01-15', 20000.00, 25000.00, 'Available'),
(2, 'Toyota', 'Camry', 2017, 35000, 'Automatic', 'Hybrid', 'Silver', '2023-02-20', 22000.00, 27000.00, 'Available'),
(3, 'Ford', 'Explorer', 2019, 25000, 'Automatic', 'Gasoline', 'Black', '2023-03-10', 28000.00, 32000.00, 'Available'),
(4, 'Chevrolet', 'Silverado', 2016, 40000, 'Automatic', 'Gasoline', 'Red', '2023-04-05', 18000.00, 22000.00, 'Available'),
(5, 'BMW', 'X5', 2019, 20000, 'Automatic', 'Gasoline', 'White', '2023-05-12', 35000.00, 38000.00, 'Unavailable'),
(6, 'Mercedes-Benz', 'C-Class', 2018, 28000, 'Automatic', 'Gasoline', 'Gray', '2023-06-18', 27000.00, 30000.00, 'Available'),
(7, 'Audi', 'Q5', 2019, 22000, 'Automatic', 'Hybrid', 'Green', '2023-07-25', 32000.00, 35000.00, 'Unavailable'),
(8, 'Nissan', 'Altima', 2017, 32000, 'Automatic', 'Gasoline', 'Black', '2023-08-03', 21000.00, 24000.00, 'Available'),
(9, 'Subaru', 'Forester', 2018, 26000, 'Automatic', 'Gasoline', 'Blue', '2023-09-14', 23000.00, 26000.00, 'Available'),
(10, 'Jeep', 'Wrangler', 2016, 38000, 'Manual', 'Gasoline', 'Red', '2023-10-22', 19000.00, 23000.00, 'Available');

CREATE TABLE Feature (
    feature_id INT PRIMARY KEY,
    name VARCHAR(30),
    description TEXT
);
INSERT INTO Feature VALUES 
(1, 'Sunroof', 'Power-operated glass panel roof'),
(2, 'Leather Seats', 'Luxurious leather upholstery'),
(3, 'Navigation System', 'Built-in GPS navigation system'),
(4, 'Bluetooth Connectivity', 'Wireless connectivity for smartphones'),
(5, 'Backup Camera', 'Rear-view camera for parking assistance'),
(6, 'Blind Spot Monitoring', 'Alerts driver of vehicles in blind spots'),
(7, 'Lane Departure Warning', 'Alerts driver if the vehicle begins to drift out of its lane'),
(8, 'Heated Seats', 'Front seats with heating function'),
(9, 'Keyless Entry', 'Remote keyless entry system'),
(10, 'Remote Start', 'Allows the engine to be started from a distance');

CREATE TABLE Vehicle_Feature (
    vehicle_id INT,
    feature_id INT,
    PRIMARY KEY (vehicle_id, feature_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (feature_id) REFERENCES Feature(feature_id)
);
INSERT INTO Vehicle_Feature VALUES 
(1, 1),
(1, 5),
(2, 2),
(2, 3),
(3, 6),
(4, 7),
(5, 2),
(5, 4),
(6, 8),
(7, 3);

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    name VARCHAR(30),
    contact_information VARCHAR(30)
);
INSERT INTO Seller VALUES 
(1, 'John Doe', '123-456-7890'),
(2, 'Jane Smith', '987-654-3210'),
(3, 'David Brown', '456-789-1230'),
(4, 'Emily Johnson', '789-123-4560'),
(5, 'Michael Wilson', '321-654-9870'),
(6, 'Sarah Davis', '654-987-3210'),
(7, 'Robert Miller', '987-321-6540'),
(8, 'Lisa Taylor', '159-487-2630'),
(9, 'Christopher Martinez', '753-951-8640'),
(10, 'Jennifer Garcia', '369-258-1470');

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(30),
    contact_number VARCHAR(20),
    email VARCHAR(30)
);
INSERT INTO Customer VALUES 
(1, 'Michael Brown', '111-222-3333', 'michael@example.com'),
(2, 'Jennifer Johnson', '444-555-6666', 'jennifer@example.com'),
(3, 'David Wilson', '777-888-9999', 'david@example.com'),
(4, 'Jessica Taylor', '222-333-4444', 'jessica@example.com'),
(5, 'James Martinez', '555-666-7777', 'james@example.com'),
(6, 'Emily Anderson', '888-999-0000', 'emily@example.com'),
(7, 'Daniel Thomas', '333-444-5555', 'daniel@example.com'),
(8, 'Sarah Rodriguez', '666-777-8888', 'sarah@example.com'),
(9, 'Christopher Lee', '999-000-1111', 'christopher@example.com'),
(10, 'Amanda Walker', '444-555-6666', 'amanda@example.com');

CREATE TABLE Sale (
    sale_id INT PRIMARY KEY,
    vehicle_id INT,
    customer_id INT,
    sale_date DATE,
    sale_price DECIMAL(10, 2),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
INSERT INTO Sale VALUES 
(1, 1, 1, '2023-01-20', 24000.00),
(2, 2, 2, '2023-02-25', 27000.00),
(3, 3, 3, '2023-03-15', 31000.00),
(4, 4, 4, '2023-04-10', 20000.00),
(5, 5, 5, '2023-05-18', 36000.00),
(6, 6, 6, '2023-06-20', 29000.00),
(7, 7, 7, '2023-07-30', 33000.00),
(8, 8, 8, '2023-08-05', 22000.00),
(9, 9, 9, '2023-09-20', 24000.00),
(10, 10, 10, '2023-10-28', 21000.00);

CREATE TABLE Service_Record (
    record_id INT PRIMARY KEY,
    vehicle_id INT,
    date DATE,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id)
);
INSERT INTO Service_Record VALUES 
(1, 1, '2023-02-01'),
(2, 2, '2023-03-10'),
(3, 3, '2023-04-05'),
(4, 4, '2023-05-20'),
(5, 5, '2023-06-15'),
(6, 6, '2023-07-25'),
(7, 7, '2023-08-10'),
(8, 8, '2023-09-05'),
(9, 9, '2023-10-15'),
(10, 10, '2023-11-20');

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(30),
    role VARCHAR(30)
);
INSERT INTO Employee VALUES 
(1, 'John Smith', 'Salesperson'),
(2, 'Emily Brown', 'Salesperson'),
(3, 'David Johnson', 'Manager'),
(4, 'Jessica Wilson', 'Manager'),
(5, 'James Taylor', 'Mechanic'),
(6, 'Sarah Martinez', 'Mechanic'),
(7, 'Daniel Lee', 'Receptionist'),
(8, 'Amanda Garcia', 'Receptionist'),
(9, 'Michael Rodriguez', 'Accountant'),
(10, 'Jennifer Lopez', 'Accountant');

CREATE TABLE Test_Drive (
    test_drive_id INT PRIMARY KEY,
    vehicle_id INT,
    customer_id INT,
    employee_id INT,
    test_drive_date DATE,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
INSERT INTO Test_Drive VALUES 
(1, 1, 1, 1, '2023-01-10'),
(2, 2, 2, 2, '2023-02-15'),
(3, 3, 3, 3, '2023-03-05'),
(4, 4, 4, 4, '2023-04-10'),
(5, 5, 5, 5, '2023-05-20'),
(6, 6, 6, 6, '2023-06-25'),
(7, 7, 7, 7, '2023-07-05'),
(8, 8, 8, 8, '2023-08-10'),
(9, 9, 9, 9, '2023-09-15'),
(10, 10, 10, 10, '2023-10-20');

CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY,
    car_id INT,
    customer_id INT,
    salesperson_id INT,
    sale_date DATE,
    sale_price DECIMAL(10, 2),
    payment_method VARCHAR(30),
    financing_option VARCHAR(30),
    FOREIGN KEY (car_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (salesperson_id) REFERENCES Employee(employee_id)
);
INSERT INTO Transaction VALUES 
(1, 1, 1, 1, '2023-01-20', 24000.00, 'Cash', NULL),
(2, 2, 2, 2, '2023-02-25', 27000.00, 'Cash', NULL),
(3, 3, 3, 3, '2023-03-15', 31000.00, 'Credit Card', 'Bank Loan'),
(4, 4, 4, 4, '2023-04-10', 20000.00, 'Cash', NULL),
(5, 5, 5, 5, '2023-05-18', 36000.00, 'Cash', NULL),
(6, 6, 6, 6, '2023-06-20', 29000.00, 'Cash', NULL),
(7, 7, 7, 7, '2023-07-30', 33000.00, 'Cash', NULL),
(8, 8, 8, 8, '2023-08-05', 22000.00, 'Credit Card', 'Bank Loan'),
(9, 9, 9, 9, '2023-09-20', 24000.00, 'Cash', NULL),
(10, 10, 10, 10, '2023-10-28', 21000.00, 'Cash', NULL);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    car_id INT,
    date_added DATE,
    status VARCHAR(30),
    FOREIGN KEY (car_id) REFERENCES Vehicle(vehicle_id)
);
INSERT INTO Inventory VALUES 
(1, 1, '2023-01-15', 'Available'),
(2, 2, '2023-02-20', 'Available'),
(3, 3, '2023-03-10', 'Available'),
(4, 4, '2023-04-05', 'Available'),
(5, 5, '2023-05-12', 'Unavailable'),
(6, 6, '2023-06-18', 'Available'),
(7, 7, '2023-07-25', 'Unavailable'),
(8, 8, '2023-08-03', 'Available'),
(9, 9, '2023-09-14', 'Available'),
(10, 10, '2023-10-22', 'Available');

CREATE TABLE Finance (
    finance_id INT PRIMARY KEY,
    customer_id INT,
    transaction_id INT,
    loan_amount DECIMAL(10, 2),
    interest_rate DECIMAL(5, 2),
    monthly_payment DECIMAL(10, 2),
    loan_term INT,
    down_payment DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (transaction_id) REFERENCES Transaction(transaction_id)
);
INSERT INTO Finance VALUES
(1, 1, 1, 25000.00, 5.25, 450.00, 60, 5000.00),
(2, 2, 2, 30000.00, 4.75, 550.00, 48, 6000.00),
(3, 3, 3, 20000.00, 6.00, 400.00, 36, 4000.00),
(4, 4, 4, 35000.00, 4.50, 600.00, 72, 7000.00),
(5, 5, 5, 28000.00, 5.75, 500.00, 60, 5500.00),
(6, 6, 6, 32000.00, 4.25, 580.00, 48, 6000.00),
(7, 7, 7, 27000.00, 6.50, 520.00, 60, 5000.00),
(8, 8, 8, 24000.00, 5.00, 450.00, 36, 5000.00),
(9, 9, 9, 30000.00, 5.25, 550.00, 60, 6000.00),
(10, 10, 10, 28000.00, 4.75, 520.00, 48, 5500.00);

CREATE TABLE Warranty (
    warranty_id INT PRIMARY KEY,
    car_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (car_id) REFERENCES Vehicle(vehicle_id)
);
INSERT INTO Warranty VALUES 
(1, 1, '2023-01-15', '2025-01-15'),
(2, 2, '2023-02-20', '2025-02-20'),
(3, 3, '2023-03-10', '2025-03-10'),
(4, 4, '2023-04-05', '2025-04-05'),
(5, 5, '2023-05-12', '2025-05-12'),
(6, 6, '2023-06-18', '2025-06-18'),
(7, 7, '2023-07-25', '2025-07-25'),
(8, 8, '2023-08-03', '2025-08-03'),
(9, 9, '2023-09-14', '2025-09-14'),
(10, 10, '2023-10-22', '2025-10-22');

CREATE TABLE Marketing_Campaign (
    campaign_id INT PRIMARY KEY,
    name VARCHAR(30),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10, 2)
);
INSERT INTO Marketing_Campaign VALUES 
(1, 'Summer Sale 2023', '2023-06-01', '2023-08-31', 10000.00),
(2, 'Year-End Clearance', '2023-11-01', '2023-12-31', 15000.00),
(3, 'Spring Specials', '2023-03-01', '2023-05-31', 12000.00),
(4, 'Black Friday Deals', '2023-11-24', '2023-11-26', 20000.00),
(5, 'Holiday Savings', '2023-12-15', '2023-12-31', 18000.00),
(6, 'Back to School Sale', '2023-08-15', '2023-09-15', 8000.00),
(7, 'Winter Wonderland', '2023-12-01', '2024-01-31', 17000.00),
(8, 'New Year Clearance', '2023-12-31', '2024-01-15', 12000.00),
(9, 'Spring Break Deals', '2023-03-15', '2023-03-31', 10000.00),
(10, 'Labor Day Sale', '2023-09-01', '2023-09-04', 9000.00);

CREATE TABLE Financing_Option (
    financing_option_id INT PRIMARY KEY,
    name VARCHAR(30),
    description TEXT,
    terms TEXT
);
INSERT INTO Financing_Option VALUES 
(1, 'Bank Loan', 'Financing option provided by partnered banks', 'Fixed interest rate, flexible repayment terms'),
(2, 'Credit Card', 'Financing option for immediate payment using credit cards', 'Various interest rates based on card issuer'),
(3, 'Lease', 'Long-term lease agreement with monthly payments', 'Fixed monthly payment for a specified term'),
(4, 'In-House Financing', 'Financing option provided directly by the dealership', 'Customizable terms based on customer needs'),
(5, 'Cash', 'Payment made in full at the time of purchase', 'No interest or repayment terms'),
(6, 'Personal Loan', 'Loan option for individuals from financial institutions', 'Flexible repayment terms and interest rates'),
(7, 'Manufacturer Financing', 'Financing provided by the car manufacturer', 'Special promotional rates and incentives'),
(8, 'Home Equity Loan', 'Loan option secured by the borrower''s home equity', 'Lower interest rates and longer repayment terms'),
(9, 'Peer-to-Peer Lending', 'Online platform for borrowing from individual investors', 'Varied interest rates based on borrower''s creditworthiness'),
(10, 'Line of Credit', 'Revolving credit facility with predetermined credit limit', 'Interest charged on outstanding balance only');
