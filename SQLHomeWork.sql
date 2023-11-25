-- Verilənlər bazasını yaratmaq
CREATE DATABASE Store;

-- Brands cədvəlini yaratmaq
USE Store;
CREATE TABLE Brands (
    Id INT PRIMARY KEY,
    Name NVARCHAR(100)
);

-- Laptops cədvəlini yaratmaq
CREATE TABLE Laptops (
    Id INT PRIMARY KEY,
    Name NVARCHAR(100),
    Price DECIMAL(10, 2),
    BrandId INT,
    FOREIGN KEY (BrandId) REFERENCES Brands(Id)
);

-- Phones cədvəlini yaratmaq
CREATE TABLE Phones (
    Id INT PRIMARY KEY,
    Name NVARCHAR(100),
    Price DECIMAL(10, 2),
    BrandId INT,
    FOREIGN KEY (BrandId) REFERENCES Brands(Id)
);

-- Brands cədvəlinə dəyər əlavə etmək
INSERT INTO Brands (Id, Name) VALUES (1, 'Apple');
INSERT INTO Brands (Id, Name) VALUES (2, 'Samsung');
INSERT INTO Brands (Id, Name) VALUES (3, 'Redmi');

-- Laptops cədvəlinə dəyər əlavə etmək
INSERT INTO Laptops (Id, Name, Price, BrandId) VALUES (1, 'MacBook Pro', 2000.00, 1);
INSERT INTO Laptops (Id, Name, Price, BrandId) VALUES (2, 'Galaxy Book', 1500.00, 2);
INSERT INTO Laptops (Id, Name, Price, BrandId) VALUES (3, 'RedmiBook', 800.00, 3);

-- Phones cədvəlinə dəyər əlavə etmək
INSERT INTO Phones (Id, Name, Price, BrandId) VALUES (1, 'iPhone', 1000.00, 1);
INSERT INTO Phones (Id, Name, Price, BrandId) VALUES (2, 'Galaxy S21', 900.00, 2);
INSERT INTO Phones (Id, Name, Price, BrandId) VALUES (3, 'Redmi Note 10', 300.00, 3);

-- Laptops Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query
SELECT L.Name AS LaptopName, B.Name AS BrandName, L.Price
FROM Laptops L
INNER JOIN Brands B ON L.BrandId = B.Id;

-- Phones Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query
SELECT P.Name AS PhoneName, B.Name AS BrandName, P.Price
FROM Phones P
INNER JOIN Brands B ON P.BrandId = B.Id;

-- Brand Adinin Terkibinde s Olan Butun Laptoplari Cixardan Query
SELECT L.* 
FROM Laptops L
INNER JOIN Brands B ON L.BrandId = B.Id
WHERE B.Name LIKE '%s%';

-- Qiymeti 2000 ve 5000 arasi ve ya 5000 den yuksek Laptoplari Cixardan Query
SELECT * 
FROM Laptops
WHERE Price BETWEEN 2000 AND 5000 OR Price > 5000;

-- Qiymeti 1000 ve 1500 arasi ve ya 1500 den yuksek Phonelari Cixardan Query
SELECT * 
FROM Phones
WHERE Price BETWEEN 1000 AND 1500 OR Price > 1500;

-- Her Branda Aid Nece dene Laptop Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query
SELECT B.Name AS BrandName, COUNT(L.Id) AS LaptopCount
FROM Brands B
LEFT JOIN Laptops L ON B.Id = L.BrandId
GROUP BY B.Name;

-- Her Branda Aid Nece dene Phone Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query
SELECT B.Name AS BrandName, COUNT(P.Id) AS PhoneCount
FROM Brands B
LEFT JOIN Phones P ON B.Id = P.BrandId
GROUP BY B.Name;

-- Hem Phone Hem de Laptoplda Ortaq Olan Name ve BrandId Datalarni Bir Cedvelde Cixardan Query
SELECT L.Name, L.BrandId
FROM Laptops L
INNER JOIN Phones P ON L.Name = P.Name AND L.BrandId = P.BrandId;

-- Phone və Laptop cədvəllərindən Id, Name, Price, və BrandId məlumatlarını cədvəldən tapmaq
SELECT Id, Name, Price, BrandId
FROM Phones
UNION ALL
SELECT Id, Name, Price, BrandId
FROM Laptops;

-- Phone və Laptop cədvəllərindən Id, Name, Price, və Brand adını (BrandName kimi) cədvəldən tapmaq
SELECT Phones.Id, Phones.Name, Price, B.Name AS BrandName
FROM Phones
LEFT JOIN Brands B ON Phones.BrandId = B.Id
UNION ALL
SELECT Laptops.Id, Laptops.Name, Price, B.Name AS BrandName
FROM Laptops
LEFT JOIN Brands B ON Laptops.BrandId = B.Id;

-- Phone və Laptop cədvəllərindən Id, Name, Price, və Brand adını (BrandName kimi) cədvəldən tapmaq və qiyməti 1000-dən böyük olan məlumatları cədvəldən tapmaq
SELECT Phones.Id, Phones.Name, Price, B.Name AS BrandName
FROM Phones
LEFT JOIN Brands B ON Phones.BrandId = B.Id
WHERE Price > 1000
UNION ALL
SELECT Laptops.Id, Laptops.Name, Price, B.Name AS BrandName
FROM Laptops
LEFT JOIN Brands B ON Laptops.BrandId = B.Id
WHERE Price > 1000;

-- Phones cədvəlindən Brand adını (BrandName kimi), həmin Brand-da olan telefonların qiymətinin cəmini (TotalPrice kimi) və həmin brand-a aid olan telefonların sayını (ProductCount kimi) cədvəldən tapmaq
SELECT B.Name AS BrandName, SUM(P.Price) AS TotalPrice, COUNT(P.Id) AS ProductCount
FROM Phones P
LEFT JOIN Brands B ON P.BrandId = B.Id
GROUP BY B.Name;

-- Laptops cədvəlindən Brand adını (BrandName kimi), həmin Brand-da olan telefonların qiymətinin cəmini (TotalPrice kimi), həmin brand-a aid olan telefonların sayını (ProductCount kimi) və sayının 3-dən çox olduğu məlumatları cədvəldən tapmaq
SELECT B.Name AS BrandName, SUM(L.Price) AS TotalPrice, COUNT(L.Id) AS ProductCount
FROM Laptops L
LEFT JOIN Brands B ON L.BrandId = B.Id
GROUP BY B.Name
HAVING COUNT(L.Id) > 3;

-- Laptops cədvəlinə əlavə dəyər əlavə etmək
INSERT INTO Laptops (Id, Name, Price, BrandId) VALUES (4, 'MacBook Air', 1200.00, 1);
INSERT INTO Laptops (Id, Name, Price, BrandId) VALUES (5, 'Galaxy Book Pro', 1800.00, 2);
INSERT INTO Laptops (Id, Name, Price, BrandId) VALUES (6, 'RedmiBook Pro', 900.00, 3);

-- Phones cədvəlinə əlavə dəyər əlavə etmək
INSERT INTO Phones (Id, Name, Price, BrandId) VALUES (4, 'iPhone SE', 600.00, 1);
INSERT INTO Phones (Id, Name, Price, BrandId) VALUES (5, 'Galaxy A52', 400.00, 2);
INSERT INTO Phones (Id, Name, Price, BrandId) VALUES (6, 'Redmi 9', 200.00, 3);

-- Laptops və Phones cədvəllərindən məlumatları cədvələrlə birləşdirən query
SELECT L.Name AS LaptopName, L.Price AS LaptopPrice, L.BrandId AS LaptopBrandId, 
       P.Name AS PhoneName, P.Price AS PhonePrice, P.BrandId AS PhoneBrandId
FROM Laptops L
FULL JOIN Phones P ON L.BrandId = P.BrandId;

-- Brand adı və adı "Mac" ilə başlayan məhsulların sayını cədvəldən tapmaq
SELECT B.Name AS BrandName, COUNT(L.Id) AS LaptopCount, COUNT(P.Id) AS PhoneCount
FROM Brands B
LEFT JOIN Laptops L ON B.Id = L.BrandId
LEFT JOIN Phones P ON B.Id = P.BrandId
WHERE B.Name LIKE 'Mac%'
GROUP BY B.Name;

-- Məhsul adı və qiyməti ən yüksək olan məhsulu cədvəldən tapmaq
SELECT 'Laptop' AS ProductType, Name, Price
FROM Laptops
WHERE Price = (SELECT MAX(Price) FROM Laptops)
UNION
SELECT 'Phone' AS ProductType, Name, Price
FROM Phones
WHERE Price = (SELECT MAX(Price) FROM Phones);

-- Məhsul adı və qiyməti ən aşağı olan məhsulu cədvəldən tapmaq
SELECT 'Laptop' AS ProductType, Name, Price
FROM Laptops
WHERE Price = (SELECT MIN(Price) FROM Laptops)
UNION
SELECT 'Phone' AS ProductType, Name, Price
FROM Phones
WHERE Price = (SELECT MIN(Price) FROM Phones);