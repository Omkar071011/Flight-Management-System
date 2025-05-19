# ✈️ Flight Management System (DBMS Project)

This project is a **Database Management System (DBMS)** designed to manage flights, passengers, ticket bookings, transactions, and associated entities in a flight management environment.

---

## 🗂️ Database Schema

The database consists of the following core tables:

### **1. `airport`**
| Column         | Type          | Description         |
|----------------|---------------|---------------------|
| `airport_code` | `INT`         | Primary Key         |
| `name`         | `VARCHAR(50)` | Airport name        |
| `city`         | `VARCHAR(50)` | City                |
| `state`        | `VARCHAR(50)` | State               |
| `country`      | `VARCHAR(50)` | Country             |

### **2. `admin`**
| Column         | Type          | Description                          |
|----------------|---------------|--------------------------------------|
| `admin_id`     | `VARCHAR(50)` | Primary Key                          |
| `admin_name`   | `VARCHAR(50)` | Name                                 |
| `contact`      | `VARCHAR(50)` | Contact number                       |
| `address`      | `VARCHAR(50)` | Address                              |
| `email_id`     | `VARCHAR(50)` | Email                                |
| `age`          | `INT`         | Age                                  |
| `airport_code` | `INT`         | Foreign Key → `airport(airport_code)`|

### **3. `airplane`**
| Column         | Type          | Description                          |
|----------------|---------------|--------------------------------------|
| `airplane_id`  | `INT`         | Primary Key                          |
| `flight_date`  | `INT`         | Date of flight                       |
| `departure`    | `VARCHAR(50)` | Departure location                   |
| `arrival`      | `VARCHAR(50)` | Arrival location                     |
| `airport_code` | `INT`         | Foreign Key → `airport(airport_code)`|

### **4. `airplane_type`**
| Column           | Type          | Description                                      |
|------------------|---------------|--------------------------------------------------|
| `airplane_id`    | `INT`         | Primary & Foreign Key → `airplane(airplane_id)` |
| `capacity`       | `VARCHAR(50)` | Passenger capacity                              |
| `airplane_weight`| `VARCHAR(50)` | Weight                                          |
| `company`        | `VARCHAR(50)` | Operating company                               |

### **5. `passenger`**
| Column           | Type          | Description        |
|------------------|---------------|--------------------|
| `passenger_id`   | `VARCHAR(50)` | Primary Key        |
| `passenger_name` | `VARCHAR(50)` | Name               |
| `age`            | `INT`         | Age                |
| `gender`         | `VARCHAR(10)` | Gender             |
| `contact`        | `VARCHAR(20)` | Contact number     |
| `address`        | `VARCHAR(50)` | Address            |

### **6. `ticket`**
| Column             | Type          | Description                                 |
|--------------------|---------------|---------------------------------------------|
| `ticket_id`        | `VARCHAR(50)` | Primary Key                                 |
| `passenger_id`     | `VARCHAR(50)` | Foreign Key → `passenger(passenger_id)`     |
| `booking_date`     | `INT`         | Date of booking                             |
| `availability_status` | `VARCHAR(10)` | Status ('Booked', 'Available')           |
| `class`            | `VARCHAR(50)` | Travel class                                |
| `departure_loc`    | `VARCHAR(50)` | Departure location                          |
| `arrival_loc`      | `VARCHAR(50)` | Arrival location                            |
| `seat_no`          | `INT`         | Seat number                                 |
| `airplane_id`      | `INT`         | Foreign Key → `airplane(airplane_id)`       |
| `amount`           | `INT`         | Fare amount                                 |

### **7. `transaction`**
| Column            | Type          | Description                               |
|-------------------|---------------|-------------------------------------------|
| `transaction_id`  | `VARCHAR(50)` | Primary Key                               |
| `ticket_id`       | `VARCHAR(50)` | Foreign Key → `ticket(ticket_id)`         |
| `booking_date`    | `INT`         | Date of transaction                       |
| `transaction_mode`| `VARCHAR(50)` | Payment method                            |
| `status`          | `VARCHAR(50)` | Payment status                            |
| `amount`          | `INT`         | Transaction amount                        |

---

## 👁️ Views

### `Flight_Details`
Displays airplane capacity, weight, and company details.

### `Transaction_Summary`
Summarizes transaction information, including related ticket and passenger data.

---

## ⚡ Triggers

- **`update_availability`**: Updates the ticket's availability status to `'Booked'` after a successful transaction.
- **`insert_transaction`**: Automatically inserts a transaction record when a new ticket is booked.

---

## 🛠️ Stored Procedure

### `GetPassengerDetails`
Retrieves complete information about a passenger based on their ID.

---

## 🔍 Sample Queries

Includes several SQL queries to:
- Retrieve flight schedules
- Fetch passenger details
- Monitor ticket bookings and transactions
- Generate summaries using views

---

## 🧱 Modifications & Schema Management

The project supports:
- Creating/Dropping tables
- Altering table structures
- Adding/Removing views, triggers, and procedures

👉 To create or remove views and triggers, run the corresponding SQL code provided in the relevant sections.

---
