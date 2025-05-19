CREATE DATABASE Flight_Management;

USE flight_management;


CREATE TABLE airport (
    airport_code INT,
    PRIMARY KEY (airport_code),
    name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE admin (
    admin_id VARCHAR(50),
    PRIMARY KEY (admin_id),
    admin_name VARCHAR(50),
    contact VARCHAR(50),
    address VARCHAR(50),
    email_id VARCHAR(50),
    age INT,
    airport_code INT,
    FOREIGN KEY (airport_code) REFERENCES airport(airport_code)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE airplane (
    airplane_id INT PRIMARY KEY,
    flight_date INT,
    departure VARCHAR(50),
    arrival VARCHAR(50),
    airport_code INT NOT NULL,
    FOREIGN KEY (airport_code) REFERENCES airport(airport_code)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE airplane_type (
    airplane_id INT,
    PRIMARY KEY (airplane_id),
    capacity VARCHAR(50),
    airplane_weight VARCHAR(50),
    company VARCHAR(50),
    FOREIGN KEY (airplane_id) REFERENCES airplane(airplane_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Passenger (
    passenger_id VARCHAR(50),
    PRIMARY KEY (passenger_id),
    passenger_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    contact VARCHAR(20),  
    address VARCHAR(50)
);

CREATE TABLE ticket(
	ticket_id VARCHAR(50),
    PRIMARY KEY (ticket_id),
    passenger_id VARCHAR (50),
    booking_date INT,
    availability_status VARCHAR (10),
    class VARCHAR (50),
    departure_loc VARCHAR (50),
    arrival_loc VARCHAR (50),
    seat_no INT,
    airplane_id INT,
    amount INT,
	FOREIGN KEY (airplane_id) REFERENCES airplane(airplane_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE transaction(
    transaction_id VARCHAR(50),
    PRIMARY KEY (transaction_id),
    ticket_id VARCHAR (50),
    booking_date INT,
    transaction_mode VARCHAR(50),
    status VARCHAR(50),
    amount INT,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);



INSERT INTO airport (airport_code, name, city, state, country) VALUES
(1, 'John F. Kennedy International Airport', 'New York City', 'New York', 'USA'),
(2, 'Los Angeles International Airport', 'Los Angeles', 'California', 'USA'),
(3, 'Heathrow Airport', 'London', NULL, 'UK'),
(4, 'Narita International Airport', 'Tokyo', NULL, 'Japan');

INSERT INTO admin (admin_id, admin_name, contact, address, email_id, age, airport_code) VALUES
('ADM001', 'John Doe', '+1234567890', '123 Main St, New York', 'john.doe@example.com', 35, 1),
('ADM002', 'Jane Smith', '+1987654321', '456 Oak Ave, Los Angeles', 'jane.smith@example.com', 40, 2),
('ADM003', 'Alice Johnson', '+447700900800', '789 Elm St, London', 'alice.johnson@example.com', 45, 3),
('ADM004', 'Bob Tanaka', '+819012345678', '321 Pine St, Tokyo', 'bob.tanaka@example.com', 38, 4);

INSERT INTO airplane (airplane_id, flight_date, departure, arrival, airport_code) VALUES
(101, 20240423, 'New York City', 'Los Angeles', 1),
(102, 20240424, 'Los Angeles', 'New York City', 2),
(103, 20240425, 'London', 'New York City', 3),
(104, 20240426, 'Tokyo', 'London', 4);

INSERT INTO airplane_type (airplane_id, capacity, airplane_weight, company) VALUES
(101, '200', '250000', 'Boeing'),
(102, '180', '220000', 'Airbus'),
(103, '220', '280000', 'Boeing'),
(104, '150', '200000', 'Airbus');

INSERT INTO Passenger (passenger_id, passenger_name, age, gender, contact, address) VALUES
('P001', 'Alice Johnson', 30, 'Female', 1234567890, '123 Main St, New York'),
('P002', 'Bob Tanaka', 45, 'Male', 9876543210, '456 Oak Ave, Los Angeles'),
('P003', 'Charlie Brown', 25, 'Male', 1122334455, '789 Elm St, London'),
('P004', 'Diana Smith', 35, 'Female', 9988776655, '321 Pine St, Tokyo');

INSERT INTO Passenger (passenger_id, passenger_name, age, gender, contact, address) VALUES
('P001', 'Alice Johnson', 30, 'Female', '1234567890', '123 Main St, New York'),
('P002', 'Bob Tanaka', 45, 'Male', '9876543210', '456 Oak Ave, Los Angeles'),
('P003', 'Charlie Brown', 25, 'Male', '1122334455', '789 Elm St, London'),
('P004', 'Diana Smith', 35, 'Female', '9988776655', '321 Pine St, Tokyo');

INSERT INTO ticket (ticket_id, passenger_id, booking_date, availability_status, class, departure_loc, arrival_loc, seat_no, airplane_id, amount) VALUES
('T001', 'P001', 20240420, 'Available', 'Business', 'New York City', 'Los Angeles', 1, 101, 1500),
('T002', 'P002', 20240421, 'Available', 'Economy', 'Los Angeles', 'New York City', 2, 102, 800),
('T003', 'P003', 20240422, 'Available', 'First Class', 'London', 'New York City', 3, 103, 2000),
('T004', 'P004', 20240423, 'Available', 'Economy', 'Tokyo', 'London', 4, 104, 1200);

INSERT INTO transaction (transaction_id, ticket_id, booking_date, transaction_mode, status, amount) VALUES
('TR001', 'T001', 20240420, 'Credit Card', 'Success', 1500),
('TR002', 'T002', 20240421, 'Debit Card', 'Success', 800),
('TR003', 'T003', 20240422, 'PayPal', 'Success', 2000),
('TR004', 'T004', 20240423, 'Cash', 'Success', 1200);

INSERT INTO airport (airport_code, name, city, state, country) VALUES
(5, 'Paris Charles de Gaulle Airport', 'Paris', NULL, 'France'),
(6, 'Sydney Kingsford Smith Airport', 'Sydney', 'New South Wales', 'Australia'),
(7, 'Dubai International Airport', 'Dubai', NULL, 'UAE');

INSERT INTO admin (admin_id, admin_name, contact, address, email_id, age, airport_code) VALUES
('ADM005', 'Emma Watson', '+1234567890', '123 Broadway, Paris', 'emma.watson@example.com', 33, 5),
('ADM006', 'Michael Brown', '+1987654321', '456 Hollywood Blvd, Sydney', 'michael.brown@example.com', 42, 6),
('ADM007', 'Sophia Lee', '+447700900800', '789 Park Ave, Dubai', 'sophia.lee@example.com', 39, 7);

INSERT INTO airplane (airplane_id, flight_date, departure, arrival, airport_code) VALUES
(105, 20240427, 'Paris', 'New York City', 5),
(106, 20240428, 'Sydney', 'Los Angeles', 6),
(107, 20240429, 'Dubai', 'London', 7);

INSERT INTO airplane_type (airplane_id, capacity, airplane_weight, company) VALUES
(105, '230', '270000', 'Airbus'),
(106, '210', '260000', 'Boeing'),
(107, '250', '300000', 'Airbus');

INSERT INTO Passenger (passenger_id, passenger_name, age, gender, contact, address) VALUES
('P005', 'Grace Kelly', 28, 'Female', 1122334455, '123 Avenue des Champs-Élysées, Paris'),
('P006', 'James Smith', 40, 'Male', 9988776655, '456 Bondi Beach, Sydney'),
('P007', 'Fatima Ahmed', 35, 'Female', 1122334455, '789 Sheikh Zayed Rd, Dubai');

INSERT INTO ticket (ticket_id, passenger_id, booking_date, availability_status, class, departure_loc, arrival_loc, seat_no, airplane_id, amount) VALUES
('T005', 'P005', 20240424, 'Available', 'Economy', 'Paris', 'New York City', 5, 105, 1100),
('T006', 'P006', 20240425, 'Available', 'Business', 'Sydney', 'Los Angeles', 6, 106, 1800),
('T007', 'P007', 20240426, 'Available', 'Economy', 'Dubai', 'London', 7, 107, 1300);

INSERT INTO transaction (transaction_id, ticket_id, booking_date, transaction_mode, status, amount) VALUES
('TR005', 'T005', 20240424, 'Credit Card', 'Success', 1100),
('TR006', 'T006', 20240425, 'Debit Card', 'Success', 1800),
('TR007', 'T007', 20240426, 'PayPal', 'Success', 1300);




SELECT * FROM airplane_type;
SELECT * FROM admin;
SELECT * FROM airplane;
SELECT * FROM airport;
SELECT * FROM passenger;
SELECT * FROM ticket;
SELECT * FROM transaction;




SELECT a.airplane_id, a.flight_date, a.departure, a.arrival,
       ar.name AS airport_name, ar.city AS airport_city, ar.country AS airport_country
FROM airplane a
INNER JOIN airport ar ON a.airport_code = ar.airport_code;

SELECT ar.*, a.airplane_id, a.flight_date, a.departure, a.arrival
FROM airport ar
LEFT JOIN airplane a ON ar.airport_code = a.airport_code;

SELECT p.*, t.ticket_id, t.booking_date, t.availability_status, t.class, t.departure_loc, t.arrival_loc, t.seat_no, t.amount
FROM Passenger p
LEFT JOIN ticket t ON p.passenger_id = t.passenger_id;

SELECT p.*, t.*, tr.*
FROM Passenger p
INNER JOIN ticket t ON p.passenger_id = t.passenger_id
LEFT JOIN transaction tr ON t.ticket_id = tr.ticket_id;

SELECT a.*, at.capacity, at.airplane_weight, at.company
FROM airplane_type at
RIGHT JOIN airplane a ON at.airplane_id = a.airplane_id;

SELECT * FROM airport a
LEFT JOIN admin ad ON a.airport_code = ad.airport_code
UNION ALL
SELECT * FROM airport a
RIGHT JOIN admin ad ON a.airport_code = ad.airport_code
WHERE a.airport_code IS NULL;




DROP VIEW IF EXISTS Flight_Details;

CREATE VIEW Flight_Details AS
SELECT a.airplane_id, a.flight_date, a.departure, a.arrival, a.airport_code,
       at.capacity AS airplane_capacity, at.airplane_weight, at.company
FROM airplane a
INNER JOIN airplane_type at ON a.airplane_id = at.airplane_id;

select * from flight_details;


DROP VIEW IF EXISTS Transaction_Summary;

CREATE VIEW Transaction_Summary AS
SELECT t.transaction_id, t.ticket_id, t.booking_date, t.transaction_mode, t.status, t.amount,
       tk.passenger_id, tk.class, tk.departure_loc, tk.arrival_loc, tk.seat_no
FROM transaction t
INNER JOIN ticket tk ON t.ticket_id = tk.ticket_id;

SELECT * FROM Transaction_Summary;



DELIMITER //

CREATE TRIGGER update_availability AFTER INSERT ON transaction
FOR EACH ROW
BEGIN
    UPDATE ticket
    SET availability_status = 'Booked'
    WHERE ticket_id = NEW.ticket_id;
END;
//

DELIMITER ;

DROP TRIGGER IF EXISTS update_availability;


DELIMITER //

CREATE TRIGGER insert_transaction AFTER INSERT ON ticket
FOR EACH ROW
BEGIN
    INSERT INTO transaction (ticket_id, booking_date, transaction_mode, status, amount)
    VALUES (NEW.ticket_id, NEW.booking_date, 'Automatic', 'Pending', NEW.amount);
END;
//

DELIMITER ;

DROP TRIGGER IF EXISTS insert_transaction;





DELIMITER $$

CREATE PROCEDURE GetPassengerDetails()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE p_id VARCHAR(50);
    DECLARE p_name VARCHAR(50);
    DECLARE p_age INT;
    DECLARE p_gender VARCHAR(10);
    DECLARE p_contact VARCHAR(20);
    DECLARE p_address VARCHAR(50);
    
    -- Declare cursor
    DECLARE cur CURSOR FOR SELECT * FROM Passenger;
    
    -- Declare handler for cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Open cursor
    OPEN cur;
    
    -- Start reading cursor
    read_loop: LOOP
        -- Fetch data from cursor into variables
        FETCH cur INTO p_id, p_name, p_age, p_gender, p_contact, p_address;
        
        -- Check if cursor reached end
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Print details of fetched data
        SELECT CONCAT('Passenger ID: ', p_id, ', Name: ', p_name, ', Age: ', p_age, ', Gender: ', p_gender, ', Contact: ', p_contact, ', Address: ', p_address) AS Passenger_Details;
    END LOOP;
    
    -- Close cursor
    CLOSE cur;
END$$

DELIMITER ;

CALL GetPassengerDetails();




-- NF1 is already applied
-- applying NF2
-- Create a new table for flight information
CREATE TABLE flight (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    ticket_id VARCHAR(50),
    departure_loc VARCHAR(50),
    arrival_loc VARCHAR(50),
    airplane_id INT,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (airplane_id) REFERENCES airplane(airplane_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Adjust the ticket table
ALTER TABLE ticket
DROP COLUMN class,
DROP COLUMN departure_loc,
DROP COLUMN arrival_loc;

SELECT * FROM flight;


-- removing NF2
-- Drop the flight table
DROP TABLE flight;

-- Add back the columns to the ticket table
ALTER TABLE ticket
ADD COLUMN class VARCHAR(50),
ADD COLUMN departure_loc VARCHAR(50),
ADD COLUMN arrival_loc VARCHAR(50);
