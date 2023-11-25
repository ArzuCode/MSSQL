USE Company;

-- Employees cədvəlini yaratmaq
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    age INT,
    salary DECIMAL(10, 2),
    position VARCHAR(50),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities(id)
);

-- Cities cədvəlini yaratmaq
CREATE TABLE cities (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

-- Countries cədvəlini yaratmaq
CREATE TABLE countries (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Employees cədvəlinə məlumat əlavə etmək
INSERT INTO Employees (id, name, surname, age, salary, position, city_id)
VALUES (1, 'John', 'Doe', 25, 5000.00, 'Manager', 1),
       (2, 'Jane', 'Doe', 30, 6000.00, 'Director', 2),
       (3, 'Mike', 'Smith', 28, 4500.00, 'Salesman', 3),
       (4, 'Emily', 'Johnson', 35, 7000.00, 'Manager', 1),
       (5, 'Chris', 'Lee', 22, 4000.00, 'Intern', 4);

-- Cities cədvəlinə məlumat əlavə etmək
INSERT INTO cities (id, name, country_id)
VALUES (1, 'New York', 1),
       (2, 'London', 2),
       (3, 'Paris', 3),
       (4, 'Berlin', 4);

-- Countries cədvəlinə məlumat əlavə etmək
INSERT INTO countries (id, name)
VALUES (1, 'USA'),
       (2, 'UK'),
       (3, 'France'),
       (4, 'Germany');



SELECT e.name, e.surname, c.name AS city, co.name AS country
FROM Employees e
INNER JOIN cities c ON e.city_id = c.id
INNER JOIN countries co ON c.country_id = co.id;


SELECT e.name, co.name AS country
FROM Employees e
INNER JOIN cities c ON e.city_id = c.id
INNER JOIN countries co ON c.country_id = co.id
WHERE e.salary > 2000;

SELECT c.name AS city, co.name AS country
FROM cities c
INNER JOIN countries co ON c.country_id = co.id;

SELECT *
FROM Employees
WHERE position = 'reservation';
