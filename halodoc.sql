-- Table: admin
CREATE TABLE admin (
    admin_id VARCHAR(255) PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    permissions VARCHAR(255)
);

-- Table: insurance
CREATE TABLE insurance (
    insurance_id VARCHAR(255) PRIMARY KEY,
    provider_name VARCHAR(255),
    policy_details TEXT
);

-- Table: account
CREATE TABLE account (
    account_id VARCHAR(255) PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    insurance_id VARCHAR(255),
    balance FLOAT,
    FOREIGN KEY (insurance_id) REFERENCES insurance(insurance_id)
);

-- Table: personal_info
CREATE TABLE personal_info (
    personal_info_id VARCHAR(255) PRIMARY KEY,
    account_id VARCHAR(255),
    name VARCHAR(255),
    gender VARCHAR(50),
    birth_date DATE,
    weight FLOAT,
    height FLOAT,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

-- Table: phone_number
CREATE TABLE phone_number (
    phone_id VARCHAR(255) PRIMARY KEY,
    account_id VARCHAR(255),
    phone_number VARCHAR(255) UNIQUE,
    type VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

-- Table: family_info
CREATE TABLE family_info (
    family_id VARCHAR(255) PRIMARY KEY,
    account_id VARCHAR(255),
    name VARCHAR(255),
    birth_date DATE,
    relation VARCHAR(255),
    weight FLOAT,
    height FLOAT,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

-- Table: service
CREATE TABLE service (
    service_id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price FLOAT,
    is_online BOOLEAN
);

-- Table: professional
CREATE TABLE professional (
    professional_id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    specialization VARCHAR(255),
    contact_info VARCHAR(255)
);

-- Table: health_topic
CREATE TABLE health_topic (
    topic_id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

-- Table: article
CREATE TABLE article (
    article_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    publish_date DATE
);

-- Table: test
CREATE TABLE test (
    test_id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    instructions TEXT
);

-- Table: appointment
CREATE TABLE appointment (
    appointment_id VARCHAR(255) PRIMARY KEY,
    account_id VARCHAR(255),
    professional_id VARCHAR(255),
    service_id VARCHAR(255),
    date DATE,
    time TIME,
    is_online BOOLEAN,
    status VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (professional_id) REFERENCES professional(professional_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id)
);

-- Table: transaction
CREATE TABLE transaction (
    transaction_id VARCHAR(255) PRIMARY KEY,
    account_id VARCHAR(255),
    service_id VARCHAR(255),
    amount FLOAT,
    transaction_date DATE,
    status VARCHAR(50),
    transaction_type VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id)
);

-- Table: user_service_history
CREATE TABLE user_service_history (
    history_id VARCHAR(255) PRIMARY KEY,
    account_id VARCHAR(255),
    service_id VARCHAR(255),
    professional_id VARCHAR(255),
    usage_date DATE,
    appointment_id VARCHAR(255),
    usage_notes TEXT,
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id),
    FOREIGN KEY (professional_id) REFERENCES professional(professional_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
);

-- Table: service_professional
CREATE TABLE service_professional (
    service_id VARCHAR(255),
    professional_id VARCHAR(255),
    PRIMARY KEY (service_id, professional_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id),
    FOREIGN KEY (professional_id) REFERENCES professional(professional_id)
);

-- Table: article_topic
CREATE TABLE article_topic (
    article_id VARCHAR(255),
    topic_id VARCHAR(255),
    PRIMARY KEY (article_id, topic_id),
    FOREIGN KEY (article_id) REFERENCES article(article_id),
    FOREIGN KEY (topic_id) REFERENCES health_topic(topic_id)
);

-- Table: user_test
CREATE TABLE user_test (
    account_id VARCHAR(255),
    test_id VARCHAR(255),
    test_date DATE,
    PRIMARY KEY (account_id, test_id),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (test_id) REFERENCES test(test_id)
);

--@block
-- Insert data into admin
INSERT INTO admin (admin_id, username, password, permissions) VALUES
('A1', 'admin1', 'pass123', 'full_access'),
('A2', 'admin2', 'pass123', 'limited_access'),
('A3', 'admin3', 'pass123', 'view_only'),
('A4', 'admin4', 'pass123', 'editor'),
('A5', 'admin5', 'pass123', 'full_access'),
('A6', 'admin6', 'pass123', 'limited_access'),
('A7', 'admin7', 'pass123', 'view_only'),
('A8', 'admin8', 'pass123', 'editor'),
('A9', 'admin9', 'pass123', 'full_access'),
('A10', 'admin10', 'pass123', 'limited_access');

-- Insert data into insurance
INSERT INTO insurance (insurance_id, provider_name, policy_details) VALUES
('I1', 'Provider A', 'Basic health coverage'),
('I2', 'Provider B', 'Premium health coverage'),
('I3', 'Provider C', 'Standard health coverage'),
('I4', 'Provider D', 'Family health coverage'),
('I5', 'Provider E', 'Comprehensive coverage'),
('I6', 'Provider F', 'Basic health coverage with dental'),
('I7', 'Provider G', 'Premium health and vision'),
('I8', 'Provider H', 'Health and accident coverage'),
('I9', 'Provider I', 'Standard plus maternity'),
('I10', 'Provider J', 'Emergency only coverage');

-- Insert data into account
INSERT INTO account (account_id, email, password, insurance_id, balance) VALUES
('ACC1', 'user1@example.com', 'pass123', 'I1', 100.50),
('ACC2', 'user2@example.com', 'pass123', 'I2', 250.75),
('ACC3', 'user3@example.com', 'pass123', 'I3', 300.00),
('ACC4', 'user4@example.com', 'pass123', 'I4', 125.25),
('ACC5', 'user5@example.com', 'pass123', 'I5', 450.80),
('ACC6', 'user6@example.com', 'pass123', 'I6', 120.40),
('ACC7', 'user7@example.com', 'pass123', 'I7', 215.50),
('ACC8', 'user8@example.com', 'pass123', 'I8', 180.90),
('ACC9', 'user9@example.com', 'pass123', 'I9', 190.20),
('ACC10', 'user10@example.com', 'pass123', 'I10', 170.60);

-- Insert data into personal_info
INSERT INTO personal_info (personal_info_id, account_id, name, gender, birth_date, weight, height) VALUES
('PI1', 'ACC1', 'John Doe', 'Male', '1990-01-01', 70.5, 175.3),
('PI2', 'ACC2', 'Jane Smith', 'Female', '1985-05-15', 65.2, 168.0),
('PI3', 'ACC3', 'Alice Johnson', 'Female', '1992-03-12', 54.0, 160.2),
('PI4', 'ACC4', 'Bob Lee', 'Male', '1988-07-19', 80.0, 180.4),
('PI5', 'ACC5', 'Carol King', 'Female', '1975-12-23', 72.1, 170.5),
('PI6', 'ACC6', 'Dan Brown', 'Male', '1989-11-11', 78.3, 178.6),
('PI7', 'ACC7', 'Emily White', 'Female', '1995-06-25', 58.7, 162.4),
('PI8', 'ACC8', 'Frank Green', 'Male', '1980-08-08', 85.9, 183.2),
('PI9', 'ACC9', 'Grace Young', 'Female', '1993-10-30', 62.5, 165.7),
('PI10', 'ACC10', 'Henry Hill', 'Male', '1982-02-05', 90.0, 190.0);

-- Insert data into phone_number
INSERT INTO phone_number (phone_id, account_id, phone_number, type) VALUES
('PH1', 'ACC1', '123-456-7890', 'Mobile'),
('PH2', 'ACC2', '234-567-8901', 'Home'),
('PH3', 'ACC3', '345-678-9012', 'Work'),
('PH4', 'ACC4', '456-789-0123', 'Mobile'),
('PH5', 'ACC5', '567-890-1234', 'Home'),
('PH6', 'ACC6', '678-901-2345', 'Work'),
('PH7', 'ACC7', '789-012-3456', 'Mobile'),
('PH8', 'ACC8', '890-123-4567', 'Home'),
('PH9', 'ACC9', '901-234-5678', 'Work'),
('PH10', 'ACC10', '012-345-6789', 'Mobile');

-- Insert data into family_info
INSERT INTO family_info (family_id, account_id, name, birth_date, relation, weight, height) VALUES
('FAM1', 'ACC1', 'Anna Doe', '2010-03-15', 'Daughter', 30.0, 120.0),
('FAM2', 'ACC2', 'Ben Smith', '2008-09-20', 'Son', 40.0, 130.0),
('FAM3', 'ACC3', 'Clara Johnson', '2012-07-11', 'Daughter', 35.0, 125.0),
('FAM4', 'ACC4', 'Dave Lee', '2015-02-25', 'Son', 25.0, 115.0),
('FAM5', 'ACC5', 'Eva King', '2009-11-30', 'Daughter', 42.0, 135.0),
('FAM6', 'ACC6', 'Fiona Brown', '2013-05-08', 'Daughter', 37.5, 128.0),
('FAM7', 'ACC7', 'George White', '2011-04-14', 'Son', 39.0, 132.0),
('FAM8', 'ACC8', 'Holly Green', '2014-01-19', 'Daughter', 28.5, 118.0),
('FAM9', 'ACC9', 'Ian Young', '2007-10-22', 'Son', 45.0, 140.0),
('FAM10', 'ACC10', 'Jane Hill', '2016-06-10', 'Daughter', 27.0, 116.0);

-- Insert data into service
INSERT INTO service (service_id, name, description, price, is_online) VALUES
('S1', 'Consultation', 'General health consultation', 50.0, TRUE),
('S2', 'Therapy', 'Physical therapy session', 70.0, FALSE),
('S3', 'Vaccination', 'Routine vaccination', 25.0, FALSE),
('S4', 'Checkup', 'Annual health checkup', 100.0, FALSE),
('S5', 'Telemedicine', 'Remote consultation', 40.0, TRUE),
('S6', 'Dental Cleaning', 'Professional dental cleaning', 60.0, FALSE),
('S7', 'Eye Exam', 'Comprehensive eye exam', 45.0, FALSE),
('S8', 'Nutrition Counseling', 'Dietary advice and planning', 55.0, TRUE),
('S9', 'Mental Health', 'Mental health consultation', 80.0, TRUE),
('S10', 'Blood Test', 'Complete blood panel', 30.0, FALSE);

-- Insert data into professional
INSERT INTO professional (professional_id, name, specialization, contact_info) VALUES
('P1', 'Dr. Alice Walker', 'General Practitioner', 'alice@example.com'),
('P2', 'Dr. Bob Taylor', 'Physiotherapist', 'bob@example.com'),
('P3', 'Dr. Carol Lee', 'Pediatrician', 'carol@example.com'),
('P4', 'Dr. Dan Stone', 'Dentist', 'dan@example.com'),
('P5', 'Dr. Eve Clark', 'Optometrist', 'eve@example.com'),
('P6', 'Dr. Frank White', 'Nutritionist', 'frank@example.com'),
('P7', 'Dr. Grace Kim', 'Psychologist', 'grace@example.com'),
('P8', 'Dr. Henry Long', 'Surgeon', 'henry@example.com'),
('P9', 'Dr. Isla Reed', 'Dermatologist', 'isla@example.com'),
('P10', 'Dr. Jack Black', 'Cardiologist', 'jack@example.com');

-- Insert data into appointment
INSERT INTO appointment (appointment_id, account_id, professional_id, service_id, date, time, is_online, status) VALUES
('AP1', 'ACC1', 'P1', 'S1', '2023-01-15', '10:00:00', TRUE, 'Completed'),
('AP2', 'ACC2', 'P2', 'S2', '2023-01-20', '09:00:00', FALSE, 'Scheduled'),
('AP3', 'ACC3', 'P3', 'S3', '2023-01-25', '11:30:00', FALSE, 'Cancelled'),
('AP4', 'ACC4', 'P4', 'S4', '2023-02-10', '08:00:00', FALSE, 'Completed'),
('AP5', 'ACC5', 'P5', 'S5', '2023-02-15', '13:00:00', TRUE, 'Pending'),
('AP6', 'ACC6', 'P6', 'S6', '2023-02-20', '14:30:00', FALSE, 'Completed'),
('AP7', 'ACC7', 'P7', 'S7', '2023-02-25', '15:00:00', FALSE, 'Scheduled'),
('AP8', 'ACC8', 'P8', 'S8', '2023-03-05', '12:00:00', TRUE, 'Pending'),
('AP9', 'ACC9', 'P9', 'S9', '2023-03-10', '16:00:00', TRUE, 'Completed'),
('AP10', 'ACC10', 'P10', 'S10', '2023-03-15', '10:30:00', FALSE, 'Cancelled');

-- Insert data into article without content
INSERT INTO article (article_id, title, author, publish_date) VALUES
('AR1', 'Healthy Living Tips', 'Dr. Alice Walker', '2023-01-10'),
('AR2', 'Benefits of Exercise', 'Dr. Bob Taylor', '2023-02-05'),
('AR3', 'Mental Health Awareness', 'Dr. Grace Kim', '2023-03-12'),
('AR4', 'Eye Health', 'Dr. Eve Clark', '2023-04-02'),
('AR5', 'Nutrition Basics', 'Dr. Frank White', '2023-05-15'),
('AR6', 'Dental Care Tips', 'Dr. Dan Stone', '2023-06-07'),
('AR7', 'Skin Care', 'Dr. Isla Reed', '2023-07-18'),
('AR8', 'Heart Health', 'Dr. Jack Black', '2023-08-29'),
('AR9', 'Vaccination Facts', 'Dr. Carol Lee', '2023-09-14'),
('AR10', 'Healthy Aging', 'Dr. Henry Long', '2023-10-05');

-- Insert data into health_topic
INSERT INTO health_topic (topic_id, name, description) VALUES
('HT1', 'Exercise', 'The benefits and types of exercise'),
('HT2', 'Nutrition', 'Healthy eating and nutrients'),
('HT3', 'Mental Health', 'Awareness and support for mental health'),
('HT4', 'Eye Care', 'Protecting and maintaining eye health'),
('HT5', 'Dental Care', 'Tips for dental hygiene and care'),
('HT6', 'Heart Health', 'Cardiovascular health maintenance'),
('HT7', 'Vaccination', 'Importance of vaccines for health'),
('HT8', 'Skin Care', 'Maintaining healthy skin'),
('HT9', 'Aging', 'Healthy practices for aging gracefully'),
('HT10', 'General Health', 'Overall health maintenance tips');

-- Insert data into article_topic
INSERT INTO article_topic (article_id, topic_id) VALUES
('AR1', 'HT1'),
('AR2', 'HT1'),
('AR3', 'HT3'),
('AR4', 'HT4'),
('AR5', 'HT2'),
('AR6', 'HT5'),
('AR7', 'HT8'),
('AR8', 'HT6'),
('AR9', 'HT7'),
('AR10', 'HT9');

-- Insert data into test
INSERT INTO test (test_id, name, description, instructions) VALUES
('T1', 'Blood Test', 'A comprehensive blood panel test', 'Please fast for 12 hours prior to test'),
('T2', 'Eye Exam', 'Standard vision and eye health test', 'No special instructions'),
('T3', 'Dental Check', 'Routine dental check and cleaning', 'Brush and floss prior to appointment'),
('T4', 'Heart Health Screening', 'Includes EKG and blood pressure check', 'Avoid caffeine 24 hours prior'),
('T5', 'Mental Health Assessment', 'Standardized assessment for mental well-being', 'Fill out questionnaire in advance'),
('T6', 'Vaccination', 'Routine immunizations', 'Bring immunization card'),
('T7', 'Physical Fitness Test', 'Measures physical fitness levels', 'Wear comfortable clothing'),
('T8', 'Skin Screening', 'Comprehensive skin health exam', 'Avoid makeup for 24 hours prior'),
('T9', 'Nutrition Assessment', 'Evaluation of dietary habits and needs', 'Bring food diary'),
('T10', 'Aging Health Screening', 'Checkup focused on aging health metrics', 'No special instructions');

-- Insert data into user_test
INSERT INTO user_test (account_id, test_id, test_date) VALUES
('ACC1', 'T1', '2023-01-20'),
('ACC2', 'T2', '2023-02-15'),
('ACC3', 'T3', '2023-03-10'),
('ACC4', 'T4', '2023-04-05'),
('ACC5', 'T5', '2023-05-01'),
('ACC6', 'T6', '2023-06-07'),
('ACC7', 'T7', '2023-07-20'),
('ACC8', 'T8', '2023-08-15'),
('ACC9', 'T9', '2023-09-10'),
('ACC10', 'T10', '2023-10-05');

-- Insert data into transaction
INSERT INTO transaction (transaction_id, account_id, service_id, amount, transaction_date, status, transaction_type) VALUES
('TX1', 'ACC1', 'S1', 50.0, '2023-01-10', 'Completed', 'Credit'),
('TX2', 'ACC2', 'S2', 70.0, '2023-01-20', 'Completed', 'Debit'),
('TX3', 'ACC3', 'S3', 25.0, '2023-01-30', 'Completed', 'Credit'),
('TX4', 'ACC4', 'S4', 100.0, '2023-02-15', 'Pending', 'Debit'),
('TX5', 'ACC5', 'S5', 40.0, '2023-02-25', 'Completed', 'Credit'),
('TX6', 'ACC6', 'S6', 60.0, '2023-03-05', 'Completed', 'Debit'),
('TX7', 'ACC7', 'S7', 45.0, '2023-03-15', 'Failed', 'Debit'),
('TX8', 'ACC8', 'S8', 55.0, '2023-03-25', 'Completed', 'Credit'),
('TX9', 'ACC9', 'S9', 80.0, '2023-04-10', 'Pending', 'Credit'),
('TX10', 'ACC10', 'S10', 30.0, '2023-04-20', 'Completed', 'Debit');

-- Insert data into user_service_history
INSERT INTO user_service_history (history_id, account_id, service_id, professional_id, usage_date, appointment_id, usage_notes) VALUES
('UH1', 'ACC1', 'S1', 'P1', '2023-01-15', 'AP1', 'General consultation'),
('UH2', 'ACC2', 'S2', 'P2', '2023-01-20', 'AP2', 'Physical therapy session'),
('UH3', 'ACC3', 'S3', 'P3', '2023-01-25', 'AP3', 'Vaccination'),
('UH4', 'ACC4', 'S4', 'P4', '2023-02-10', 'AP4', 'Annual checkup'),
('UH5', 'ACC5', 'S5', 'P5', '2023-02-15', 'AP5', 'Remote consultation'),
('UH6', 'ACC6', 'S6', 'P6', '2023-02-20', 'AP6', 'Dental cleaning'),
('UH7', 'ACC7', 'S7', 'P7', '2023-02-25', 'AP7', 'Eye exam'),
('UH8', 'ACC8', 'S8', 'P8', '2023-03-05', 'AP8', 'Nutrition counseling'),
('UH9', 'ACC9', 'S9', 'P9', '2023-03-10', 'AP9', 'Mental health consultation'),
('UH10', 'ACC10', 'S10', 'P10', '2023-03-15', 'AP10', 'Blood test');

-- Insert data into service_professional
INSERT INTO service_professional (service_id, professional_id) VALUES
('S1', 'P1'),
('S2', 'P2'),
('S3', 'P3'),
('S4', 'P4'),
('S5', 'P5'),
('S6', 'P6'),
('S7', 'P7'),
('S8', 'P8'),
('S9', 'P9'),
('S10', 'P10');

--@block
-- Select all from admin table
SELECT * FROM admin;

--@block
-- Select all from insurance table
SELECT * FROM insurance;

--@block
-- Select all from account table
SELECT * FROM account;

--@block
-- Select all from personal_info table
SELECT * FROM personal_info;

--@block
-- Select all from phone_number table
SELECT * FROM phone_number;

--@block
-- Select all from family_info table
SELECT * FROM family_info;

--@block
-- Select all from service table
SELECT * FROM service;

--@block
-- Select all from professional table
SELECT * FROM professional;

--@block
-- Select all from health_topic table
SELECT * FROM health_topic;

--@block
-- Select all from article table
SELECT * FROM article;

--@block
-- Select all from test table
SELECT * FROM test;

--@block
-- Select all from appointment table
SELECT * FROM appointment;

--@block
-- Select all from transaction table
SELECT * FROM transaction;

--@block
-- Select all from user_service_history table
SELECT * FROM user_service_history;

--@block
-- Select all from service_professional table
SELECT * FROM service_professional;

--@block
-- Select all from article_topic table
SELECT * FROM article_topic;

--@block
-- Select all from user_test table
SELECT * FROM user_test;

-- @block SELECT Queries (Subquery, Join, Grouping)
-- Subquery: List account names with balances above the average
SELECT name
FROM personal_info
WHERE account_id IN (
    SELECT account_id
    FROM account
    WHERE balance > (SELECT AVG(balance) FROM account)
);

-- Join: List all appointments with service and professional details
SELECT a.date, a.time, s.name AS service_name, p.name AS professional_name
FROM appointment a
JOIN service s ON a.service_id = s.service_id
JOIN professional p ON a.professional_id = p.professional_id;

-- Grouping: Count the number of appointments for each service
SELECT s.name AS service_name, COUNT(a.appointment_id) AS appointment_count
FROM service s
LEFT JOIN appointment a ON s.service_id = a.service_id
GROUP BY s.name;

-- @block View, Stored Procedure, Function, Trigger, and Cursor

-- View: Display active appointments
CREATE VIEW active_appointments AS
SELECT appointment_id, account_id, professional_id, service_id, date, time
FROM appointment
WHERE status = 'active';

-- Stored Procedure: Update account balance after a transaction
CREATE PROCEDURE UpdateBalance(acc_id VARCHAR(255), amount FLOAT)
BEGIN
    UPDATE account
    SET balance = balance - amount
    WHERE account_id = acc_id;
END;

-- Stored Function: Calculate BMI of a user
CREATE FUNCTION CalculateBMI(weight FLOAT, height FLOAT)
RETURNS FLOAT
BEGIN
    RETURN weight / (height * height);
END;

-- Trigger: Log balance changes after account updates
CREATE TRIGGER log_balance_change
AFTER UPDATE ON account
FOR EACH ROW
BEGIN
    INSERT INTO balance_log (account_id, old_balance, new_balance)
    VALUES (NEW.account_id, OLD.balance, NEW.balance);
END;

-- Cursor: Report of user appointments
CREATE PROCEDURE UserAppointmentsReport()
BEGIN
    DECLARE acc_id VARCHAR(255);
    DECLARE app_count INT;
    DECLARE done INT DEFAULT 0;
    DECLARE cursor1 CURSOR FOR 
        SELECT account_id, COUNT(appointment_id) 
        FROM appointment 
        GROUP BY account_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cursor1;

    read_loop: LOOP
        FETCH cursor1 INTO acc_id, app_count;
        IF done THEN 
            LEAVE read_loop;
        END IF;

        -- Output report as a result set
        SELECT CONCAT('User ', acc_id, ' has ', app_count, ' appointments.') AS report;
    END LOOP;

    CLOSE cursor1;
END;

-- @block CTE, SQL Window Function, Time Series

-- CTE: List accounts with total spending
WITH TotalSpending AS (
    SELECT account_id, SUM(amount) AS total_spent
    FROM transaction
    GROUP BY account_id
)
SELECT t.account_id, p.name, t.total_spent
FROM TotalSpending t
JOIN personal_info p ON t.account_id = p.account_id;

-- SQL Window Function: Rank professionals based on number of appointments
SELECT p.professional_id, p.name, COUNT(a.appointment_id) AS appointment_count,
       RANK() OVER (ORDER BY COUNT(a.appointment_id) DESC) AS rank
FROM professional p
JOIN appointment a ON p.professional_id = a.professional_id
GROUP BY p.professional_id, p.name;

-- Time Series: Generate monthly appointment trends
SELECT DATE_FORMAT(date, '%Y-%m') AS month, COUNT(appointment_id) AS appointment_count
FROM appointment
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;


-- @block Visualization Queries

-- Example 1: Service Popularity by Appointment Count
SELECT s.name AS service_name, COUNT(a.appointment_id) AS appointment_count
FROM service s
LEFT JOIN appointment a ON s.service_id = a.service_id
GROUP BY s.name
ORDER BY appointment_count DESC;

-- Example 2: Monthly Revenue from Transactions
SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS month, SUM(amount) AS total_revenue
FROM transaction
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY month;

-- Example 3: Online vs. Offline Appointments
SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       SUM(CASE WHEN is_online THEN 1 ELSE 0 END) AS online_count,
       SUM(CASE WHEN NOT is_online THEN 1 ELSE 0 END) AS offline_count
FROM appointment
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;

-- Example 4: User BMI vs. Appointments
SELECT pi.name, CalculateBMI(pi.weight, pi.height) AS bmi, COUNT(a.appointment_id) AS appointment_count
FROM personal_info pi
LEFT JOIN appointment a ON pi.account_id = a.account_id
GROUP BY pi.account_id;
