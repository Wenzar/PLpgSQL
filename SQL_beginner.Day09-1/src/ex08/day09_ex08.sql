CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibonacci_num INTEGER) AS
$$
DECLARE
    a INTEGER := 0;
    b INTEGER := 1;
    fib INTEGER := 0;
BEGIN
    -- Return 0 as the first Fibonacci number
	IF pstop > 0 THEN
    	fibonacci_num := a;
    	RETURN NEXT;
	END IF;
    
    -- Return Fibonacci numbers less than pstop
    WHILE b < pstop LOOP
        fibonacci_num := b;
        fib := a + b;
        a := b;
        b := fib;
        RETURN NEXT;
    END LOOP;
END;
$$
LANGUAGE plpgsql;


SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
