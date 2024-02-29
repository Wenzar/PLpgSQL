BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;--Session1;
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;--Session2;
UPDATE pizzeria SET rating = 2.5 WHERE id = 1;--Session1;
UPDATE pizzeria SET rating = 1.5 WHERE id = 2;--Session2;
UPDATE pizzeria SET rating = 4.3 WHERE id = 2;--Session1;
UPDATE pizzeria SET rating = 3.5 WHERE id = 1;--Session2;
COMMIT WORK;--Session1;	
COMMIT WORK; --Session2;


