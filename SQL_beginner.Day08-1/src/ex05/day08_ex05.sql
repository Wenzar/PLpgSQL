BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;--Session1;
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;--Session2;
SELECT SUM(rating) FROM pizzeria;--Session1;	
UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut';--Session2;
COMMIT WORK; --Session2;
SELECT SUM(rating) FROM pizzeria;--Session1;	
COMMIT WORK;--Session1;	
SELECT SUM(rating) FROM pizzeria;--Session1;	
SELECT SUM(rating) FROM pizzeria;--Session2;	