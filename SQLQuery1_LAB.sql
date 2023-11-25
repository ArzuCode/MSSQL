CREATE DATABASE Academy;

use Academy

CREATE TABLE Students (
    id INT PRIMARY KEY IDENTITY(1,1),
    [name] nvarchar(50),
	[surname] nvarchar(50),
	[age] int check (Age>18),
	[Salary] decimal(10,2),
	[Country] nvarchar(50),
)

insert into Students([name],[surname],[age],[Salary],[Country])
values
('Seid','Nuraliyev',33,750,'Azerbaycan'),
('Arzu','Mahmudov',25,660,'Azerbaycan'),
('Sadiq','Nehmetov',40,550,'Azerbaycan'),
('Emil','Abdullayev',53,450,'Azerbaycan'),
('Cavid','Emirov',37,350,'Azerbaycan'),
('Huseyn','Ibadov',65,850,'Azerbaycan'),
('Amil','Eliyev',22,950,'Azerbaycan'),
('Nurlan','Memmedov',15,250,'Azerbaycan'),
('Asim','Agayev',17,150,'Azerbaycan'),
('Niyazi','Babayev',19,50,'Azerbaycan');
 
SELECT * FROM Students WHERE id = 6

UPDATE Students SET name = 'Camal' WHERE id = 5;

SELECT TOP 5 * FROM Students;

SELECT TOP 1 * FROM Students ORDER BY age DESC;

SELECT * FROM Students WHERE SUBSTRING(surname, 1, 1) BETWEEN 'E' AND 'T';

SELECT * FROM Students WHERE country NOT LIKE '%T%';

SELECT SUM(age) AS total_age FROM students;

SELECT * FROM Students ORDER BY age ASC;

SELECT * FROM Students ORDER BY age DESC;

SELECT GETDATE();

SELECT name, country FROM Students WHERE country = 'Fransa';

SELECT SUM(Salary) AS total_salary FROM Students WHERE age > 30;

SELECT AVG(Salary) AS average_salary FROM Students WHERE age < 25;

SELECT DISTINCT country FROM Students;

SELECT country FROM Students WHERE SUBSTRING(name, 3, 1) = 'i';
