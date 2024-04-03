USE DBMS;

-- Retrieve all vehicles manufactured by Honda
SELECT * FROM Vehicle WHERE make = 'Honda';

-- Retrieve the total number of vehicles sold
SELECT COUNT(*) AS total_vehicles_sold FROM Sale;

-- Retrieve the average sale price of vehicles
SELECT AVG(sale_price) AS average_sale_price FROM Sale;

-- Retrieve vehicles with a mileage greater than the average mileage of all vehicles
SELECT * FROM Vehicle WHERE mileage > (SELECT AVG(mileage) FROM Vehicle);

-- Retrieve the total revenue generated from vehicle sales in 2023
SELECT SUM(sale_price) AS total_revenue FROM Sale WHERE EXTRACT(YEAR FROM sale_date) = 2023;

-- Retrieve the marketing campaigns that were active in November 2023
SELECT * FROM Marketing_Campaign WHERE start_date <= '2023-11-30' AND end_date >= '2023-11-01';

-- Retrieve the customers who purchased vehicles using cash and made a down payment greater than $5000
SELECT c.* FROM Customer c
JOIN Transaction t ON c.customer_id = t.customer_id
JOIN Finance f ON t.transaction_id = f.transaction_id
WHERE t.payment_method = 'Cash' AND f.down_payment > 5000.00;

-- Retrieve the vehicles that have undergone service after being sold
SELECT v.* FROM Vehicle v
JOIN Sale s ON v.vehicle_id = s.vehicle_id
JOIN Service_Record sr ON v.vehicle_id = sr.vehicle_id
WHERE sr.date > s.sale_date;

-- Retrieve the vehicles that are currently unavailable in the inventory
SELECT v.* FROM Vehicle v JOIN Inventory i ON v.vehicle_id = i.car_id WHERE i.status = 'Unavailable';

-- Retrieve the vehicles with their corresponding warranty information
SELECT v.*, w.start_date AS warranty_start_date, w.end_date AS warranty_end_date FROM Vehicle v
LEFT JOIN Warranty w ON v.vehicle_id = w.car_id;

-- Retrieve the vehicles with their corresponding sale information, sorted by sale date in descending order
SELECT v.*, s.sale_date, s.sale_price FROM Vehicle v
LEFT JOIN Sale s ON v.vehicle_id = s.vehicle_id
ORDER BY s.sale_date DESC;

-- Retrieve all vehicles with their features
SELECT v.*, f.name AS feature_name, f.description AS feature_description FROM Vehicle v
LEFT JOIN Vehicle_Feature vf ON v.vehicle_id = vf.vehicle_id
LEFT JOIN Feature f ON vf.feature_id = f.feature_id;

-- Retrieve the customers who test drove vehicles but did not make a purchase
SELECT c.* FROM Customer c
LEFT JOIN Test_Drive td ON c.customer_id = td.customer_id
LEFT JOIN Sale s ON c.customer_id = s.customer_id
WHERE td.test_drive_id IS NOT NULL AND s.sale_id IS NULL;

-- Retrieve the total number of transactions made with bank loans
SELECT COUNT(*) AS total_bank_loans
FROM Transaction t
JOIN Financing_Option fo ON t.financing_option = fo.name
WHERE fo.name = 'Bank Loan';

-- Retrieve the vehicles with their corresponding seller information
SELECT v.*, s.name AS seller_name FROM Vehicle v
JOIN Inventory i ON v.vehicle_id = i.car_id
JOIN Seller s ON i.inventory_id = s.seller_id;

-- Retrieve the total number of test drives conducted by each employee
SELECT e.name AS employee_name, COUNT(td.test_drive_id) AS total_test_drives FROM Employee e
LEFT JOIN Test_Drive td ON e.employee_id = td.employee_id GROUP BY e.name;

-- Retrieve the distinct colors of cars available in the inventory
SELECT DISTINCT color FROM Vehicle WHERE stock_status = 'Available';

-- Retrieve the customers who made purchases using credit cards with an interest rate greater than 5%
SELECT DISTINCT c.* FROM Customer c
JOIN Transaction t ON c.customer_id = t.customer_id
JOIN Finance f ON t.transaction_id = f.transaction_id
WHERE t.payment_method = 'Credit Card' AND f.interest_rate > 5.00;