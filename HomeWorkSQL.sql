CREATE database Kitabxana;

 --Books table-i yaradilmasi
 CREATE TABLE Books ( Id INT PRIMARY KEY, Name NVARCHAR(100) CHECK (LEN(Name) >= 2 AND LEN(Name) <= 100), PageCount INT CHECK (PageCount >= 10) );

-- Authors table-in yaradilmasi
CREATE TABLE Authors ( Id INT PRIMARY KEY, Name NVARCHAR(50), Surname NVARCHAR(50) );

-- Books ve Authors table-larinin mentiqi uygun elaqesi
ALTER TABLE Books add  AuthorId INT, FOREIGN KEY (AuthorId) REFERENCES Authors(Id);

-- View yaradilmasi
CREATE VIEW BookAuthorView AS SELECT b.Id, b.Name, b.PageCount, CONCAT(a.Name, ' ', a.Surname) AS AuthorFullName FROM Books b INNER JOIN Authors a ON b.AuthorId = a.Id;

-- Procedure yazilmasi
CREATE PROCEDURE GetBooksByAuthor @authorName NVARCHAR(50) AS BEGIN SELECT b.Id, b.Name, b.PageCount, CONCAT(a.Name, ' ', a.Surname) AS AuthorFullName FROM Books b INNER JOIN Authors a ON b.AuthorId = a.Id WHERE a.Name = @authorName; END;

-- Insert procedure yaradilmasi
CREATE PROCEDURE InsertAuthor @name NVARCHAR(50), @surname NVARCHAR(50) AS BEGIN INSERT INTO Authors (Name, Surname) VALUES (@name, @surname); END;

-- Update procedure yaradilmasi
CREATE PROCEDURE UpdateAuthor @id INT, @name NVARCHAR(50), @surname NVARCHAR(50) AS BEGIN UPDATE Authors SET Name = @name, Surname = @surname WHERE Id = @id; END;

-- Delete procedure yaradilmasi
CREATE PROCEDURE DeleteAuthor @id INT AS BEGIN DELETE FROM Authors WHERE Id = @id; END;

-- View yaradilmasi
CREATE VIEW AuthorSummary AS SELECT a.Id, CONCAT(a.Name, ' ', a.Surname) AS FullName, COUNT(b.Id) AS BooksCount, MAX(b.PageCount) AS MaxPageCount FROM Authors a LEFT JOIN Books b ON a.Id = b.AuthorId GROUP BY a.Id, a.Name, a.Surname;


